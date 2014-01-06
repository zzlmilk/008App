//
//  User.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLoginViewController.h"
#import "UserRegisterViewController.h"
@class Error;

@interface User : NSObject

@property(nonatomic,strong)NSString *userEmail;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *userPassword;
@property(nonatomic,strong)NSString *userNickName;

//@property(nonatomic,strong)NSString *tag_name;


+(NSURLSessionDataTask *)userRegisterParameters:(NSDictionary *)parameters WithBlock:(void (^)(User *user, Error *e))block;

+(NSURLSessionDataTask *)userLoginParameters:(NSDictionary *)parameters WithBlock:(void (^)(User *user, NSError *e))block;

@end
