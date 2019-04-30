import 'dart:collection';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'Code.dart';
import 'ResultData.dart';
class Api {

  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "aCupertinoTabBarpplication/x-www-form-urlencoded";

  Dio _dio = new Dio(); // 使用默认配置

  static const platformMethodChannel = const MethodChannel('com.youlueducation/aes');

  netFetch(url, params, Options option, {isEncrypt:true,onTip:false}) async {

    Map<String, dynamic> headers = new HashMap();
    headers["ClientType"] = 1;

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }
    Response response;
    try {

      if(isEncrypt){
        var result =  await platformMethodChannel.invokeMethod('AESEncryptText',params);// 2加密 //参数暂时写死，为调试用
        response = await _dio.request(url, data: result, options: option);
        var resultRes =  await platformMethodChannel.invokeMethod('AESDencryptText',response.data);// 解密
        print("resultRes-------------");
        print(resultRes);
        print("-------------resultRes");
        return resultRes;
      }else{
        response = await _dio.request(url, data: json.encode(params), options: option);
        return response.data;
      }

    } on DioError catch (e) {
      print(e);
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, onTip), false, errorResponse.statusCode);
    }
  }
}
final Api api = new Api();