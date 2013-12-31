//
//  PlanCell.h
//  008
//
//  Created by zzlmilk on 13-12-31.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plan.h"

@interface PlanCell : UITableViewCell
{
    UIImageView *planImageView;
    UILabel *avgConsumeLabel;
    UILabel *titleLabel;
}

@property(nonatomic,strong) Plan *plan;

@end
