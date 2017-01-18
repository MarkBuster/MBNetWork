//
//  MBNetWorkRequestConfiguration.h
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBNetWorkRequestConfiguration : NSObject

/*!
 @abstract:获取服务器地址
 @return NSURL 服务器地址
 */
+ (NSString *)getWebServerURL;

/**
 @abstract:获取UserAgent
 @return NSString 具体的Agent字符串
 */
+ (NSString *)getUserAgent;

@end
