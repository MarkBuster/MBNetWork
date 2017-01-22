//
//  TestRequestModel.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/17.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "TestRequestModel.h"

@implementation TestRequestModel
- (NSString *)networkAPI {
    return @"service/tabs";
}

- (NSString *)getRequestJsonStr {
    _jsonDict = [[self params] mutableCopy];
    return [super getRequestJsonStr];
}


- (NSDictionary *)params {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"tag"] = @"joke";
    params[@"iid"] = @"5316804410";
    params[@"os_version"] = @"9.3.4";
    params[@"os_api"] = @"18";
    
    params[@"app_name"] = @"joke_essay";
    params[@"channel"] = @"App Store";
    params[@"device_platform"] = @"iphone";
    params[@"idfa"] = @"832E262C-31D7-488A-8856-69600FAABE36";
    params[@"live_sdk_version"] = @"120";
    
    params[@"vid"] = @"4A4CBB9E-ADC3-426B-B562-9FC8173FDA52";
    params[@"openudid"] = @"cbb1d9e8770b26c39fac806b79bf263a50da6666";
    params[@"device_type"] = @"iPhone 6 Plus";
    params[@"version_code"] = @"5.5.0";
    params[@"ac"] = @"WIFI";
    params[@"screen_width"] = @"1242";
    params[@"device_id"] = @"10752255605";
    params[@"aid"] = @"7";
    params[@"count"] = @"50";
    params[@"max_time"] = [NSString stringWithFormat:@"%.2f", [[NSDate date] timeIntervalSince1970]];
    
    if ([params.allKeys containsObject:@"nh_delegate"])
    {
        [params removeObjectForKey:@"nh_delegate"];
    }
    
    if ([params.allKeys containsObject:@"nh_isPost"])
    {
        [params removeObjectForKey:@"nh_isPost"];
    }
    
    if ([params.allKeys containsObject:@"nh_url"])
    {
        [params removeObjectForKey:@"nh_url"];
    }
 
    return params;
}

@end
