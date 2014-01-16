//
//  PlanDetailCell.m
//  008
//
//  Created by zzlmilk on 14-1-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "PlanDetailCell.h"
#import "PlanDetailViewController.h"
#import "Plan.h"
#import "Business.h"
#import "UIImageView+AFNetworking.h"
#import "PlanDetailCell.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>


@implementation PlanDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        // Initialization code
         //每家店铺信息
         shopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 22, 550/2, 30)];
         shopNameLabel.text = @"   多伦路-此为店铺名称";
       //  NSString *bussinessName = _business.name;
       //  NSString *bussinessNameStr = [@"   " stringByAppendingString:bussinessName];
       //  shopNameLabel.text =bussinessNameStr;
         shopNameLabel.font = [UIFont fontWithName:@"Arial" size:15];
         shopNameLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
         shopNameLabel.textColor = [UIColor whiteColor];
         [self.contentView addSubview:shopNameLabel];
        
         shopPhotoImageView = [[UIImageView alloc]init];
       //  [shopPhotoImageView setImageWithURL:[NSURL URLWithString:_business.photo_url]   placeholderImage:nil];
         shopPhotoImageView.frame = CGRectMake(15, 60, 90, 136/2);
         shopPhotoImageView.backgroundColor = [UIColor purpleColor];
         [self.contentView addSubview:shopPhotoImageView];
         
         UILabel *activitiesTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 60, 100, 25)];
         activitiesTimeLabel.text = @"建议活动时间：";
         activitiesTimeLabel.font = [UIFont fontWithName:@"Arial" size:14];
         activitiesTimeLabel.backgroundColor = [UIColor clearColor];
         activitiesTimeLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:activitiesTimeLabel];
        
        
        
         activitiesTimeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(210, 60, 65, 25)];
         activitiesTimeValueLabel.text = @"20分钟";
         activitiesTimeValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
         activitiesTimeValueLabel.backgroundColor = [UIColor clearColor];
         activitiesTimeValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:activitiesTimeValueLabel];
         
         
         UILabel *ticketsLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 80, 21*2, 25)];
         ticketsLabel.text = @"门票：";
         ticketsLabel.font = [UIFont fontWithName:@"Arial" size:14];
         ticketsLabel.backgroundColor = [UIColor clearColor];
         ticketsLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:ticketsLabel];
         
         ticketsValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(153, 80, 21*2, 25)];
         ticketsValueLabel.text = @"免费";
         //ticketsValueLabel.text = _business.avg_price;
         ticketsValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
         ticketsValueLabel.backgroundColor = [UIColor clearColor];
         ticketsValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:ticketsValueLabel];
         
         
         
         UILabel *openHoursLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 100, 21*4-12, 25)];
         openHoursLabel.text = @"开放时间：";
         openHoursLabel.font = [UIFont fontWithName:@"Arial" size:14];
         openHoursLabel.backgroundColor = [UIColor clearColor];
         openHoursLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:openHoursLabel];
         
         openHoursValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(183, 100, 90, 25)];
         openHoursValueLabel.text = @"8:00～22:00";
         //openHoursValueLabel.text = _business.state_time;
         openHoursValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
         openHoursValueLabel.backgroundColor = [UIColor clearColor];
         openHoursValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:openHoursValueLabel];
         
         
         UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 135, 21*2, 25)];
         addressLabel.text = @"地址：";
         addressLabel.font = [UIFont fontWithName:@"Arial" size:14];
         addressLabel.backgroundColor = [UIColor clearColor];
         addressLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:addressLabel];
         
         addressValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(51, 135, 220, 25)];
         addressValueLabel.text = @"黄浦区黄埔路6088号(近西藏南路)";
         //addressValueLabel.text = _business.address;
         addressValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
         addressValueLabel.backgroundColor = [UIColor clearColor];
         addressValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
         [self.contentView addSubview:addressValueLabel];
         
         
         //拼接边框线
         UILabel *bottomLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 168, 550/2, 1)];
         bottomLineLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
         [self.contentView addSubview:bottomLineLabel];
         
         UILabel *leftLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 22, 1, 146)];
         leftLineLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
         [self.contentView addSubview:leftLineLabel];
         
         UILabel *rightLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(277, 22, 1, 146)];
         rightLineLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
         [self.contentView addSubview:rightLineLabel];
        
        
    }
    return self;
}


-(void)setBusiness:(Business *)business{
    
    NSString *bussinessName = business.name;
    NSString *bussinessNameStr = [@"   " stringByAppendingString:bussinessName];
    shopNameLabel.text =bussinessNameStr;
    activitiesTimeValueLabel.text = @"20分钟";
    openHoursValueLabel.text = business.state_time;
    addressValueLabel.text = business.address;
    [shopPhotoImageView setImageWithURL:[NSURL URLWithString:business.photo_url]   placeholderImage:nil];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
    
    // Configure the view for the selected state
}

@end
