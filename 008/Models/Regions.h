//
//  Regions.h
//  008
//
//  Created by 单好坤 on 14-1-9.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllRegionsController.h"

@class BusinessRegion;
@interface Regions : NSObject

@property(nonatomic,strong)NSString *regionsName;
@property (nonatomic) NSString *regionsId;

@property (nonatomic,strong) BusinessRegion *businessRegion;


//所有商区
+(NSURLSessionDataTask *)allRegionsParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *regions,NSError *e))block;

@end
