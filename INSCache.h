//
//  INSCache.h
//  ACInspireDemo
//
//  Created by __zimu on 16/5/21.
//  Copyright © 2016年 ablecloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INSCache : NSObject

+ (void)cacheAppVersion;

+ (NSString *)cachedAppVersion;

+ (NSString *)currentAppVersion;

+ (BOOL)appFirstInstall;

+ (BOOL)appUpgrade;

@end
