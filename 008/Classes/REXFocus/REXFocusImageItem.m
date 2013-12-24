//
//  REXFocusImageItem.m
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "REXFocusImageItem.h"

@implementation REXFocusImageItem

- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag{
	self = [super init];
	if (self)
	{
		self.title = title;
		self.image = image;
		self.tag = tag;
	}
	return self;
}

@end
