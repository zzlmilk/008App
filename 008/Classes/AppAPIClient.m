//
//  AppAPIClient.m
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "AppAPIClient.h"

static NSString * const AppAPIBaseURLString = @"https://alpha-api.app.net/";



@implementation AppAPIClient
+(instancetype)sharedClient{
    
    static AppAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AppAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AppAPIBaseURLString]];
        
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });
    
    return _sharedClient;
}

@end
