//
//  UIViewController+Network.h
//  MBNetwork
//
//  Created by yindongbo on 17/1/17.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBNetworkRequestModel;
@class MBNetworkResponseModel;
@interface UIViewController (Network)


- (void)requestNetworkWithRequestModel:(MBNetworkRequestModel *)requestModel andResponseModel:(MBNetworkResponseModel *)responseModel;




/*!
 @abstract 开始网络请求回调方法
 @method - (void)beginRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel;
 @param requestModel NetworkRequestModel 请求Model
 
 */
- (void)beginRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel;

/*!
 @abstract 请求数据成功回调此方法
 @method - (void)succeedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel *)responseModel;
 @param requestModel NetworkRequestModel 请求Model
 @param responseModel NetworkResponseModel 返回数据
 
 */
- (void)succeedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel *)responseModel;

/*!
 @abstract 请求数据失败回调此方法
 @method - (void)failedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel*)responseModel;
 @param requestModel NetworkRequestModel 请求Model
 @param responseModel NetworkResponseModel 返回的错误信息
 
 */
- (void)failedRequestBlockWithRequest:(MBNetworkRequestModel *)requestModel responseModel:(MBNetworkResponseModel*)responseModel;
@end
