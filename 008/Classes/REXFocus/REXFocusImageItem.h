//
//  REXFocusImageItem.h
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REXFocusImageItem : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIImage *image;

@property (nonatomic) NSInteger tag;


- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag;


@end
