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
  
    
    if ([[dic objectForKey:@"plan_photo"] isKindOfClass:[NSNull class]]) {
        self.url = nil;
    }
    else{
        self.url = [dic objectForKey:@"plan_photo"];
        }
    
    self.avgConsume = [dic objectForKey:@"avg_consume"];
    
    //如果有businesses
    if ([dic objectForKey:@"businesses"]) {
        NSArray *businessesArray =[dic objectForKey:@"businesses"];
        _busineses  = [NSMutableArray array];
        for (int i =0; i<businessesArray.count; i++) {
            Business *b = [[Business alloc]initWithDic:[businessesArray objectAtIndex:i]];
            [_busineses addObject:b];
        }
        
    }
    
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
        NSLog(@"%@",[error.userInfo objectForKey:@"JSONResponseSerializerWithDataKey"]);

    }];
}

+(NSURLSessionDataTask *)planDeatailByIdParameters:(NSDictionary *)parameters WithBlock:(void (^)(Plan *plan, NSError *e))block{
    return [[AppAPIClient sharedClient] GET:@"Information/getPlanByPlanId" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (rexDugSet) {
              NSLog(@"%@",responseObject);
        }
        Plan *p = [[Plan alloc]initWithDic:responseObject];
        block(p,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"%@",error);
    }];
}


#pragma mark --
@end
