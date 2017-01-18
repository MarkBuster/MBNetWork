//
//  MBPostMethodRequest.m
//  MBNetwork
//
//  Created by yindongbo on 17/1/16.
//  Copyright © 2017年 BusterMark. All rights reserved.
//

#import "MBPostMethodRequest.h"
#import "MBNetWorkRequestConfiguration.h"
@implementation MBPostMethodRequest


- (instancetype)initWithURL:(NSURL *)URL
{
    if (self = [super initWithURL:URL]) {
        [self setHTTPMethod:@"POST"];
        NSString *contentType = [NSString stringWithFormat:@"text/xml"];
        [self addValue:contentType forHTTPHeaderField:@"Content-Type"];
//        [self setValue:[MBNetWorkRequestConfiguration getUserAgent] forHTTPHeaderField:@"User-Agent"];
    }
    return self;
}

@end
