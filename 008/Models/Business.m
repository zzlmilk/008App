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

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    
    
    self.address = [dic objectForKey:@"address"];
    self.avg_price = [dic objectForKey:@"avg_price"];
    self.business_id = [dic objectForKey:@"business_id"];
    self.has_deal = [dic objectForKey:@"has_deal"];
    self.latitude = [dic objectForKey:@"latitude"];
    self.longitude = [dic objectForKey:@"longitude"];
    self.name =    [dic objectForKey:@"name"];
    if ([[dic objectForKey:@"plan_photo"] isKindOfClass:[NSNull class]]) {
        self.photo_url = nil;
    }
    else{
        self.photo_url = [dic objectForKey:@"plan_photo"];
    }
    self.state_time = [dic objectForKey:@"state_time"];
    self.telephone = [dic objectForKey:@"telephone"];
    
    return self;
    
}

+(NSURLSessionDataTask *)businessParameters:(NSDictionary *)parameters WithBlock:(void (^)( Business*b, NSError *e))block{
    return [[AppAPIClient sharedClient] GET:@"Information/getPlanByPlanId" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
    //    NSDictionary *businessesDic= [responseObject objectForKey:@"Businesses"];

//        
//        if (responseObject) {
//            Business *b = [[Business alloc]initWithDic:businessesDic];
//
//            block(b,nil);
//        }
 
        if (rexDugSet) {
            
            
            NSLog(@"%@",responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}



@end
