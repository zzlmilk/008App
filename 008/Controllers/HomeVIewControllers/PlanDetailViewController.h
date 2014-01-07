//
//  PlanDetailViewController.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Plan;
@interface PlanDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *planDetailTableView;
    UIImageView *planImageView;
    UILabel *planTitleLabel;
}
@property(nonatomic,strong) Plan *plan;


@end
