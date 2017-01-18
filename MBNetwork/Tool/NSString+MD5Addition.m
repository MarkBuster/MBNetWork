//
//  NSString+MD5Addition.m
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import "NSString+MD5Addition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(MD5Addition)
- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        if (count==3||count==5||count==7||count==9) {
            [outputString appendFormat:@"%02x-",outputBuffer[count]];
        }else{
            [outputString appendFormat:@"%02x",outputBuffer[count]];
        }
        
    }
    
    return outputString;
}
- (NSString *) stringFromMD5:(BOOL)appendSpacer{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        if (appendSpacer&&(count==3||count==5||count==7||count==9)) {
            [outputString appendFormat:@"%02x-",outputBuffer[count]];
        }else{
        [outputString appendFormat:@"%02x",outputBuffer[count]];
        }
    
    }
    
    return outputString;
}

@end
