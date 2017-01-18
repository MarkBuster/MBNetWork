//
//  MBNetworkResponse.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "MBNetworkResponseModel.h"

@interface MBNetworkResponseModel()
@property (nonatomic, weak)id child;
@end
@implementation MBNetworkResponseModel

- (instancetype)init {
    if (self = [super init]) {
        if ([self conformsToProtocol:@protocol(MBResponseModelProtocol)]) {
            self.child = self;
        }
        else
        {
            NSLog(@"子类必须要实现这个ResponseModelProtocol");
            NSAssert(NO, @"子类必须要实现这个ResponseModelProtocol");
        }
    }
    return self;
}

- (void)analysisResponseData:(id)responseData {
    if (responseData)
    {
        NSDictionary *json ;
        if ([responseData isKindOfClass:[NSDictionary class]])
        {
            json = (NSDictionary *)responseData;
        }
        NSLog(@"接口返回的数据＝%@",json);
        if ([json isKindOfClass:[NSDictionary class]])
        {
            NSArray * allkeys = [json allKeys];
            if ([allkeys containsObject:@"r"])
            {
                _r = [[json objectForKey:@"r"] integerValue];
            }
            if ([allkeys containsObject:@"m"])
            {
                _m = [json objectForKey:@"m"];
            }
            if (_r != 0)
            {
                return;
            }
            else
            {
                if ([allkeys containsObject:@"d"])
                {
                    NSDictionary * dDict = [json objectForKey:@"d"];
                    NSArray * dAllkeys = [dDict allKeys];
                    if ([dAllkeys containsObject:@"attrs"])
                    {
                        [self.child analysisAttrs:[dDict objectForKey:@"attrs"]];
                    }
                    if ([dAllkeys containsObject:@"domains"])
                    {
                        [self.child analysisDomains:[dDict objectForKey:@"domains"]];
                    }
                }
            }
        }
        else
        {
            _r = 1;
            _m = @"返回数据格式有误";
        }
        
    }
    else
    {
        _r = 1;
        _m = @"返回数据为空";
    }
}

- (void)analyzeErrorReason
{
    _r = -1;
    _m = @"请检查网络连接情况";
}

@end


@implementation MBNetworkResponseModel (OverRide)

@end
