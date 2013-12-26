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

+(void )BusinessParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *, NSError *))block;

@end
