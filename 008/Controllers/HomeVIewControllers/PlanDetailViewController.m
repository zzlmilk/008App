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

//    UIImageView *planImageView = [[UIImageView alloc]init];
 //   planImageView.frame = CGRectMake(10, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:_plan.plan_id forKey:@"planId"];
    [Plan planDeatailByIdParameters:dic WithBlock:^(Plan *plan, NSError *e) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
