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


@implementation CollectionSearchView
{
    UISlider *sliderPeople;
    UILabel *peopleValueLabel;
    UILabel *timeValueLabel;
    //NMRangeSlider *douSliderTime;
    //NMDemoTVC *douSliderTime;
    
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //[self configureLabelSlider];
        
        
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
        
        UIButton *buttonDistrict = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *titleDistrict = @"全部地区";
        buttonDistrict.backgroundColor = [UIColor clearColor];
        buttonDistrict.frame = CGRectMake(55, 92, 253, 45);
        [buttonDistrict setTitle:titleDistrict forState:UIControlStateNormal];
        [buttonDistrict setImage:[UIImage imageNamed:@"quanBuDiQu"] forState:UIControlStateNormal];
        buttonDistrict.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
        [self addSubview:buttonDistrict];
        
        UIButton *buttonCharacteristic = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *titleCharacteristic= @"全部特色";
        buttonCharacteristic.backgroundColor = [UIColor clearColor];
        buttonCharacteristic.frame = CGRectMake(55, 158, 253, 45);
        [buttonCharacteristic setTitle:titleCharacteristic forState:UIControlStateNormal];
        [buttonCharacteristic setImage:[UIImage imageNamed:@"quanBuTeSe"] forState:UIControlStateNormal];
        buttonCharacteristic.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
        
        [self addSubview:buttonCharacteristic];
        //        [buttonDistrict addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchDown];
        
        
        
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
       // X = 2.3 * sliderPeople.value + 55
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
        
        
        //引用外部封装

        UILabel *playTime = [[UILabel alloc] initWithFrame:CGRectMake(13, 305, 100, 50)];
        playTime.text = @"时间";
        playTime.font = [UIFont fontWithName:@"Arial" size:13];
        playTime.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:playTime];
        
        
        
        
        
        
        

        NMRangeSlider *douSliderTime = [[NMRangeSlider alloc] init];
        douSliderTime.center = self.center;
        douSliderTime.frame = CGRectMake(55, 320, 253, 25);
        douSliderTime.backgroundColor = [UIColor yellowColor];
        [self addSubview:douSliderTime];
        
        //事件绑定 **
        [douSliderTime addTarget:self action:@selector(labelSliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        self.labelSlider = douSliderTime;
        
        
        //lowerLabel
        timeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 302, 100.f, 30.f)];
        timeValueLabel.center = CGPointMake(65,302);
        timeValueLabel.text =@"0:00" ;
        timeValueLabel.font = [UIFont fontWithName:@"Arial" size:13];
        timeValueLabel.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:timeValueLabel];
        self.lowerLabel =timeValueLabel;

        
        //upperLabel
        UILabel * upperValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(296.5, 302, 100.f, 30.f)];
        upperValueLabel.center = CGPointMake(296.5,302);
        upperValueLabel.text =@"24;00" ;
        upperValueLabel.font = [UIFont fontWithName:@"Arial" size:13];
        upperValueLabel.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:upperValueLabel];
        self.upperLabel =upperValueLabel;

        //*****
        [self configureLabelSlider];
        //[self updateSliderLabels];
        
        
        UILabel *perCapita = [[UILabel alloc] initWithFrame:CGRectMake(13, 370, 100, 50)];
        perCapita.text = @"人均";
        perCapita.font = [UIFont fontWithName:@"Arial" size:13];
        perCapita.textColor = [UIColor colorWithRed:126/255.f green:123/255.f blue:123/255.f alpha:1.0f];
        [self addSubview:perCapita];
        
        
        
    }
    return self;
}


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
    lowerCenter.x = (self.labelSlider.lowerCenter.x + self.labelSlider.frame.origin.x);
    lowerCenter.y = (self.labelSlider.center.y - 30.0f);
    self.lowerLabel.center = lowerCenter;
    self.lowerLabel.text = [NSString stringWithFormat:@"%d:00", (int)self.labelSlider.lowerValue];
    
    
    CGPoint upperCenter;
    upperCenter.x = (self.labelSlider.upperCenter.x + self.labelSlider.frame.origin.x);
    upperCenter.y = (self.labelSlider.center.y - 30.0f);
    self.upperLabel.center = upperCenter;
    self.upperLabel.text = [NSString stringWithFormat:@"%d:00", (int)self.labelSlider.upperValue];
    
    
    
}



// Handle control value changed events just like a normal slider
- (void)labelSliderChanged:(NMRangeSlider*)sender
{
    [self updateSliderLabels];
}



@end






