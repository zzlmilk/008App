//
//  REXFocusImageFrame.h
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class REXFocusImageItem;
@class REXFocusImageFrame;

#pragma mark -- REXFocusImageFrameDelegate
@protocol REXFocusImageFrameDelegate <NSObject>

-(void)foucusImageFrame:(REXFocusImageFrame *)imageFrame didSelectItem:(REXFocusImageItem *)item;


@end

@interface REXFocusImageFrame : UIView<UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property (nonatomic,weak) id<REXFocusImageFrameDelegate> delegate;


- (id)initWithFrame:(CGRect)frame delegate:(id<REXFocusImageFrameDelegate>)delegate focusImageItems:(REXFocusImageItem *)items, ... NS_REQUIRES_NIL_TERMINATION;




@end


