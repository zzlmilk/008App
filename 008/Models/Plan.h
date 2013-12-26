//
//  Plan.h
//  008
//
//
//  Created by zzlmilk on 13-12-24.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.


#import <Foundation/Foundation.h>

@interface Plan : NSObject
{
    
}

+(NSURLSessionDataTask * )plansWithBlock:(void(^)(NSArray *plans,NSError *error))block;



@end
