//
//  HomeViewController.m
//  008
//
//  Created by zzlmilk on 13-12-4.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "HomeViewController.h"

#import "REXFocusImageItem.h"
#import "CollectionPlanView.h"


@implementation HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tabBarItem.title =@"首页";
    
    UIView *statusBarBgColorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
//      UIColor *navColor= [UIColor colorWithRed:236/255.f green:117/255.f blue:153/255.f alpha:.8f];
    statusBarBgColorView.backgroundColor = DEFAULTCOLOR;
    [self.view addSubview:statusBarBgColorView];
    
    //self.navigationController.navigationBarHidden=YES;
    self.navigationController.navigationBar.hidden =YES;

    //self.view.backgroundColor = [UIColor orangeColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    REXFocusImageItem *item1 = [[REXFocusImageItem alloc]initWithTitle:@"外滩舒适游玩" image:[UIImage imageNamed:@"banner1"] tag:0];
    
      REXFocusImageItem *item2 = [[REXFocusImageItem alloc]initWithTitle:@"title2" image:[UIImage imageNamed:@"banner2"] tag:1];
    
      REXFocusImageItem *item3 = [[REXFocusImageItem alloc]initWithTitle:@"title3" image:[UIImage imageNamed:@"banner3"] tag:2];

    
    
    
    REXFocusImageFrame *imageFrame = [[REXFocusImageFrame alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 170) delegate:self focusImageItems:item1,item2,item3, nil];
    imageFrame.backgroundColor = [UIColor orangeColor];

    
    [self.view addSubview:imageFrame];
    
    CollectionPlanView *collectionPlanView = [[CollectionPlanView alloc]initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height - 250)];
    [self.view addSubview:collectionPlanView];
    
}



#pragma mark - REXFocusImageFrameDelegate
-(void)foucusImageFrame:(REXFocusImageFrame *)imageFrame didSelectItem:(REXFocusImageItem *)item{
    
}



//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    
//    return UIStatusBarStyleLightContent;
//}
//
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
@end
