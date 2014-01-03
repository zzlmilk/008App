//
//  PlanCell.h
//  008
//
//  Created by zzlmilk on 13-12-31.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plan.h"
#import "SWTableViewCell.h"


@interface PlanCell : SWTableViewCell
{
    UIImageView *planImageView;
    UILabel *avgConsumeLabel;
    UILabel *titleLabel;
}

@property(nonatomic,strong) Plan *plan;

@end
