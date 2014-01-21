//
//  CollectionSearchView.h
//  008
//
//  Created by 单好坤 on 13-12-24.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AllRegionsController.h"
#import "AllCharacteristicController.h"

@class NMRangeSlider;

@protocol AllRegionsDelegate <NSObject>
- (void)getAllRegions;
- (void)getAllCharacteristic;
@end
//

//

@interface CollectionSearchView : UIView{
    UIButton *_buttonDistrict;
    UIButton *_buttonCharacteristic;
}
@property (nonatomic,strong)    UIButton *buttonDistrict;
@property (nonatomic,strong)    UIButton *buttonCharacteristic;


@property (nonatomic,strong)NSString *titleDistrict;
@property (nonatomic,strong)NSString *titleCharacteristic;

@property (nonatomic, assign) id<AllRegionsDelegate> delegate;

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

