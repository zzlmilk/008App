//
//  REXFocusImageFrame.m
//  008
//
//  Created by zzlmilk on 13-12-19.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "REXFocusImageFrame.h"
#import "REXFocusImageItem.h"
#import <objc/runtime.h>

@interface REXFocusImageFrame ()
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
-(void)setupViews;
-(void)switchFousImageItems;

@end

static NSString *REX_FOCUS_ITEM_ASS_KEY = @"com.touchmob.sgfocusitems";

static CGFloat SWITCH_FOCUS_PICTURE_INTERVAL = 3.f; //时间


@implementation REXFocusImageFrame

- (id)initWithFrame:(CGRect)frame delegate:(id<REXFocusImageFrameDelegate>)delegate focusImageItemsArray:(NSMutableArray *)items{
    self = [super initWithFrame:frame];
    
    
    NSMutableArray *imageItems = [NSMutableArray array];
    
    
    
    [self setupViews ];
    [self setDelegate:delegate];

    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame delegate:(id<REXFocusImageFrameDelegate>)delegate focusImageItems:(REXFocusImageItem *)firstItem, ...{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *imageItems = [NSMutableArray array];
        REXFocusImageItem *eachItem;
        va_list argumentList;
        if (firstItem) {
            [imageItems addObject:firstItem];
            va_start(argumentList, firstItem);
            while ((eachItem = va_arg(argumentList, REXFocusImageItem *))) {
                [imageItems addObject: eachItem];
                
            }
            va_end(argumentList);
        }
        
        objc_setAssociatedObject(self, (__bridge const void *)REX_FOCUS_ITEM_ASS_KEY, imageItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        
        [self setupViews ];
        [self setDelegate:delegate];
    }
    return self;
}

#pragma mark - private methods
-(void)setupViews{
        NSArray *imageItems = objc_getAssociatedObject(self, (__bridge const void *)REX_FOCUS_ITEM_ASS_KEY);
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    CGSize size = CGSizeMake(100, 44);
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.bounds.size.width * .5 - size.width *0.5f, self.bounds.size.height - size.height, size.width,size.height)];
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    _pageControl.numberOfPages = imageItems.count;
    _pageControl.currentPage = 0;
    
    _scrollView.delegate = self;
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tapGestureRecognize];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * imageItems.count, _scrollView.frame.size.height);
    for (int i =0; i<imageItems.count; i++) {
        REXFocusImageItem * item = [imageItems objectAtIndex:i];
        UIButton *imageView = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [imageView setFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        [imageView setBackgroundImage:item.image forState:UIControlStateNormal];
        imageView.tag = i;
        
        //add 事件
        [imageView addTarget:self action:@selector(clickPageImage:) forControlEvents:UIControlEventTouchUpInside];
        
        /*标题
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(_scrollView.frame.size.width*i, _scrollView.frame.size.height- 40 , 100, 44)];
        */
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(i*_scrollView.frame.size.width, _scrollView.frame.size.height - 40-44 , 100, 44)];
        titleLabel.text = item.title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.backgroundColor = [UIColor blackColor];
        titleLabel.alpha = 0.7f;
        
        [_scrollView addSubview:imageView];
        [_scrollView addSubview:titleLabel];
        
        
        [self performSelector:@selector(switchFousImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
        
        
        
    }
    
}

-(void)singleTapGestureRecognizer :(UIGestureRecognizer *)gestureRecognizer{
    NSArray * imageItems = objc_getAssociatedObject(self, (__bridge const void *)REX_FOCUS_ITEM_ASS_KEY);
    
    int page = (int) (_scrollView.contentOffset.x / _scrollView.frame.size.width);
    
    if (page > -1 && page <imageItems.count) {
        REXFocusImageItem *item = [imageItems objectAtIndex:page];
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:didSelectItem:)]) {
            [self.delegate foucusImageFrame:self didSelectItem:item];
        }
    }
    
}


-(void)switchFousImageItems{
     [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFousImageItems) object:nil];
    
    CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
    
     [self moveToTargetPosition:targetX];
     [self performSelector:@selector(switchFousImageItems) withObject:nil afterDelay:SWITCH_FOCUS_PICTURE_INTERVAL];
    
}

-(void)moveToTargetPosition:(CGFloat)targetX{

    if (targetX >= _scrollView.contentSize.width) {
        targetX = 0;
    }
    
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES];
    _pageControl.currentPage = (int)(_scrollView.contentOffset.x/_scrollView.frame.size.width);
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
    
}


#pragma mark - UIButtonTouchEvent
-(void)clickPageImage:(UIButton *)sender{
   // NSLog(@"click button tag is %ld",(long)sender.tag);
    NSArray * imageItems = objc_getAssociatedObject(self, (__bridge const void *)REX_FOCUS_ITEM_ASS_KEY);
    
    int page = (int) (_scrollView.contentOffset.x / _scrollView.frame.size.width);
    
    if (page > -1 && page <imageItems.count) {
        REXFocusImageItem *item = [imageItems objectAtIndex:page];
        if ([self.delegate respondsToSelector:@selector(foucusImageFrame:didSelectItem:)]) {
            [self.delegate foucusImageFrame:self didSelectItem:item];
        }
    }

    
}

@end
