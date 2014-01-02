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

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];

    self.plan_id = [dic objectForKey:@"id"];
    self.title  = [dic objectForKey:@"characteristic"];
    self.url = [dic objectForKey:@"plan_photo"];
    self.avgConsume = [dic objectForKey:@"avg_consume"];
    return self;
}

+(NSURLSessionDataTask *)plansBycollectionParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *, NSError *))block{
    return [[AppAPIClient sharedClient]GET:@"Information/getPlanByTypeId" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (rexDugSet) {
            NSLog(@"%@",responseObject);
        }
        
        NSMutableArray *plans = [NSMutableArray array];
        NSArray *responseObjectArray = (NSArray *)responseObject;
        for (int i =0; i<responseObjectArray.count; i++) {
            Plan *p = [[Plan alloc]initWithDic:[responseObjectArray objectAtIndex:i]];
            [plans addObject:p];
        }
        
        block(plans , nil);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error);
    }];
}

#pragma mark --



@end
