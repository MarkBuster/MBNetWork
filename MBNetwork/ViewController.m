//
//  ViewController.m
//  MBNetwork
//
//  Created by yindongbo on 16/9/24.
//  Copyright © 2016年 BusterMark. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFHTTPSessionManager.h>
#import "MBPostMethodRequest.h"

#import "UIViewController+Network.h"

#import "TestRequestModel.h"
#import "TestResponseModel.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestRequestModel *request = [TestRequestModel new];
    TestResponseModel *response = [TestResponseModel new];
    request.requestTag = 1;
    [self requestNetworkWithRequestModel:request andResponseModel:response];
}


#pragma mark - MBNetworkDelegate
- (void)beginRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel {
    [super beginRequestBlockWithRequest:requestModel];
    if (requestModel.requestTag == 1)
    {
        NSLog(@"开始网络请求");
    }
}

- (void)succeedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel *)responseModel {
    [super succeedRequestBlockWithRequest:requestModel responseModel:responseModel];
    if (requestModel.requestTag == 1)
    {
        NSLog(@"请求成功");
    }
}


- (void)failedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel *)responseModel {
    [super failedRequestBlockWithRequest:requestModel responseModel:responseModel];
    if (requestModel.requestTag == 1)
    {
        NSLog(@"请求失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
