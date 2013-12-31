//
//  PlanListViewController.m
//  008
//
//  Created by zzlmilk on 13-12-27.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "PlanListViewController.h"
#import "Plan.h"
#import "Collection.h"

@interface PlanListViewController ()

@end

@implementation PlanListViewController

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
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
	// Do any additional setup after loading the view.
    plansTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    plansTableView.delegate = self;
    plansTableView.dataSource= self;
    
    [self.view addSubview:plansTableView];
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
       NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSString stringWithFormat:@"%d", self.collection.collectionType] forKey:@"typeId"];
    [Plan plansBycollectionParameters:dic WithBlock:^(NSArray *plans, NSError *e) {
        if (plans) {
            _plans = [NSMutableArray arrayWithArray:plans];
            [plansTableView reloadData];
        }
        
    }];
    
   
}

#pragma mark -- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _plans.count;
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId= @"planCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    Plan * p = [_plans objectAtIndex:indexPath.row];
    
    cell.textLabel.text =p.title;

    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
