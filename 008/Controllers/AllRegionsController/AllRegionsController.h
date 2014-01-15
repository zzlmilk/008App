//
//  AllRegionsController.h
//  008
//
//  Created by 单好坤 on 14-1-7.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionSearchView.h"
#import "AllRegionsController.h"
@protocol CollectSearchDelegate <NSObject>


@end


@interface AllRegionsController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *areaScrollView;
    UITableView *districtTableView;
    
    UIButton *luWanButton;
    UIButton *xuHuiButton;
    UIButton *jingAnButton;
    UIButton *changNingButton;
    UIButton *puDongXinButton;
    UIButton *huangPuButton;
    UIButton *puTuoButton;
    UIButton *zhaBeiButton;
    UIButton *hongKouButton;
    UIButton *yangPuButton;
    UIButton *minHangButton;
    UIButton *baoShanButton;
    UIButton *songJiangButton;
    UIButton *jiaDingButton;
    UIButton *qingPuButton;
    UIButton *jinShanButton;
    UIButton *fengXianButton;
    UIButton *chongMingButton;
    
}
@property (nonatomic, assign) id<CollectSearchDelegate> delegate;

@property(nonatomic) NSMutableArray *regions;


@property (nonatomic,weak) UIViewController *seacherVC;


- (void)chooseArea:(id)sender;

@end
