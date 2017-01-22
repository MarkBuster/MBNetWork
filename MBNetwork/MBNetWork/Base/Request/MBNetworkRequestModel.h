//
//  MBNetworkRequest.h
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBNetworkRequestModel : NSObject {
    @protected
    NSMutableDictionary * _jsonDict;
}

@property (nonatomic, assign) NSInteger requestTag; //!< 用来区分网络请求的不同对象
@property (nonatomic, copy) NSString *alertString; //!< 吐丝提示语
@property (nonatomic, copy) NSString *activityAlertString;//!< 指示器提示语


- (NSDictionary *)analysisDataWithData:(id)responseData;
@end


//子类需要重写的方法放到OverRide分类中
@interface MBNetworkRequestModel (OverRide)
/*!
 @abstract 获取请求网络的json串
 @method getRequestJsonStr
 @return 返回网络请求的json串
 */
- (NSString *)getRequestJsonStr;

/*!
 @abstract 获取请求网络的接口标示
 @method networkAPI
 @return 返回网络请求接口标示
 */
- (NSString *)networkAPI;
@end
