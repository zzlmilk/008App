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

//设置cell每行间隔的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150+20;
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
    
    //cell.textLabel.text  = @"a";
    
    for (NSObject * object in _plan.busineses)
    {
       // NSLog(@"输出对象数组：%@", object);
        _business= object;
    }
    
    
    //每家店铺信息
    
    UILabel *shopNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 22, 550/2, 30)];
    //shopNameLabel.text = @"   多伦路-此为店铺名称";
    NSString *bussinessName = _business.name;
    NSString *bussinessNameStr = [@"   " stringByAppendingString:bussinessName];
    shopNameLabel.text =bussinessNameStr;
    shopNameLabel.font = [UIFont fontWithName:@"Arial" size:15];
    shopNameLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
    shopNameLabel.textColor = [UIColor whiteColor];
    [cell addSubview:shopNameLabel];
    
    UIImageView *shopPhotoImageView = [[UIImageView alloc]init];
    [shopPhotoImageView setImageWithURL:[NSURL URLWithString:_business.photo_url] placeholderImage:nil];
    shopPhotoImageView.frame = CGRectMake(15, 60, 90, 136/2);
    shopPhotoImageView.backgroundColor = [UIColor purpleColor];
    [cell addSubview:shopPhotoImageView];
    
    UILabel *activitiesTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 60, 100, 25)];
    activitiesTimeLabel.text = @"建议活动时间：";
    activitiesTimeLabel.font = [UIFont fontWithName:@"Arial" size:14];
    activitiesTimeLabel.backgroundColor = [UIColor clearColor];
    activitiesTimeLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:activitiesTimeLabel];
    
    UILabel *activitiesTimeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(210, 60, 65, 25)];
    activitiesTimeValueLabel.text = @"20分钟";
    activitiesTimeValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
    activitiesTimeValueLabel.backgroundColor = [UIColor clearColor];
    activitiesTimeValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:activitiesTimeValueLabel];
    
    
    UILabel *ticketsLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 80, 21*2, 25)];
    ticketsLabel.text = @"门票：";
    ticketsLabel.font = [UIFont fontWithName:@"Arial" size:14];
    ticketsLabel.backgroundColor = [UIColor clearColor];
    ticketsLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:ticketsLabel];
    
    UILabel *ticketsValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(153, 80, 21*2, 25)];
    //ticketsValueLabel.text = @"免费";
    ticketsValueLabel.text = _business.avg_price;
    ticketsValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
    ticketsValueLabel.backgroundColor = [UIColor clearColor];
    ticketsValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:ticketsValueLabel];
    
    
    
    UILabel *openHoursLabel = [[UILabel alloc]initWithFrame:CGRectMake(113, 100, 21*4-12, 25)];
    openHoursLabel.text = @"开放时间：";
    openHoursLabel.font = [UIFont fontWithName:@"Arial" size:14];
    openHoursLabel.backgroundColor = [UIColor clearColor];
    openHoursLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:openHoursLabel];
    
    UILabel *openHoursValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(183, 100, 90, 25)];
    openHoursValueLabel.text = _business.state_time;
    openHoursValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
    openHoursValueLabel.backgroundColor = [UIColor clearColor];
    openHoursValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:openHoursValueLabel];
    
    
    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 135, 21*2, 25)];
    addressLabel.text = @"地址：";
    addressLabel.font = [UIFont fontWithName:@"Arial" size:14];
    addressLabel.backgroundColor = [UIColor clearColor];
    addressLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:addressLabel];
    
    UILabel *addressValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(51, 135, 220, 25)];
    //addressValueLabel.text = @"黄浦区黄埔路6088号(近西藏南路)";
    addressValueLabel.text = _business.address;
    addressValueLabel.font = [UIFont fontWithName:@"Arial" size:14];
    addressValueLabel.backgroundColor = [UIColor clearColor];
    addressValueLabel.textColor = [UIColor colorWithRed:37/255.f green:37/255.f blue:37/255.f alpha:1];
    [cell addSubview:addressValueLabel];
    
    
    //拼接边框线
    UILabel *bottomLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 168, 550/2, 1)];
    bottomLineLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
    [cell addSubview:bottomLineLabel];
    
    UILabel *leftLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 22, 1, 146)];
    leftLineLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
    [cell addSubview:leftLineLabel];
    
    UILabel *rightLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(277, 22, 1, 146)];
    rightLineLabel.backgroundColor = [UIColor colorWithRed:237/255.f green:145/255.f blue:173/255.f alpha:1];
    [cell addSubview:rightLineLabel];

    cell.userInteractionEnabled = NO;
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
