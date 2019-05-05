//
//  NativeTool.h
//  Runner
//
//  Created by 赵优路 on 2019/4/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeTool : NSObject
// 解密
+ (NSString *)AESDencryptText:(NSString *)aesstr;
// 加密
+ (NSString *)AESEncryptText:(NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
