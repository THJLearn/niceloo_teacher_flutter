import 'package:flutter/services.dart';

class NLFlutterMethodChannel {

  static setMethodChannelEvent(method){
    const platformMethodChannel = const MethodChannel('com.niceloo_teacher_flutter/event');
    platformMethodChannel.invokeMethod(method,{});
  }

}