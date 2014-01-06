//
//  Collection.m
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "Collection.h"
#import "AppAPIClient.h"

@implementation Collection
-(id)initWith:(NSString *)title imageName:(NSString *)imageName{
    self  =[super self];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        
      
        
    }
    return self;
}

+(NSURLSessionDataTask *)collectionParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *collection, NSError *e))block{
    return [[AppAPIClient sharedClient]GET:@"Information/getAllTags" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        // NSLog(@"%@",responseObject);
        NSArray *array = responseObject;
        for (int i=0; i<array.count;i++) {
            Collection * c = [[Collection alloc]init];
            c.title = [[array objectAtIndex:i] objectForKey:@"tag_name"];
            c.collectionType = [[[array objectAtIndex:i] objectForKey:@"id"] integerValue];
        
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
         NSLog(@"%@",error);
    }];
}
@end
