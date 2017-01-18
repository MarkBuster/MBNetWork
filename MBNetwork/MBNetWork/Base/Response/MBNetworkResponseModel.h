//
//  MBNetworkResponse.h
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MBResponseModelProtocol <NSObject>

@required
- (void)analysisAttrs:(NSDictionary *)attrsDict;

- (void)analysisDomains:(NSDictionary *)domainDict;
@end

@interface MBNetworkResponseModel : NSObject

@property (nonatomic, readonly) NSInteger r; // 返回码 （0:成功 ， >0错误）
@property (nonatomic, readonly) NSString *m; // 如果错误，返回错误信息

/*!
 @abstract 解析网络返回数据
 @method - (void)analysisResponseData:(id)responseData
 @param responseData id 网络返回数据
 */
- (void)analysisResponseData:(id)responseData;

/*!
 @abstract 分析失败原因，一般是在网络请求失败的情况下来进行分析
 @method - (void)analyzeErrorReason
 */
- (void)analyzeErrorReason;
@end


@interface MBNetworkResponseModel (OverRide)

@end
