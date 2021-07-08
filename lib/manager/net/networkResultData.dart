
class NetResultData{
  var data;
  bool result;
  int code;
  int? errorCode;
  String? errorMsg;
  NetResultData(this.data,this.result,this.code, {this.errorCode , this.errorMsg});

  ///服务器配置了特殊的错误信息
  ///报错时客户端直接显示对应的信息给用户看
  ///错误码规则是：错误码为五位数，前三位是400
  bool specErrorMsg() {
    if (errorCode.toString().length == 5 &&
        errorCode.toString().substring(0, 3) == '400' &&
        errorMsg?.isNotEmpty == true) {
      return true;
    }
    return false;
  }
}
