//
//  NLFlutterMethodChannel.m
//  NiceLooTeacher
//
//  Created by 赵优路 on 2019/5/5.
//  Copyright © 2019 NiceLoo. All rights reserved.
//

#import "NLFlutterMethodChannel.h"
#import "NLAnswerStatisticsVC.h"
#import "NativeTool.h"
#import "STController.h"
@implementation NLFlutterMethodChannel

- (void)setchannelNameAESWith:(FlutterViewController *)flutterViewController{
    
    NSString *channelName = @"com.niceloo_teacher_flutter/aes";
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {

        NSLog(@"flutter 给到我：\nmethod=%@ \narguments = %@",call.method,call.arguments);
        if ([call.method isEqualToString:@"AESEncryptText"]) {
            // 回调给flutter
            if (result) {
                NSString *resultStr  =  [NativeTool AESEncryptText:call.arguments];
                result(resultStr);
            }
        } else if ([call.method isEqualToString:@"AESDencryptText"]) {
             NSString *resultStr  =  [NativeTool AESDencryptText:call.arguments];
            result(resultStr);
        }else{
            result(FlutterMethodNotImplemented);
        }
    }];
}
- (void)setchannelNameEventWith:(FlutterViewController *)flutterViewController andVC:(STController *)vc{
    
//    NLAnswerStatisticsVC *statisticsVC = (NLAnswerStatisticsVC *)vc;
    NSString *channelName = @"com.niceloo_teacher_flutter/event";
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        NSLog(@"flutter 给到我：\nmethod=%@ \narguments = %@",call.method,call.arguments);
        if ([call.method isEqualToString:@"pop"]) {
            // 回调给flutter
            [vc.navigationController popViewControllerAnimated:YES];
            
        } else if ([call.method isEqualToString:@"renderDone"]){
            [vc hideloadingView];
        } else{
            result(FlutterMethodNotImplemented);
        }
    }];
}
@end
