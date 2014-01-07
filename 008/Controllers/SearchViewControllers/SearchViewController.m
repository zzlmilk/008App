//
//  SearchViewController.m
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "SearchViewController.h"
#import "CollectionSearchView.h"

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
    
    CollectionSearchView *collectionSearchView = [[CollectionSearchView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:collectionSearchView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
