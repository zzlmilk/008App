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
    
    self.plan_id = [dic objectForKey:@"plan_id"];
    self.title  = [dic objectForKey:@"title"];
    self.url = [dic objectForKey:@"url"];

    return self;
}

#pragma mark --



@end
