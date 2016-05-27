//
//  INSCache.h
//  ACInspireDemo
//
//  Created by __zimu on 16/5/21.
//  Copyright © 2016年 ablecloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INSCache : NSObject
//缓存当前系统版本
+ (void)cacheAppVersion;
//获取缓存的系统版本
+ (NSString *)cachedAppVersion;
//获取当前系统版本
+ (NSString *)currentAppVersion;
//app是否是第一次安装
+ (BOOL)appFirstInstall;
//app是否升级了版本
+ (BOOL)appUpgrade;

@end
