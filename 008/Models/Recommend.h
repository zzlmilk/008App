//
//  Recommend.h
//  008
//
//  Created by zzlmilk on 13-12-27.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface Recommend : NSObject

@property (nonatomic) int recommend_id;
@property (nonatomic) int plan_id;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *created_at;


-(instancetype)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask * )recommendWithBlock:(void(^)(NSArray *recommends,NSError *error))block;


@end
