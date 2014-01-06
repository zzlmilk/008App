//
//  AppAPIClient.h
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface AppAPIClient : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
