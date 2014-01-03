//
//  REXJSONResponseSerializerWithData.m
//  008
//
//  Created by zzlmilk on 14-1-3.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "REXJSONResponseSerializerWithData.h"

@implementation REXJSONResponseSerializerWithData

-(id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error{
    
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (*error != nil) {
            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            userInfo[JSONResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
            (*error) = newError;
        }
        
        return (nil);
    }

     return ([super responseObjectForResponse:response data:data error:error]);
    
}
@end
