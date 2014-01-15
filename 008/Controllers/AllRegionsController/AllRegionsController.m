//
//  AllRegionsController.m
//  008
//
//  Created by 单好坤 on 14-1-7.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "AllRegionsController.h"
#import "CollectionSearchView.h"
#import "Regions.h"
#import "SearchViewController.h"

@interface AllRegionsController ()

@end

@implementation AllRegionsController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];

    areaScrollView = [[UIScrollView alloc]init];
    areaScrollView.frame = CGRectMake(0, 0, 130, 13*40);
    areaScrollView.contentSize = CGSizeMake(120,18*40);
    areaScrollView.showsVerticalScrollIndicator = NO;
    areaScrollView.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
    areaScrollView.delegate = self;
    [self.view addSubview:areaScrollView];
    
    luWanButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    luWanButton.frame = CGRectMake(0, 0, areaScrollView.frame.size.width, 40);
    [luWanButton setTitle:@"    卢湾区" forState:UIControlStateNormal];
    [luWanButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [luWanButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    luWanButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    luWanButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    luWanButton.tag = 1;
    luWanButton.tintColor = [UIColor clearColor];
    [luWanButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:luWanButton];

    
    xuHuiButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    xuHuiButton.frame = CGRectMake(0, 1*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [xuHuiButton setTitle:@"    徐汇区" forState:UIControlStateNormal];
    [xuHuiButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [xuHuiButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    xuHuiButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    xuHuiButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    xuHuiButton.tag = 2;
    xuHuiButton.tintColor = [UIColor clearColor];
    [xuHuiButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:xuHuiButton];
    
    
    jingAnButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    jingAnButton.frame = CGRectMake(0, 2*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [jingAnButton setTitle:@"    静安区" forState:UIControlStateNormal];
    [jingAnButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [jingAnButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    jingAnButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    jingAnButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    jingAnButton.tag = 3;
    jingAnButton.tintColor = [UIColor clearColor];
    [jingAnButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:jingAnButton];
    
    changNingButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    changNingButton.frame = CGRectMake(0, 3*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [changNingButton setTitle:@"    长宁区" forState:UIControlStateNormal];
    [changNingButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [changNingButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    changNingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    changNingButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    changNingButton.tag = 4;
    changNingButton.tintColor = [UIColor clearColor];
    [changNingButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:changNingButton];
    
    puDongXinButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    puDongXinButton.frame = CGRectMake(0, 4*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [puDongXinButton setTitle:@"    浦东新区" forState:UIControlStateNormal];
    [puDongXinButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [puDongXinButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    puDongXinButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    puDongXinButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    puDongXinButton.tag = 5;
    puDongXinButton.tintColor = [UIColor clearColor];
    [puDongXinButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:puDongXinButton];
    
    huangPuButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    huangPuButton.frame = CGRectMake(0, 5*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [huangPuButton setTitle:@"    黄浦区" forState:UIControlStateNormal];
    [huangPuButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [huangPuButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    huangPuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    huangPuButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    huangPuButton.tag = 6;
    huangPuButton.tintColor = [UIColor clearColor];
    [huangPuButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:huangPuButton];
    

    puTuoButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    puTuoButton.frame = CGRectMake(0, 6*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [puTuoButton setTitle:@"    普陀区" forState:UIControlStateNormal];
    [puTuoButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [puTuoButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    puTuoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    puTuoButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    puTuoButton.tag = 7;
    puTuoButton.tintColor = [UIColor clearColor];
    [puTuoButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:puTuoButton];
    

    zhaBeiButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    zhaBeiButton.frame = CGRectMake(0, 7*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [zhaBeiButton setTitle:@"    闸北区" forState:UIControlStateNormal];
    [zhaBeiButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [zhaBeiButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    zhaBeiButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    zhaBeiButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    zhaBeiButton.tag = 8;
    zhaBeiButton.tintColor = [UIColor clearColor];
    [zhaBeiButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:zhaBeiButton];
    
    hongKouButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    hongKouButton.frame = CGRectMake(0, 8*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [hongKouButton setTitle:@"    虹口区" forState:UIControlStateNormal];
    [hongKouButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [hongKouButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    hongKouButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    hongKouButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    hongKouButton.tag = 9;
    hongKouButton.tintColor = [UIColor clearColor];
    [hongKouButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:hongKouButton];
    
    yangPuButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    yangPuButton.frame = CGRectMake(0, 9*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [yangPuButton setTitle:@"    杨浦区" forState:UIControlStateNormal];
    [yangPuButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [yangPuButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    yangPuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    yangPuButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    yangPuButton.tag = 10;
    yangPuButton.tintColor = [UIColor clearColor];
    [yangPuButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:yangPuButton];
    
    minHangButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    minHangButton.frame = CGRectMake(0, 10*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [minHangButton setTitle:@"    闵行区" forState:UIControlStateNormal];
    [minHangButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [minHangButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    minHangButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    minHangButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    minHangButton.tag = 11;
    minHangButton.tintColor = [UIColor clearColor];
    [minHangButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:minHangButton];
    
    baoShanButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    baoShanButton.frame = CGRectMake(0, 11*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [baoShanButton setTitle:@"    宝山区" forState:UIControlStateNormal];
    [baoShanButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [baoShanButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    baoShanButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    baoShanButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    baoShanButton.tag = 12;
    baoShanButton.tintColor = [UIColor clearColor];
    [baoShanButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:baoShanButton];
    
    
    songJiangButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    songJiangButton.frame = CGRectMake(0, 12*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [songJiangButton setTitle:@"    松江区" forState:UIControlStateNormal];
    [songJiangButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [songJiangButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    songJiangButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    songJiangButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    songJiangButton.tag = 13;
    songJiangButton.tintColor = [UIColor clearColor];
    [songJiangButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:songJiangButton];
    
    jiaDingButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    jiaDingButton.frame = CGRectMake(0, 13*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [jiaDingButton setTitle:@"    嘉定区" forState:UIControlStateNormal];
    [jiaDingButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [jiaDingButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    jiaDingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    jiaDingButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    jiaDingButton.tag = 14;
    jingAnButton.tintColor = [UIColor clearColor];
    [jiaDingButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:jiaDingButton];
    
    
    qingPuButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    qingPuButton.frame = CGRectMake(0, 14*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [qingPuButton setTitle:@"    青浦区" forState:UIControlStateNormal];
    [qingPuButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [qingPuButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    qingPuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    qingPuButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    qingPuButton.tag = 15;
    qingPuButton.tintColor = [UIColor clearColor];
    [qingPuButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:qingPuButton];
    
    jinShanButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    jinShanButton.frame = CGRectMake(0, 15*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [jinShanButton setTitle:@"    金山区" forState:UIControlStateNormal];
    [jinShanButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [jinShanButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    jinShanButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    jinShanButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    jinShanButton.tag = 16;
    jinShanButton.tintColor = [UIColor clearColor];
    [jinShanButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:jinShanButton];
    
    fengXianButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    fengXianButton.frame = CGRectMake(0, 16*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [fengXianButton setTitle:@"    奉贤区" forState:UIControlStateNormal];
    [fengXianButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [fengXianButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    fengXianButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    fengXianButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    fengXianButton.tag = 17;
    fengXianButton.tintColor = [UIColor clearColor];
    [fengXianButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:fengXianButton];
    
    chongMingButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    chongMingButton.frame = CGRectMake(0, 17*luWanButton.frame.size.height, areaScrollView.frame.size.width, 40);
    [chongMingButton setTitle:@"    崇明县" forState:UIControlStateNormal];
    [chongMingButton setBackgroundImage:[UIImage imageNamed:@"baikuang"] forState:UIControlStateSelected];
    [chongMingButton setTitleColor:[UIColor colorWithRed:42/255.f green:42/255.f blue:42/255.f alpha:1.0f] forState:UIControlStateNormal];
    chongMingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    chongMingButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    chongMingButton.tag = 18;
    changNingButton.tintColor = [UIColor clearColor];
    [chongMingButton addTarget:self action:@selector(chooseArea:) forControlEvents:UIControlEventTouchDown];
    [areaScrollView addSubview:chongMingButton];
    
    
    districtTableView = [[UITableView alloc] init];
    districtTableView.frame = CGRectMake(areaScrollView.frame.size.width, 65, 340-areaScrollView.frame.size.width, 480);
    districtTableView.dataSource = self;
    districtTableView.delegate = self;
    [self.view addSubview:districtTableView];
    
    //隐藏多余分割线 函数调用
    [self setExtraCellLineHidden:districtTableView];
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)chooseArea:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    //button.selected = !button.selected;
    //解决点击多个地区 显示同时被选中状态

    switch (button.tag) {
        case 1:
            luWanButton.backgroundColor = [UIColor whiteColor];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 2:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor whiteColor];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 3:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor whiteColor];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 4:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor whiteColor];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 5:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor whiteColor];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 6:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor whiteColor];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
            case 7:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor whiteColor];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 8:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor whiteColor];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 9:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor whiteColor];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 10:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor whiteColor];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 11:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor whiteColor];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 12:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor whiteColor];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 13:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor whiteColor];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 14:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor whiteColor];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 15:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor whiteColor];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 16:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor whiteColor];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 17:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor whiteColor];
            chongMingButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            break;
        case 18:
            luWanButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            xuHuiButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jingAnButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            changNingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puDongXinButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            huangPuButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            puTuoButton.backgroundColor =[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            zhaBeiButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            hongKouButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            yangPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            minHangButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            baoShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            songJiangButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jiaDingButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            qingPuButton.backgroundColor= [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            fengXianButton.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            jinShanButton.backgroundColor=[UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
            chongMingButton.backgroundColor = [UIColor whiteColor];
            break;
            
        default:
            break;
    }
    
    
    
    
    areaScrollView.backgroundColor = [UIColor colorWithRed:243/255.f green:241/255.f blue:241/255.f alpha:1.f];
    NSString *areaTag =[NSString stringWithFormat:@"%d",button.tag];
   // button.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
                         areaTag, @"districtId",
                         
                         nil];
    
    [Regions allRegionsParameters:dic WithBlock:^(NSArray *regions, NSError *e) {
        if (regions) {
            _regions = [NSMutableArray arrayWithArray:regions];
            
            [districtTableView reloadData];
        }
    }];

}

//隐藏多余分割线
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _regions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    

    Regions * p = [_regions objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:15];
    cell.textLabel.text = p.regionsName;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Regions * p = [_regions objectAtIndex:indexPath.row];    
    NSArray *arr =  self.navigationController.viewControllers;
    SearchViewController *sVC = [arr objectAtIndex:0];
    sVC.regions = p;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    NSArray *arrayIndex = [NSArray arrayWithObjects: @"A", @"B", @"C", @"D", @"E",
                           @"F",@"G",@"H", @"I", @"J",@"K",@"L",@"M", @"N", @"O",
                           @"P",@"Q",@"R", @"S", @"T",@"U",@"V",@"W", @"X", @"Y",@"Z",nil];
    return arrayIndex;
}


@end
