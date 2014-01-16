//
//  PlanDetailViewController.m
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "PlanDetailViewController.h"
#import "Plan.h"
#import "Business.h"
#import "UIImageView+AFNetworking.h"
#import "PlanDetailCell.h"
#import <QuartzCore/QuartzCore.h>

@interface PlanDetailViewController ()

@end


@implementation PlanDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.automaticallyAdjustsScrollViewInsets = NO;
    }


    planImageView = [[UIImageView alloc]init];
    [planImageView setImageWithURL:[NSURL URLWithString:_plan.url] placeholderImage:nil];
    
    planImageView.frame = CGRectMake(5, 16, 47, 47);
   // planImageView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:planImageView];
    
    planTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(planImageView.frame.size.width+planImageView.frame.origin.x+10, 20, 250, 30)];
    planTitleLabel.text =_plan.title;
    planTitleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    planTitleLabel.backgroundColor = [UIColor clearColor];
    planTitleLabel.textColor = [UIColor colorWithRed:74/255.f green:74/255.f blue:74/255.f alpha:1];
    [self.view addSubview:planTitleLabel];
    

    planDetailTableView =[[UITableView alloc]initWithFrame:CGRectMake(20, 70, 320, 480)];
    planDetailTableView.backgroundColor = [UIColor clearColor];
    [planDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    planDetailTableView.dataSource = self;
    planDetailTableView.delegate = self;
    [self.view addSubview:planDetailTableView];
    

}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:_plan.plan_id forKey:@"planId"];
    [Plan planDeatailByIdParameters:dic WithBlock:^(Plan *plan, NSError *e) {
        _plan = plan;
        [planDetailTableView reloadData];
    }];
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"%@",_plan.busineses);
    return _plan.busineses.count;
    
    
}

//设置cell每行间隔的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150 + 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *planDetailCellId = @"planDetailCellId";
    
     PlanDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:planDetailCellId];
    
    if (cell==nil) {
        cell = [[PlanDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:planDetailCellId];
    }

    Business * b = [_plan.busineses objectAtIndex:indexPath.row];
    cell.business = b;
    
   cell.userInteractionEnabled = NO;
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
