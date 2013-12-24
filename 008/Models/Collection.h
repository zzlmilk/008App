//
//  Collection.h
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject

-(id)initWith:(NSString *)title imageName:(NSString *)imageName;

@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *imageName;
@end
