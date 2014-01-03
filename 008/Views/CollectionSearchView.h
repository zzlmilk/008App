//
//  CollectionSearchView.h
//  008
//
//  Created by 单好坤 on 13-12-24.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class NMRangeSlider;

@interface CollectionSearchView : UIView

@property (weak, nonatomic)  NMRangeSlider *labelSlider;
@property (weak, nonatomic)  UILabel *lowerLabel;
@property (weak, nonatomic)  UILabel *upperLabel;


-(void)sliderValueChanged:(id)sender;

-(void)sliderDragUp:(id)sender;

- (void)labelSliderChanged:(NMRangeSlider*)sender;

@end