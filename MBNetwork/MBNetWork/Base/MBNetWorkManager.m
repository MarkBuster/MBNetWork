//
//  MBNetWorkManager.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "MBNetWorkManager.h"
#import <AFNetworking.h>
#import "MBPostMethodRequest.h"

@interface MBNetWorkManager ()
@property (nonatomic, weak)id child;
@end

@implementation MBNetWorkManager

- (void)requestNetWorkWithRequestModel:(MBNetworkRequestModel *)requestModel andResponseModel:(MBNetworkResponseModel *)responseModel {
    if ([self conformsToProtocol:@protocol(MBNetWorkManagerChildProtocol)])
    {
        self.child = self;
    }
    else
    {
        NSAssert(NO, @"必须实现MBNetWorkManagerChildProtocol中的协议");
    }
    
    if (_beginRequestBlock)
    {
        _beginRequestBlock(requestModel);
    }
    
    NSLog(@"%@ ",[self.child networkWebServiceURL]);
    
    MBPostMethodRequest *request = [[MBPostMethodRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[self.child networkWebServiceURL],[requestModel networkAPI]]]];
    [request setHTTPBody:[[requestModel getRequestJsonStr] dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    NSURLSessionTask *task = [NSURLSessionTask new];
    task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
    {
        if (error)
        {
            [responseModel analyzeErrorReason];
            if (_failedRequestBlock)
            {
                self.failedRequestBlock(requestModel, responseModel);
            }
            return ;
        }
        
        [responseModel analysisResponseData:responseObject];
        if (_succeedRequestBlock)
        {
            self.succeedRequestBlock(requestModel, responseModel);
        }
    }];
    [task resume];
}

@end
