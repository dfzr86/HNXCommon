//
//  INSCommon.m
//  ACInspireDemo
//
//  Created by __zimu on 16/5/21.
//  Copyright © 2016年 ablecloud. All rights reserved.
//

#import "INSCommon.h"
#import "INSCache.h"

@implementation INSCommon

+ (NSString *)ins_currentTime {
    NSDate *date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss."];
    return [[formatter stringFromDate:date] stringByAppendingString:@"000000"];
}


+ (NSString *)ins_network_status {

    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"] subviews];
    NSString *state;
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            switch (netType) {
                case 0:
                    state = @"NULL";
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                    state = @"WIFI";
                    break;
                default:
                    break;
            }
        }
    }
    return state;
}

+ (NSString *)ins_nonce_by_length:(NSInteger)length {
    if (length <= 0) { return nil; }
    char data[length];
    for (int x = 0; x < length; data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:length encoding:NSUTF8StringEncoding];
}

//读取手机信息
+ (NSDictionary *)ins_phone_info {
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    
    //1. app
    NSDictionary *appDict = @{
                              @"version": [INSCache currentAppVersion],
                              @"name": @"ac-Inspire-iOS",
                              };
    [dictM setObject:appDict forKey:@"app"];
    //2. system
    NSDictionary *systemDict = @{
                                 @"os": [[UIDevice currentDevice] systemName],
                                 @"release": [[UIDevice currentDevice] systemVersion],
                                 };
    [dictM setObject:systemDict forKey:@"system"];
    //3. hardware
    NSDictionary *hardWareDict = @{
                                   @"brand": @"iPhone",
                                   @"screen_width": [NSString stringWithFormat:@"%d", (int)[UIScreen mainScreen].bounds.size.width],
                                   @"model": [[UIDevice currentDevice] model],
                                   @"screen_height": [NSString stringWithFormat:@"%d", (int)[UIScreen mainScreen].bounds.size.height],
                                   };
    [dictM setObject:hardWareDict forKey:@"hardware"];
    //4. network
    NSDictionary *networkDict = @{
                                  @"type": [self ins_network_status],
                                  @"type_name": [self ins_network_status],
                                  };
    [dictM setObject:networkDict forKey:@"network"];
    //5. event
    NSDictionary *eventDict = @{
//                                @"timestamp": [self ac_getCurrentTime]
                                };
    [dictM setObject:eventDict forKey:@"event"];
    
    return dictM.copy;
}




@end
