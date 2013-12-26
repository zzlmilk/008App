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


+(void )BusinessParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *, NSError *))block{
    
    
    
    /*
    parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"planId", nil];
    return [[AppAPIClient sharedClient] GET:@"Information/getPlanByPlanId" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error=%@",error);
    }];
     
     */
    
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"http://192.168.0.107/008/v2/branch/"]];
    
    
    
    
    [manager setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    
    
    [manager setSessionDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession *session, NSURLAuthenticationChallenge *challenge, NSURLCredential *__autoreleasing *credential) {
        return NSURLSessionAuthChallengePerformDefaultHandling;
    }];
    
    
    
    //传值
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"1" forKey:@"planId"];
    
    
    
    
    [manager GET:@"Information/getPlanByPlanId" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        //解析responseObject 已经是一个Dictionary
        //        NSArray *array = (NSArray *)[responseObject objectForKey:@"statuses"];
        //        for (int i = 0; i < array.count; i++) {
        //            Statuses *s = [[Statuses alloc]initWithDic:[array objectAtIndex:i]];
        //
        //            [persons addObject:s];
        //        }
        //
        //        [tableview reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

    
}

@end
