//
//  INSCommon.h
//  ACInspireDemo
//
//  Created by __zimu on 16/5/21.
//  Copyright © 2016年 ablecloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface INSCommon : NSObject
//获取当前时间
+ (NSString *)ins_currentTime;
//监控网络状态
+ (NSString *)ins_network_status;
//获取指定长度的随机字符串
+ (NSString *)ins_nonce_by_length:(NSInteger)length;
//获取手机的基本信息
+ (NSDictionary *)ins_phone_info;

@end
