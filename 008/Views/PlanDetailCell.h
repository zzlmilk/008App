//
//  PlanDetailCell.h
//  008
//
//  Created by zzlmilk on 14-1-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "Plan.h"

@interface PlanDetailCell : UITableViewCell
{

    UITableView *planDetailTableView;
    UIImageView *planImageView;
    UILabel *planTitleLabel;
    
    UILabel *shopNameLabel;
    UILabel *activitiesTimeValueLabel;
    UIImageView *shopPhotoImageView;
    UILabel *ticketsValueLabel;
    UILabel *openHoursValueLabel;
    UILabel *addressValueLabel;
}
@property(nonatomic,strong) Plan *plan;

@property(nonatomic,strong) Business *business;
@end
