import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/common/fn_method_channel.dart';
import 'package:lifeaste/models/userModel.dart';
import '../globalManager.dart';
import '../hiveManager.dart';
import 'networkResultData.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as XYQ;

final NetRequest netRequest = new NetRequest();

class NetRequest {
  Dio _dio = Dio();
  /// 打印请求的详细log
  bool showDetailLog = true;

  NetResultData handleResult(Response? response, bool isSuccess) {
    Map responseMap = {};
    if (response != null) {
      responseMap = response.data;
      if (!GlobalManager.instance.isDebugServer) {
        if (responseMap.keys.contains('d')) {
          String string = responseMap['d'];
          var key = XYQ.Key.fromUtf8(Info.OOOKey);
          var encrypter = XYQ.Encrypter(XYQ.AES(key, mode: XYQ.AESMode.ecb));
          final iv = IV.fromLength(16);
          var decrypted = encrypter.decrypt64(string, iv: iv);
          Map map = json.decode(decrypted);
          if (map.keys.contains('data')) {
            responseMap = map;
          }
          _log('Net signature result ${map.entries}', true);
        }
      }
    } else {
      isSuccess = false;
    }
    String pageMessage = '';
    if (responseMap.keys.contains('page')) {
      var pageMsg = responseMap['page'];
      if (pageMsg != null) {
        pageMessage = pageMessage.toString();
      }
    }
    if (isSuccess) {
      _log('[http]====请求成功' +
          '====\n' +
          'url:' +
          (response?.requestOptions.method ?? '') +
          ' | ' +
          (response?.requestOptions.uri.toString() ?? '') +
          '\n param:' +
          (response?.requestOptions.queryParameters.toString() ?? '') +
          ' \n result: ' +
          responseMap.toString(), true);
      return NetResultData(
          responseMap['data'],
          isSuccess,
          response?.statusCode ?? 200);
    } else {
      return NetResultData(
          responseMap['data'] ?? {},
          false,
          response?.statusCode ?? 400,
          errorCode: responseMap["code"] ?? 400,
          errorMsg: responseMap['msg'] ?? '');
    }
  }

  Future<NetResultData> postRequest(url, Map<String, dynamic>? params) async {
    if (params != null) {
      params.removeWhere((key, value) => value == null);
    }

    params = fixToJson(params);

    Response response;
    Map<String, dynamic> header = await getHeaderValue(params);
    Options options = Options();
    options.receiveTimeout = 10000;
    options.headers = header;
    if (_dio.interceptors.length <= 0) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    NetResultData resultData;
    try {
      response = await _dio.post(url, data: params, options: options);
      storeSessionHeader(response.headers.map);
      resultData = handleResult(response, true);
    } on DioError catch (e) {
      resultData = handleResult(e.response, false);
      segmentationLog('[http]====请求失败 POST $url\n'+ e.response.toString());
    }
    return resultData;
  }

  Future<NetResultData> getRequest(url, Map<String, dynamic>? params) async {
    if (params != null) {
      params.removeWhere((key, value) => value == null);
      Map<String, dynamic> fixJson = fixToJson(params);
      fixJson.forEach((key, value) {
        params[key] = value.toString();
      });
    }

    Response response;
    var header = await getHeaderValue(params);
    Options options = Options();
    options.receiveTimeout = 10000;
    options.headers = header;
    if (_dio.interceptors.length <= 0) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    NetResultData resultData;
    try {
      response = await _dio.get(url, queryParameters: params, options: options);
      storeSessionHeader(response.headers.map);
      resultData = handleResult(response, true);
    } on DioError catch (e) {
      resultData = handleResult(e.response, false);
      segmentationLog('[http]====请求失败 GET $url\n'+ e.response.toString());
    }
    return resultData;
  }

  Future<NetResultData> putRequest(url, String filePath) async {
    bool result = await Info.methodChannel.invokeMethod(
        methodNameUploadImage, {'url': url, 'filePath': filePath});
    print('====请求result$result');
    if (result) {
      return NetResultData(null, result, 200);
    } else {
      return NetResultData(null, result, 400);
    }
  }

  storeSessionHeader(Map? params) async {
    if (params == null) {
      return;
    }
    String sessionKey = '';
    if (params.containsKey(Info.tokenHeaderKey)) {
      List result = params[Info.tokenHeaderKey];
      if (result.length > 0) {
        sessionKey = result.first;
      }
    }
    if (sessionKey.length > 0) {
      HiveManager.instance.set(Info.requestSessionKey, sessionKey);
    }
  }

  getHeaderValue(Map? params) {
    Map<String, dynamic> headers = Map();
    var sessionKey = HiveManager.instance.get(Info.requestSessionKey);
    if (sessionKey != null) {
      headers.putIfAbsent(Info.tokenHeaderKey, () => sessionKey);
    }
    headers.putIfAbsent('user-info', () => requestUserInfo());
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    headers.putIfAbsent('x-timestamp', () => timestamp.toString());
    String signature = getSignature(params, timestamp.toString());
    headers.putIfAbsent('x-signature', () => signature);
    return headers;
  }

  getSignature(Map? params, String timestamp) {
    String signature = '{}';
    if (params != null) {
      String jsonStr = json.encode(params);
      signature = jsonStr;
    }
    signature = signature + timestamp + 'E318970D1196';
    RegExp exp = new RegExp(r"(\s*)");
    signature = signature.replaceAll(exp, "");
    segmentationLog('Net signature $signature');
    var content = new Utf8Encoder().convert(signature);
    var digest = md5.convert(content);
    segmentationLog('Net signature md5 $digest');
    return digest.toString();
  }

  void _log(String log, bool success) {
    if (success && !showDetailLog) {
      return;
    }
    segmentationLog(log);
  }

  String requestUserInfo() {
    String agent = '';
    var packageInfo = GlobalManager.instance.packageInfo;
    if (Platform.isIOS) {
      agent = AppProductLifeaste + '_ios';
    } else if (Platform.isAndroid) {
      agent = AppProductLifeaste + '_android';
    }
    agent = agent + '_${packageInfo?.version}_${packageInfo?.buildNumber}';
    return agent;
  }
}
