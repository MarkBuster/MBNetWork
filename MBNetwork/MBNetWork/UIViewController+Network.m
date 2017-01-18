//
//  UIViewController+Network.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/17.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "UIViewController+Network.h"
#import <objc/runtime.h>
#import "MBNetworkWebServiceManager.h"

static char associatedNetWorkManagerKey; //用于关联网络请求管理对象

//- (void)setNetworkManager:(MBNetWorkManager *)networkManager {
//   
//}

@implementation UIViewController (Network)
- (MBNetWorkManager *)networkManager {
    return objc_getAssociatedObject(self, &associatedNetWorkManagerKey);
}

- (void)setNetworkManager:(MBNetWorkManager *)networkManager {
    objc_setAssociatedObject(self, &associatedNetWorkManagerKey, networkManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)configNetworkBlock {
    
    if (![self networkManager]) {
        MBNetWorkManager *manager = [[MBNetworkWebServiceManager alloc] init];
        manager.beginRequestBlock = ^(MBNetworkRequestModel *requestModel) {
            [self beginRequestBlockWithRequest:requestModel];
        };
        
        manager.succeedRequestBlock = ^(MBNetworkRequestModel *requestModel, MBNetworkResponseModel *responseModel){
            [self succeedRequestBlockWithRequest:requestModel responseModel:responseModel];
        };
        
        manager.failedRequestBlock = ^(MBNetworkRequestModel *requestModel, MBNetworkResponseModel *responseModel) {
            [self failedRequestBlockWithRequest:requestModel responseModel:responseModel];
        };
        [self setNetworkManager:manager];
    }
}

- (void)requestNetworkWithRequestModel:(MBNetworkRequestModel *)requestModel andResponseModel:(MBNetworkResponseModel *)responseModel {
    [self configNetworkBlock];
    [[self networkManager] requestNetWorkWithRequestModel:requestModel andResponseModel:responseModel];
}


#pragma mark - MBNetworkDelegate
- (void)beginRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel {
    if ([requestModel.activityAlertString length] >0) {
        [self showAlterViewWithContent:requestModel.activityAlertString];
    }
}

- (void)succeedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel *)responseModel {
    NSLog(@"hideAlertView");
}

- (void)failedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel *)responseModel {
    
}

#pragma mark - 
- (void)showAlterViewWithContent:(NSString *)alertString {
    if ([alertString length] >0) {
        NSLog(@"指示器提示");
    }
}
@end
