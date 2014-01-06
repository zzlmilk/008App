//
//  Business.h
//  008
//
//  Created by zzlmilk on 13-12-25.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Business : NSObject
{}


@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *avg_price;
@property(nonatomic,strong)NSString *business_id;
@property(nonatomic,strong)NSString *has_deal;
@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *longitude;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *photo_url;
@property(nonatomic,strong)NSString *state_time;
@property(nonatomic,strong)NSString *telephone;


-(instancetype)initWithDic:(NSDictionary *)dic;


//通过路线ID获取指定路线
+(NSURLSessionDataTask *)businessParameters:(NSDictionary *)parameters WithBlock:(void (^)(Business *b, NSError *e))block;


//+(NSURLSessionDataTask *)BusinessParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *, NSError *))block;

@end
