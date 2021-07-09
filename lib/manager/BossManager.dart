import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:encrypt/encrypt.dart' as XYQ;
import 'package:crypto/crypto.dart';
import 'package:lifeaste/common/events.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/info.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/models/bossConfigModel.dart';
import 'package:lifeaste/models/orderModel.dart';

import 'hiveManager.dart';

enum EventSaleState {
  off,
  coming,
  on,
}

class BossManager {
  Dio _dio = Dio();

  static BossManager get instance => _getInstance();
  static BossManager? _instance;

  bool isSynced = false;
  int _retryTimes = 0;
  BossConfigModel bossConfig = BossConfigModel.fromJson({});

  static BossManager _getInstance() {
    var obj = _instance ?? BossManager();
    if (_instance == null) {
      _instance = obj;
    }
    return obj;
  }

  void requestConfig() async {
    // print('requestBossConfig');
    // int timestamp = DateTime.now().millisecondsSinceEpoch;
    // Map<String, dynamic> param = {
    //   "client_name": "iOS_Genescope",
    //   "client_version": Global.logic().state.packageInfo?.version,
    //   "env": Global.logic().isDebugEnv() ? "dev" : "app",
    //   "category": "app_info_config",
    //   "timestamp": timestamp.toString(),
    // };
    // String accessKey = generateAccessKey(param);
    // String url = Info.BossURL + '/api/conf?accesskey=' + accessKey;
    // try {
    //   var response = await _dio.post(url, data: param, options: null);
    //   Map<String, dynamic> responseMap = response.data;
    //   if (responseMap.keys.contains('d')) {
    //     String string = responseMap['d'];
    //     var key = XYQ.Key.fromUtf8('9g8ndXVCDLxUc3rF');
    //     var encrypter = XYQ.Encrypter(XYQ.AES(key, mode: XYQ.AESMode.ecb));
    //     final iv = IV.fromLength(16);
    //     var decrypted = encrypter.decrypt64(string, iv: iv);
    //     Map<String, dynamic> map = json.decode(decrypted);
    //     responseMap = map;
    //   }
    //   isSynced = true;
    //   print('requestBossConfig success');
    //   try {
    //     bossConfig = BossConfigModel.fromJson(responseMap);
    //   } on Exception catch(e) {
    //     print(e.toString());
    //   }
    //   eventBus.fire(BossConfigUpdateEvent());
    //   _retryTimes = 0;
    // } on DioError catch (e) {
    //   Duration duration = Duration(seconds: min(_retryTimes * 3 + _retryTimes ~/ 3 * 6, 120));
    //   Future.delayed(duration, (){
    //     requestConfig();
    //   });
    //   _retryTimes++;
    //   print('requestBossConfig failed, ${e.toString()}');
    // }
  }

  String generateAccessKey(Map? params) {
    String rawKey = "ATX";
    String key = md5.convert(Utf8Encoder().convert(rawKey)).toString();
    if (params != null) {
      String jsonStr = json.encode(params);

      String str = jsonStr + key;
      var content = new Utf8Encoder().convert(str);
      var digest = md5.convert(content);
      return digest.toString();
    }
    return "";
  }

  ///促销状态有三种：木有促销、预告、促销中
  ///促销1天前开始预告
  EventSaleState eventSaleState() {
    EventSaleConfig? config = bossConfig.appInfoConfig.eventSaleConfig;
    //配置有误
    if (config.endTime <= config.startTime) {
      return EventSaleState.off;
    }
    //超过了endTime，促销结束。
    if (DateTime.now().millisecondsSinceEpoch >= config.endTime) {
      return EventSaleState.off;
    }
    //没有超过endTime->
    //超过了startTime，促销进行中。
    if (DateTime.now().millisecondsSinceEpoch >= config.startTime) {
      return EventSaleState.on;
    }
    //没有超过startTime->
    //距离开始不足一天，开始预告。
    if (config.startTime - DateTime.now().millisecondsSinceEpoch <
        Duration.millisecondsPerDay) {
      return EventSaleState.coming;
    }
    //距离超过一天，远没有开始。
    return EventSaleState.off;
  }

  double eventSaleDiscount({@required int? serviceType}) {
    if (serviceType == null || eventSaleState() != EventSaleState.on) {
      return 1;
    }
    double off = 0;
    switch (ServiceType.values[serviceType]) {
      case ServiceType.serviceTypeText:
        {
          off = bossConfig.appInfoConfig.eventSaleConfig.textOff;
          break;
        }
      case ServiceType.serviceTypeAudio:
        {
          off = bossConfig.appInfoConfig.eventSaleConfig.audioOff;
          break;
        }
      case ServiceType.serviceTypeVideo:
        {
          off = bossConfig.appInfoConfig.eventSaleConfig.videoOff;
          break;
        }
      case ServiceType.serviceTypeTextCall:
        {
          off = bossConfig.appInfoConfig.eventSaleConfig.textCallOff;
          break;
        }
      case ServiceType.serviceTypeAudioCall:
        {
          off = bossConfig.appInfoConfig.eventSaleConfig.audioCallOff;
          break;
        }
      case ServiceType.serviceTypeVideoCall:
        {
          off = bossConfig.appInfoConfig.eventSaleConfig.videoCallOff;
          break;
        }
      default:
        {}
    }
    if (off > 0 && off < 1) {
      return 1 - off;
    } else {
      return 1;
    }
  }

  bool hasDiscount({@required int? serviceType}) {
    if (serviceType == null) return false;
    return eventSaleDiscount(serviceType: serviceType) > 0 &&
        eventSaleDiscount(serviceType: serviceType) < 1;
  }

  /// 有实时服务的主题折扣
  bool hasRealtimeSale() {
    return hasDiscount(serviceType: ServiceType.serviceTypeTextCall.index) ||
        hasDiscount(serviceType: ServiceType.serviceTypeAudioCall.index) ||
        hasDiscount(serviceType: ServiceType.serviceTypeVideoCall.index);
  }

  /// 有非实时服务的主题折扣
  bool hasReadingSale() {
    return hasDiscount(serviceType: ServiceType.serviceTypeText.index) ||
        hasDiscount(serviceType: ServiceType.serviceTypeAudio.index) ||
        hasDiscount(serviceType: ServiceType.serviceTypeVideo.index);
  }

  String inviteRewardStr() {
    // ignore: unnecessary_null_comparison
    if (bossConfig.appInfoConfig.inviteReward != null) {
      return bossConfig.appInfoConfig.inviteReward + ' ';
    } else {
      return '';
    }
  }

  String beInvitedRewardStr() {
    if (bossConfig.appInfoConfig.beInvitedReward.isNotEmpty) {
      return bossConfig.appInfoConfig.beInvitedReward + ' ';
    } else {
      return '';
    }
  }

  String ourWebsiteLink() {
    return bossConfig.appInfoConfig.webLinkNew;
  }

  bool canShowWebsiteBanner(bool dialog) {
    if (!getFlower()) return false;
    if (Global.userLogic().state.user.orderCompleted <= 0) {
      return false;
    }
    if (dialog) {
      return bossConfig.appInfoConfig.showToWebsiteBannerDialog;
    } else {
      return bossConfig.appInfoConfig.showToWebsiteBannerScreen;
    }
  }

  String discoverTitle({bool forDialog = false}) {
    if (Global.userLogic().state.user.orderCompleted <= 0) {
      String value = bossConfig.appInfoConfig.discoverBannerTitleForNewUser;
      if (forDialog) {
        value = bossConfig.appInfoConfig.discoverDialogTitleForNewUser;
      }
      if (value.isEmpty) {
        value = Strings.recommendTitleNewUser(forDialog);
      }
      return value;
    } else {
      String value = bossConfig.appInfoConfig.discoverBannerTitleForOldUser;
      if (forDialog) {
        value = bossConfig.appInfoConfig.discoverDialogTitleForOldUser;
      }
      if (value.isEmpty) {
        value = Strings.recommendTitleOldUser(forDialog);
      }
      return value;
    }
  }

  /// 1.神婆用户间实时聊天
  /// 2.用户向神婆下单时，填写订单信息表（general situation+specific question）
  /// 3.用户回复追问
  /// 4.神婆用户非实时聊天
  /// 5.增值服务聊天
  List<String> limitWordsScene1() {
    List<String> config = bossConfig.appInfoConfig.limitWordsScene1;
    if (config.isNotEmpty) return config;
    return [
      'PayPal',
      'PPal',
      'PAY PAL',
      'PP',
      'Cashapp',
      'Cash app',
      'Venom',
      'Zelle',
      'Black magic',
      'Blackmagic',
      'Black spell',
      'Blackspell',
      'Witchcraft',
      'witch craft',
      'Witch',
      'Witching',
      'Wizard',
      'Witchery',
      'Spell craft',
      'spellcraft',
      'Paganism',
      'Spell casting',
      'spellcasting',
      'Necromancy',
      'Accusation',
      'Demonology',
      'Sorcery',
      'Removal spell',
      'Removalspell',
    ];
  }

  String getFaqLink() {
    return bossConfig.appInfoConfig.baseLink + Info.faqRoute;
  }
}
