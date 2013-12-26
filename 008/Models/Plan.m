//
//  Plan.m
//  008
//
//  Created by zzlmilk on 13-12-24.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "Plan.h"
#import "AppAPIClient.h"
@implementation Plan



#pragma mark --
+(NSURLSessionDataTask *)plansWithBlock:(void (^)(NSArray *, NSError *))block{
    return [[AppAPIClient sharedClient] GET:@"" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
@end
