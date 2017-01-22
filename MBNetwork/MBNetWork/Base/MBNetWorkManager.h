//
//  MBNetWorkManager.h
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBNetworkRequestModel.h"
#import "MBNetworkResponseModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MBNetWorkManagerChildProtocol <NSObject>
@required
- (nonnull NSString *)networkWebServiceURL;
@end

typedef void (^BeginRequestNetworkBlock) ( MBNetworkRequestModel *requestModel);
typedef void (^FailedRequestNetworkBlock) (MBNetworkRequestModel *requestModel, MBNetworkResponseModel *respnseModel);
typedef void (^SucceedRequestNetworkBlock) (MBNetworkRequestModel *requestModel, MBNetworkResponseModel *respnseModel);

@interface MBNetWorkManager : NSObject 

/*! 开始请求block参数 */
@property (nonatomic,nonnull,strong) BeginRequestNetworkBlock beginRequestBlock;
/*! 请求失败block参数 */
@property (nonatomic,nonnull,strong) FailedRequestNetworkBlock failedRequestBlock;
/*! 请求成功block参数 */
@property (nonatomic,nonnull,strong) SucceedRequestNetworkBlock succeedRequestBlock;

- (void)requestNetWorkWithRequestModel:(MBNetworkRequestModel *)requestModel andResponseModel:( MBNetworkResponseModel *)responseModel;

@end

NS_ASSUME_NONNULL_END
