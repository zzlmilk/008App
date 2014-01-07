//
//  PlanDetailViewController.m
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "PlanDetailViewController.h"
#import "Plan.h"
#import "UIImageView+AFNetworking.h"


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
    planImageView.frame = CGRectMake(4,8 , 47, 47);
    planImageView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:planImageView];
    
    planTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 8, 250, 30)];
    planTitleLabel.text = @"多伦路";
    [self.view addSubview:planTitleLabel];
    
    
    
    
    planDetailTableView =[[UITableView alloc]initWithFrame:CGRectMake(20, 70, 280, 370)]
    ;
    planDetailTableView.backgroundColor = [UIColor clearColor];
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
    return _plan.busineses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *planDetailCellId = @"planDetailCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:planDetailCellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:planDetailCellId];
    }
    
    cell.textLabel.text  = @"a";
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
