//
//  AppAPIClient.m
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "AppAPIClient.h"


//服务器
static NSString * const AppAPIBaseURLString = @"http://112.124.25.155/008/v2/branch/";

//本地
//static NSString * const AppAPIBaseURLString = @"http://192.168.0.155/008/v2/branch/";


//新浪服务地址
//static NSString * const AppAPIBaseURLString = @"https://api.weibo.com/2/";


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


-(instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    
    //https://github.com/AFNetworking/AFNetworking/issues/1431#issuecomment-25937811
    //为了解决Error Domain=NSURLErrorDomain Code=-999 "cancelled"
    [self setSessionDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession *session, NSURLAuthenticationChallenge *challenge, NSURLCredential *__autoreleasing *credential) {
        return NSURLSessionAuthChallengePerformDefaultHandling;
    }];
    
    return self;
    
}



@end
