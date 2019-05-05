//
//  NLFlutterMethodChannel.h
//  NiceLooTeacher
//
//  Created by 赵优路 on 2019/5/5.
//  Copyright © 2019 NiceLoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
@class STController;
NS_ASSUME_NONNULL_BEGIN

@interface NLFlutterMethodChannel : NSObject
- (void)setchannelNameAESWith:(FlutterViewController *)flutterViewController;
- (void)setchannelNameEventWith:(FlutterViewController *)flutterViewController andVC:(STController *)vc;
@end

NS_ASSUME_NONNULL_END
