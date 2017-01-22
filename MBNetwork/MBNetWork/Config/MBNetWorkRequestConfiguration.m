//
//  MBNetWorkRequestConfiguration.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "MBNetWorkRequestConfiguration.h"
#import <UIKit/UIKit.h>
#import "UIDevice+IdentifierAddition.h"
@implementation MBNetWorkRequestConfiguration

+ (NSString *)getWebServerURL {
    return WEB_URL;
}


+ (NSString *)getUserAgent {
    NSString *userAgent;
#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)
    // User-Agent Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43
    userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f;ticketCookie:%@;deviceId:%@)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey],
                 [[UIDevice currentDevice] model],
                 [[UIDevice currentDevice] systemVersion],
                 [[UIScreen mainScreen] scale],
                 [[NSUserDefaults standardUserDefaults] stringForKey:@""],
                 [[UIDevice currentDevice] uniqueDeviceIdentifier]];
    
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
    userAgent = [NSString stringWithFormat:@"%@/%@ (Mac OS X %@;ticketCookie:%@;deviceId:%@)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey],
                 [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey],
                 [[NSProcessInfo processInfo] operatingSystemVersionString],
                 [[NSUserDefaults standardUserDefaults] stringForKey:TOKENID],
                 [[UIDevice currentDevice] uniqueDeviceIdentifier]];
#endif
    return userAgent;
}

@end
