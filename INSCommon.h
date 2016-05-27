//
//  INSCommon.h
//  ACInspireDemo
//
//  Created by __zimu on 16/5/21.
//  Copyright © 2016年 ablecloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface INSCommon : NSObject

+ (NSString *)ins_currentTime;

+ (NSString *)ins_network_status;

+ (NSString *)ins_nonce_by_length:(NSInteger)length;

+ (NSDictionary *)ins_phone_info;

@end
