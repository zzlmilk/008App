//
//  Recommend.m
//  008
//
//  Created by zzlmilk on 13-12-27.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "Recommend.h"
#import "AppAPIClient.h"

@implementation Recommend

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    self.title = [dic objectForKey:@"title"];
   // self.title = @"外滩一日";
    self.recommend_id = [[dic objectForKey:@"id"] integerValue];
    self.plan_id = [[dic objectForKey:@"plan_id"] integerValue];
    self.url = [dic objectForKey:@"url"];
//    self.url = @"banner1";
    
    
    return self;
}
+(NSURLSessionDataTask*)recommendWithBlock:(void (^)(NSArray *, NSError *))block{
    
    return [[AppAPIClient sharedClient]GET:@"Information/getRecommendPlan" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *recommendsArray = [responseObject objectForKey:@"recommends"];
        NSMutableArray *recommends = [NSMutableArray array];
        
        if ([recommendsArray isKindOfClass:[NSArray class]]) {
            for (int i =0; i<recommendsArray.count; i++) {
                Recommend * recommend = [[Recommend alloc]initWithDic:[recommendsArray objectAtIndex:i]];
                [recommends addObject:recommend];
            }
            
            
            block(recommends,nil);
            if (rexDugSet) {
                NSLog(@"%@",responseObject);    
            }

            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"%@",error);
    }];
}

@end
