//
//  Regions.m
//  008
//
//  Created by 单好坤 on 14-1-9.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "Regions.h"
#import "AppAPIClient.h"

@implementation Regions

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    
    self.regionsName = [dic objectForKey:@"regions_name"];
    self.regionsId = [dic objectForKey:@"id"];
    return self;
    
}

+(NSURLSessionDataTask *)allRegionsParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *,NSError *))block {
    return [[AppAPIClient sharedClient] GET:@"Information/getRegionsInformationWithDistrictId" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
      
        if (rexDugSet) {
             NSLog(@"%@",responseObject);
        }
        //返回书局格式有误
        NSMutableArray *regions = [NSMutableArray array];
        
       // NSArray *responseObjectArray = [responseObject objectForKey:@"regions_name"];
        NSArray *responseObjectArray = responseObject;
        
        
        for (int i =0; i<responseObjectArray.count; i++) {
            
            Regions *r = [[Regions alloc]initWithDic:[responseObjectArray objectAtIndex:i]];
            
            [regions addObject:r];//
        }
        
        block(regions, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}
@end
