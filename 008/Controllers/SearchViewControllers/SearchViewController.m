//
//  SearchViewController.m
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "SearchViewController.h"
#import "CollectionSearchView.h"
#import "AllRegionsController.h"
#import "AllCharacteristicController.h"
#import "Regions.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
	// Do any additional setup after loading the view.
    
     collectionSearchView = [[CollectionSearchView alloc]initWithFrame:self.view.bounds];

    [self.view addSubview:collectionSearchView];
    
    collectionSearchView.delegate = self;
    
     flag = NO;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (flag) {
        
        NSString *regionsStr = _regions.regionsName;
        NSString *regionsNameStr = [@"     " stringByAppendingString:regionsStr];

    [collectionSearchView.buttonDistrict setTitle:regionsNameStr forState:UIControlStateNormal];
    
   // [collectionSearchView.buttonCharacteristic setTitle:_collection.title forState:UIControlStateNormal];
    }
    flag = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
  
}

#pragma mark – AllRegionsDelegate

-(void)getAllRegions{
        //B
    AllRegionsController *allRegionsVC = [[AllRegionsController alloc] init];
    [self.navigationController pushViewController:allRegionsVC animated:YES];
    
}

-(void)getAllCharacteristic{
    
    AllCharacteristicController *AllCharacteristicVC = [[AllCharacteristicController alloc] init];
    
    [self.navigationController pushViewController:AllCharacteristicVC animated:YES];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
