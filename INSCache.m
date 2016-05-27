//
//  INSCache.m
//  ACInspireDemo
//
//  Created by __zimu on 16/5/21.
//  Copyright © 2016年 ablecloud. All rights reserved.
//

#import "INSCache.h"

#define INS_CACHE_VERSION_KEY @"INS_CACHE_VERSION_KEY"


@implementation INSCache

+ (void)cacheAppVersion {
    NSString *currentVersion = [self currentAppVersion];
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:INS_CACHE_VERSION_KEY];
}

+ (NSString *)cachedAppVersion {
    return [[NSUserDefaults standardUserDefaults] objectForKey:INS_CACHE_VERSION_KEY] ?: @"";
}

+ (NSString *)currentAppVersion {
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+ (BOOL)appFirstInstall {
    return [self cachedAppVersion].length == 0;
}
+ (BOOL)appUpgrade {
    if ([self appFirstInstall]) {
        return NO;
    } else {
        return ![[self currentAppVersion] isEqualToString:[self cachedAppVersion]];
    }
}

@end
