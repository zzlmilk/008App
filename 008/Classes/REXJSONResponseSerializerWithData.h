//
//  REXJSONResponseSerializerWithData.h
//  008
//
//  Created by zzlmilk on 14-1-3.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLResponseSerialization.h"

/// NSError userInfo key that will contain response data

static NSString * const JSONResponseSerializerWithDataKey = @"JSONResponseSerializerWithDataKey";

@interface REXJSONResponseSerializerWithData : AFJSONResponseSerializer

@end

