//
//  User.m
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "User.h"
#import "AppAPIClient.h"
#import "Error.h"

@implementation User

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    
  //  self.tag_name = [dic objectForKey:@"regions_name"];
    
    self.userEmail = [dic objectForKey:@"userEmail"];
    self.userName  = [dic objectForKey:@"userName"];
    self.userPassword = [dic objectForKey:@"userPassword"];
    self.userNickName = [dic objectForKey:@"userNickName"];
    
    return self;

}

//用户注册网络请求
+(NSURLSessionDataTask *)userRegisterParameters:(NSDictionary *)parameters WithBlock:(void (^)(User *user, Error *e))block{
    
    return [[AppAPIClient sharedClient] GET:@"user/userRegistration" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (rexDugSet) {
            NSLog(@"%@",responseObject);
        }
        
        if ([responseObject objectForKey:@"error"]) {
            Error *error = [[Error alloc]init];
            error.errorStatus =[[responseObject objectForKey:@"error"] objectForKey:@"error_status"];
            error.statusInfo =[[responseObject objectForKey:@"error"] objectForKey:@"status_info"];
            
            
            NSLog(@"%@",error);
            
            User *u;
            
            block(u,error);
        }
        else{

//            NSArray *responseObjectArray = (NSArray *)responseObject;
            
            User *p ;//= [[User alloc]initWithDic:[responseObjectArray objectAtIndex:i]];
                

            block(p, nil);

        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}

//用户登录网络请求
+(NSURLSessionDataTask *)userLoginParameters:(NSDictionary *)parameters WithBlock:(void (^)(User *user, NSError *e))block{

    return [[AppAPIClient sharedClient] GET:@"Information/AllRegionsInformation" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}

@end
