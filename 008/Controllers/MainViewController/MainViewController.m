//
//  MainViewController.m
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "SetViewController.h"
#import "UserLoginViewController.h"
#import "UserRegisterViewController.h"

#import "UserViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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

    HomeViewController *homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNav.title =@"首页";
    homeNav.tabBarItem.image = [UIImage imageNamed:@"HomeIcon"];
    
    

    SearchViewController *searchVC = [[SearchViewController alloc]init];
    UINavigationController *searchNav = [[UINavigationController alloc]initWithRootViewController:searchVC];
    searchNav.title = @"找一找";
    searchNav.tabBarItem.image = [UIImage imageNamed:@"SearchIcon"];
    

    
    UserViewController *userVC = [[UserViewController alloc]init];
    UINavigationController *userNav = [[UINavigationController alloc]initWithRootViewController:userVC];
    userNav.title = @"我的";
    userNav.tabBarItem.image = [UIImage imageNamed:@"SetIcon"];
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:homeNav,searchNav,userNav, nil];
    
    self.viewControllers =viewControllers;
    
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = DEFAULTCOLOR;
    self.tabBar.tintColor = [UIColor whiteColor];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
