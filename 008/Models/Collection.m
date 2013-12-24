//
//  Collection.m
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "Collection.h"

@implementation Collection
-(id)initWith:(NSString *)title imageName:(NSString *)imageName{
    self  =[super self];
    if (self) {
        self.title = title;
        self.imageName = imageName;
    }
    return self;
}
@end
