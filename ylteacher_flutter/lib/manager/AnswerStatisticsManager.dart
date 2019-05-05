import 'dart:convert';
import 'package:ylteacher_flutter/request/HttpRequest.dart';

class AnswerStatisticsManager {

  static Future QuestionList(params) async {
    Map requestParams = {
      "ItemsPerPage": 10,
      "page": 1,
      "type": 1,
    };
    var res = await HttpReuest.postRequest("http://192.168.11.221:8100/api/Question/List", requestParams);
    Map resMap = json.decode(res);
    List dataList = [];
    if(resMap["Code"]=="1"){
      dataList = resMap["Data"];
    }
    return dataList;
  }
}