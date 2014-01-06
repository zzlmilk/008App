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

//时间
@property (weak, nonatomic)  NMRangeSlider *labelSlider;
@property (weak, nonatomic)  UILabel *lowerLabel;
@property (weak, nonatomic)  UILabel *upperLabel;

-(void)sliderValueChanged:(id)sender;
-(void)sliderDragUp:(id)sender;
-(void)labelSliderChanged:(NMRangeSlider*)sender;

//人均
@property (weak, nonatomic)  NMRangeSlider *labelSliderCapita;
@property (weak, nonatomic)  UILabel *lowerLabelCapita;
@property (weak, nonatomic)  UILabel *upperLabelCapita;

-(void)sliderValueChangedCapita:(id)sender;
-(void)sliderDragUpCapita:(id)sender;
-(void)labelSliderChangedCapita:(NMRangeSlider*)sender;
@end