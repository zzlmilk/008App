//
//  Business.m
//  008
//
//  Created by zzlmilk on 13-12-25.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "Business.h"
#import "AppAPIClient.h"

@implementation Business


+(NSURLSessionDataTask* )BusinessParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *, NSError *))block{
    
    
    
    
    parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"planId", nil];
    return [[AppAPIClient sharedClient] GET:@"Information/getPlanByPlanId" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error=%@",error);
    }];
     
     
    
    
    
    
}

@end
