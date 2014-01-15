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
#import "PlanCell.h"
#import "PlanDetailViewController.h"

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
    plansTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 67;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _plans.count;
}


-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId= @"planCellId";
    PlanCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    //

    if (cell == nil) {
        cell = [[PlanCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.containingTableView = tableView;
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:253/255.f green:143/255.f blue:181/255.f alpha:1.0]
                                                    title:@"收藏"];
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:124/255.f green:157/255.f blue:224/255.f alpha:1.0f]
                                                    title:@"分享"];
        cell.rightUtilityButtons = rightUtilityButtons;
        [cell setCellHeight:67];
        
        cell.delegate = self;
    }
    
  
    
    Plan * p = [_plans objectAtIndex:indexPath.row];
    cell.plan = p;
    
//    cell.textLabel.text =p.title;
    
    return cell;
}


#pragma mark --SWTableViewCellDelegate 
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:
(NSInteger)index{
    
    //收藏
    if (index ==0) {
        NSLog(@"收藏");
    }
    //分享
    else{
        NSLog(@"分享");
        
//        
//        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
//        
//        //构造分享内容
//        id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
//                                           defaultContent:@"默认分享内容，没内容时显示"
//                                                    image:[ShareSDK imageWithPath:imagePath]
//                                                    title:@"ShareSDK"
//                                                      url:@"http://www.sharesdk.cn"
//                                              description:@"这是一条测试信息"
//                                                mediaType:SSPublishContentMediaTypeNews];
//        
//        [ShareSDK showShareActionSheet:nil
//                             shareList:nil
//                               content:publishContent
//                         statusBarTips:YES
//                           authOptions:nil
//                          shareOptions: nil
//                                result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                                    if (state == SSResponseStateSuccess)
//                                    {
//                                        NSLog(@"分享成功");
//                                    }
//                                    else if (state == SSResponseStateFail)
//                                    {
////                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
//                                    }
//                                }];
        
    }
}


#pragma mark --  UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Plan * p = [_plans objectAtIndex:indexPath.row];
    PlanDetailViewController *planDetailVC = [[PlanDetailViewController alloc]init];
    planDetailVC.plan = p;
    [self.navigationController pushViewController:planDetailVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
