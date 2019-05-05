//
//  NativeTool.m
//  Runner
//
//  Created by 赵优路 on 2019/4/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "NativeTool.h"
#import "AES.h"
#import "NLUserManager.h"
@implementation NativeTool
//加密
+ (NSString *)AESEncryptText:(NSDictionary *)params{
//    NSDictionary * dic = @{@"UserName":@"18301379671",@"MachineCode":@"",@"Version":@"2.1.2",@"UserKey":@"",@"Simulator":@"PhoneBrand",@"Password":@"123456"};
    NSMutableDictionary *addDict = @{}.mutableCopy;
    if (params) {
        [addDict addEntriesFromDictionary:params];
    }
    [addDict setValue:NLUserManager.getDeviceId forKey:@"DeviceId"];
    [addDict setValue:NLUserManager.getEmployeeId forKey:@"EmployeeId"];
    NSString * ncryptStr = [NativeTool dictionaryToJson:addDict];
    NSString *ncryptStrRes = [AES AESEncryptText:ncryptStr];
    return [ncryptStrRes uppercaseString];
}
// 解密
+ (NSString *)AESDencryptText:(NSString *)aesstr{
    NSData *data = [AES AESDencryptText:aesstr];
    NSString *receiveStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSDictionary *dic = [NativeTool dictionaryWithData:data];
    return receiveStr;
}
#pragma mark 字典转化字符串
+(NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
#pragma mark 字典转化字符串
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma mark data转化dic
+(NSDictionary*)dictionaryWithData:(NSData*)data {
    
    NSString *receiveStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    return jsonDict;
}

@end
