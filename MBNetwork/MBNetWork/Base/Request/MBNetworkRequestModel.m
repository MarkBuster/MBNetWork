//
//  MBNetworkRequest.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "MBNetworkRequestModel.h"

@interface MBNetworkRequestModel () {
   
}

@property (nonatomic, weak) id child;
@end

@implementation MBNetworkRequestModel

- (instancetype)init {
    if (self = [super init]) {
//        if ([self conformsToProtocol:@protocol(MBRequestModelProtocol)]) {
//            self.child = self;
//        }else {
//            NSLog(@"子类必须要实现这个MBRequestModelProtocol");
//            NSAssert(NO, @"子类必须要实现这个MBRequestModelProtocol");
//        }
        _jsonDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (NSDictionary *)analysisDataWithData:(id)responseData {
    if (responseData) {
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&error];
        NSLog(@"json=%@",json);
        if (json&&[json isKindOfClass:[NSDictionary class]]){
            return json;
        }
    }
    return nil;
}

- (NSData *)toJSONData:(id)theData {
    //kNilOptions  请求的json数据不格式化
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:kNilOptions
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil)
    {
        return jsonData;
    }
    else
    {
        return nil;
    }
}
@end

@implementation MBNetworkRequestModel (OverRide)
- (NSString *)getRequestJsonStr {
    return [[NSString alloc] initWithData:[self toJSONData:_jsonDict] encoding:NSUTF8StringEncoding];
}

- (NSString *)networkAPI {
    return @"";
}
@end
