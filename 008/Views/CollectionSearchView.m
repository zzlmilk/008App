//
//  CollectionSearchView.m
//  008
//
//  Created by 单好坤 on 13-12-24.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "CollectionSearchView.h"
#import "Collection.h"
#import "NMRangeSlider.h"
#import "AllRegionsController.h"
#import "Regions.h"

@implementation CollectionSearchView

{
    UISlider *sliderPeople;
    UILabel *peopleValueLabel;
    UILabel *timeValueLabel;
    
    UISlider *sliderPeopleCapita;
    UILabel *peopleValueLabelCapita;
    UILabel *timeValueLabelCapita;
}

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //        self.backgroundColor = [UIColor blackColor];
        UILabel *businessDistrict = [[UILabel alloc] initWithFrame:CGRectMake(13, 90, 100, 50)];
        businessDistrict.text = @"商区";
        businessDistrict.font = [UIFont fontWithName:@"Arial" size:13];
        businessDistrict.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:businessDistrict];
        
        UILabel *characteristic = [[UILabel alloc] initWithFrame:CGRectMake(13, 160, 100, 50)];
        characteristic.text = @"特色";
        characteristic.font = [UIFont fontWithName:@"Arial" size:13];
        characteristic.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        
        [self addSubview:characteristic];
        
        
        _buttonDistrict = [UIButton buttonWithType:UIButtonTypeCustom];
         _titleDistrict = @"     全部地区";
        _buttonDistrict.backgroundColor = [UIColor clearColor];
        _buttonDistrict.frame = CGRectMake(55, 92, 253, 45);
        [_buttonDistrict setTitle:_titleDistrict forState:UIControlStateNormal];
        [_buttonDistrict setTitleColor:[UIColor colorWithRed:44/255.f green:44/255.f blue:44/255.f alpha:1] forState:UIControlStateNormal];
        [_buttonDistrict setBackgroundImage:[UIImage imageNamed:@"quanBuDiQu"] forState:UIControlStateNormal];
        _buttonDistrict.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
        _buttonDistrict.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_buttonDistrict addTarget:self action:@selector(showAllRegions) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_buttonDistrict];

        
        buttonCharacteristic = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *titleCharacteristic= @"     全部特色";
        buttonCharacteristic.backgroundColor = [UIColor clearColor];
        buttonCharacteristic.frame = CGRectMake(55, 158, 253, 45);
        [buttonCharacteristic setTitle:titleCharacteristic forState:UIControlStateNormal];
        [buttonCharacteristic setBackgroundImage:[UIImage imageNamed:@"quanBuDiQu"] forState:UIControlStateNormal];
        [buttonCharacteristic setTitleColor:[UIColor colorWithRed:44/255.f green:44/255.f blue:44/255.f alpha:1] forState:UIControlStateNormal];
        buttonCharacteristic.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        buttonCharacteristic.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
        [self addSubview:buttonCharacteristic];
        
        
        //滑块
        //UISlider *sliderPeople = [[UISlider alloc]
        //                          initWithFrame:CGRectMake(55, 247, 253, 25)];
        sliderPeople =[[UISlider alloc]
                            initWithFrame:CGRectMake(55, 247, 253, 25)];

        UIImage *stetchLeftTrack= [[UIImage imageNamed:@"tuoYuanKuangCheng"] stretchableImageWithLeftCapWidth:9 topCapHeight:0];
        UIImage *stetchRightTrack = [UIImage imageNamed:@"tuoYuanKuang"];
        UIImage *thumbImage = [UIImage imageNamed:@"yuan"];
        [sliderPeople setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
        [sliderPeople setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
        [sliderPeople setThumbImage:thumbImage forState:UIControlStateNormal];
        //滑块拖动时的事件
        [sliderPeople addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        //滑块拖动后的事件
        [sliderPeople addTarget:self action:@selector(sliderDragUp:) forControlEvents:UIControlEventTouchUpInside];
        sliderPeople.continuous = YES;
        sliderPeople.maximumValue = 100;
        sliderPeople.minimumValue = 0;
        sliderPeople.value = 10;
        [self addSubview:sliderPeople];
        peopleValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(78, 220.f, 100.f, 30.f)];
        peopleValueLabel.text =@"10人" ;
        peopleValueLabel.font = [UIFont fontWithName:@"Arial" size:13];
        peopleValueLabel.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:peopleValueLabel];
        
        
        UILabel *numberPeople = [[UILabel alloc] initWithFrame:CGRectMake(13, 235, 100, 50)];
        numberPeople.text = @"人数";
        numberPeople.font = [UIFont fontWithName:@"Arial" size:13];
        numberPeople.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:numberPeople];
        
        
        UIButton *buttonSure = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *titleSure= @"确定";
        buttonSure.frame = CGRectMake(55, 435, 218, 44);
        [buttonSure setTitle:titleSure forState:UIControlStateNormal];
        [buttonSure setImage:[UIImage imageNamed:@"queDing"] forState:UIControlStateNormal];
        buttonSure.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
        [self addSubview:buttonSure];
        
        //以下为 建议时间 引用外部封装
        UILabel *playTime = [[UILabel alloc] initWithFrame:CGRectMake(13, 305, 100, 50)];
        playTime.text = @"时间";
        playTime.font = [UIFont fontWithName:@"Arial" size:13];
        playTime.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:playTime];
        
        NMRangeSlider *douSliderTime = [[NMRangeSlider alloc] init];
        douSliderTime.center = self.center;
        douSliderTime.frame = CGRectMake(55, 320, 253, 25);
        douSliderTime.backgroundColor = [UIColor clearColor];
        [self addSubview:douSliderTime];
        
        //事件绑定 **
        [douSliderTime addTarget:self action:@selector(labelSliderChanged:) forControlEvents:UIControlEventValueChanged];
        self.labelSlider = douSliderTime;
        
        //lowerLabel
        timeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 302, 100.f, 30.f)];
        timeValueLabel.center = CGPointMake(100,302);
        timeValueLabel.text =@"0:00" ;
        timeValueLabel.font = [UIFont fontWithName:@"Arial" size:13];
        timeValueLabel.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:timeValueLabel];
        self.lowerLabel =timeValueLabel;

        //upperLabel
        UILabel * upperValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(326.5, 302, 100.f, 30.f)];
        upperValueLabel.center = CGPointMake(326.5,302);
        upperValueLabel.text =@"24:00" ;
        upperValueLabel.font = [UIFont fontWithName:@"Arial" size:13];
        upperValueLabel.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:upperValueLabel];
        self.upperLabel =upperValueLabel;
        
        //*****
        [self configureLabelSlider];
        
        
        //以下为 建议人均消费 引用外部封装
        
        UILabel *perCapita = [[UILabel alloc] initWithFrame:CGRectMake(13, 370, 100, 50)];
        perCapita.text = @"人均";
        perCapita.font = [UIFont fontWithName:@"Arial" size:13];
        perCapita.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:perCapita];
        
        
        NMRangeSlider *douSliderTimeCapita = [[NMRangeSlider alloc] init];
        douSliderTimeCapita.center = self.center;
        douSliderTimeCapita.frame = CGRectMake(55, 380, 253, 25);
        douSliderTimeCapita.backgroundColor = [UIColor clearColor];
        [self addSubview:douSliderTimeCapita];
        
        //事件绑定 **
        [douSliderTimeCapita addTarget:self action:@selector(labelSliderChangedCapita:) forControlEvents:UIControlEventValueChanged];
        self.labelSliderCapita = douSliderTimeCapita;
        
        //lowerLabel
        timeValueLabelCapita = [[UILabel alloc] initWithFrame:CGRectMake(100, 362, 100.f, 30.f)];
        timeValueLabelCapita.backgroundColor = [UIColor clearColor];
        timeValueLabelCapita.center = CGPointMake(100,362);
        timeValueLabelCapita.text =@"¥ 0" ;
        timeValueLabelCapita.font = [UIFont fontWithName:@"Arial" size:13];
        timeValueLabelCapita.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:timeValueLabelCapita];
        self.lowerLabelCapita =timeValueLabelCapita;
        
        //upperLabel
        UILabel * upperValueLabelCapita = [[UILabel alloc] initWithFrame:CGRectMake(326.5, 362, 100.f, 30.f)];
        upperValueLabelCapita.center = CGPointMake(326.5,362);
        upperValueLabelCapita.backgroundColor = [UIColor clearColor];
        upperValueLabelCapita.text =@"¥ 300" ;
        upperValueLabelCapita.font = [UIFont fontWithName:@"Arial" size:13];
        upperValueLabelCapita.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:upperValueLabelCapita];
        self.upperLabelCapita =upperValueLabelCapita;
        
        //*****
        [self configureLabelSliderCapita];
        
    }
    return self;
}

    //以下为 建议时间 方法处理

#pragma mark --sliderPeopleDelegate
-(void)sliderValueChanged:(id)sender{
    
   float peopleViewNumber = sliderPeople.value; //读取滑块的值

    CGRect rect = peopleValueLabel.frame;
    
    peopleValueLabel.frame = CGRectMake(2.3 * sliderPeople.value + 55, rect.origin.y, rect.size.width, rect.size.height);

    NSString *peopleViewNumberString = [NSString stringWithFormat:@"%.0f",peopleViewNumber];
    
    NSString *string = [peopleViewNumberString stringByAppendingString:@"人"];
    peopleValueLabel.text = string;
}

-(void)sliderDragUp:(id)sender{
    
    NSString *selectPeopleNumber = peopleValueLabel.text;
    
    NSLog(@"%@",selectPeopleNumber);
}


#pragma mark -
#pragma mark - Label  Slider

- (void) configureLabelSlider
{
    self.labelSlider.minimumValue = 0;
    self.labelSlider.maximumValue = 24;
    
    self.labelSlider.lowerValue = 0;
    self.labelSlider.upperValue = 24;
    
    self.labelSlider.minimumRange = 1;
}


- (void) updateSliderLabels
{
    // You get get the center point of the slider handles and use this to arrange other subviews
    
    CGPoint lowerCenter;
    lowerCenter.x = (self.labelSlider.lowerCenter.x + self.labelSlider.frame.origin.x + 40);
    lowerCenter.y = (self.labelSlider.center.y - 30.0f);
    self.lowerLabel.center = lowerCenter;
    self.lowerLabel.text = [NSString stringWithFormat:@"%d:00", (int)self.labelSlider.lowerValue];
    
    
    CGPoint upperCenter;
    upperCenter.x = (self.labelSlider.upperCenter.x + self.labelSlider.frame.origin.x + 30);
    upperCenter.y = (self.labelSlider.center.y - 30.0f);
    self.upperLabel.center = upperCenter;
    self.upperLabel.text = [NSString stringWithFormat:@"%d:00", (int)self.labelSlider.upperValue];
}


// Handle control value changed events just like a normal slider
- (void)labelSliderChanged:(NMRangeSlider*)sender
{
    [self updateSliderLabels];
}

    //以上为 建议时间 方法处理


    //以下为 人均消费 方法处理

#pragma mark --sliderPeopleDelegate
-(void)sliderValueChangedCapita:(id)sender{
    
    float peopleViewNumberCapita = sliderPeopleCapita.value; //读取滑块的值
    
    CGRect rectCapita = peopleValueLabelCapita.frame;
    
    peopleValueLabelCapita.frame = CGRectMake(2.3 * sliderPeopleCapita.value + 55, rectCapita.origin.y, rectCapita.size.width, rectCapita.size.height);
    
    NSString *peopleViewNumberStringCapita = [NSString stringWithFormat:@"%.0f",peopleViewNumberCapita];
    
    NSString *stringCapita = [peopleViewNumberStringCapita stringByAppendingString:@"人"];
    peopleValueLabelCapita.text = stringCapita;
}

-(void)sliderDragUpCapita:(id)sender{
    
    NSString *selectPeopleNumberCapita = peopleValueLabelCapita.text;
    
    NSLog(@"%@",selectPeopleNumberCapita);
}


#pragma mark -
#pragma mark - Label  Slider

- (void) configureLabelSliderCapita
{
    self.labelSliderCapita.minimumValue = 0;
    self.labelSliderCapita.maximumValue = 300;
    
    self.labelSliderCapita.lowerValue = 0;
    self.labelSliderCapita.upperValue = 300;
    
    self.labelSliderCapita.minimumRange = 1;
}


- (void) updateSliderLabelsCapita
{
    // You get get the center point of the slider handles and use this to arrange other subviews
    
    CGPoint lowerCenterCapita;
    lowerCenterCapita.x = (self.labelSliderCapita.lowerCenter.x + self.labelSliderCapita.frame.origin.x + 40);
    lowerCenterCapita.y = (self.labelSliderCapita.center.y - 30.0f);
    self.lowerLabelCapita.center = lowerCenterCapita;
    self.lowerLabelCapita.text = [NSString stringWithFormat:@"¥ %d", (int)self.labelSliderCapita.lowerValue];
    
    
    CGPoint upperCenterCapita;
    upperCenterCapita.x = (self.labelSliderCapita.upperCenter.x + self.labelSliderCapita.frame.origin.x + 30);
    upperCenterCapita.y = (self.labelSliderCapita.center.y - 30.0f);
    self.upperLabelCapita.center = upperCenterCapita;
    self.upperLabelCapita.text = [NSString stringWithFormat:@"¥ %d", (int)self.labelSliderCapita.upperValue];
}


// Handle control value changed events just like a normal slider
- (void)labelSliderChangedCapita:(NMRangeSlider*)sender
{
    
    [self updateSliderLabelsCapita];
}

//获取全部商区 代理
-(void)showAllRegions{

    if ([self.delegate respondsToSelector:@selector(getAllRegions)]) {
        [self.delegate getAllRegions];
    }
    
}


@end






