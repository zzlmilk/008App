//
//  PlanListViewController.h
//  008
//
//  Created by zzlmilk on 13-12-27.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Collection;

@interface PlanListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *plansTableView;
}

@property(nonatomic) NSMutableArray *plans;

@property (nonatomic,strong)Collection *collection;


@end
