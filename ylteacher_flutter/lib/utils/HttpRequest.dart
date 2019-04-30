import 'package:dio/dio.dart';
import 'Api.dart';
import 'DataResult.dart';

class HttpReuest{

  static Future postRequest(String url,  params, {isEncrypt:true}) async {

    var response = await api.netFetch(url, params, new Options(method: "post"),isEncrypt: isEncrypt);

    return response;
  }

  static Future getRequest(String url,params,{isEncrypt:true}) async{
    var response = await api.netFetch(url, params, new Options(method: "get"),isEncrypt: isEncrypt);
    return   response;
  }


}
