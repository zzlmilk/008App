//
//  HomeViewController.m
//  008
//
//  Created by zzlmilk on 13-12-4.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "HomeViewController.h"

#import "REXFocusImageItem.h"

#import "Business.h"
#import "Recommend.h"
#import "PlanListViewController.h"


@implementation HomeViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.tabBarItem.title =@"首页";
    

    
    UIView *statusBarBgColorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
//      UIColor *navColor= [UIColor colorWithRed:236/255.f green:117/255.f blue:153/255.f alpha:.8f];
    statusBarBgColorView.backgroundColor = DEFAULTCOLOR;
    [self.view addSubview:statusBarBgColorView];
    
    //self.navigationController.navigationBarHidden=YES;
   

    //self.view.backgroundColor = [UIColor orangeColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }


    CollectionPlanView *collectionPlanView = [[CollectionPlanView alloc]initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height - 250) WithDelegat:self];
    [self.view addSubview:collectionPlanView];
    
    
    
    REXFocusImageFrame *imageFrame = [[REXFocusImageFrame alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 170)];
    imageFrame.backgroundColor = DEFAULTCOLOR;
    [self.view addSubview:imageFrame];
    
    
    
    [Recommend recommendWithBlock:^(NSArray *recommends, NSError *error) {
        if (recommends) {
            
            NSMutableArray *items = [NSMutableArray array];
            for (Recommend *r in recommends) {
                int i =0;
                REXFocusImageItem * item = [[REXFocusImageItem alloc]initWithTitle:r.title imageUrl:r.url tag:i];
                item.recommend = r;
                i++;
                [items addObject:item];
                
            }
            
            
            [imageFrame setupViewsWithItems:items];
            
            
            
//            REXFocusImageFrame *imageFrame = [[REXFocusImageFrame alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 170) delegate:self focusImageItemsArray:items];
//              [self.view addSubview:imageFrame];
        }
        
    }];
    


}





-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.navigationBar.hidden =YES;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
}


#pragma mark - REXFocusImageFrameDelegate
-(void)foucusImageFrame:(REXFocusImageFrame *)imageFrame didSelectItem:(REXFocusImageItem *)item{

    PlanListViewController *planListVC = [[PlanListViewController alloc]init];
    [self.navigationController pushViewController:planListVC animated:YES];
    
}

#pragma  mark -- CollectionItemDelegate
-(void)CollectionItemDidSelect:(CollectionItem *)collectionItem{
    
    Collection *c =collectionItem.collection;
    
    PlanListViewController *planListVC = [[PlanListViewController alloc]init];
    planListVC.collection= c;
    [self.navigationController pushViewController:planListVC animated:YES];
    
    
}

@end
