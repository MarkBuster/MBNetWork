//
//  MBNetworkWebServiceManager.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "MBNetworkWebServiceManager.h"
#import "MBNetWorkRequestConfiguration.h"
@implementation MBNetworkWebServiceManager

- (NSString *)networkWebServiceURL {
  return [MBNetWorkRequestConfiguration getWebServerURL];
}

@end
