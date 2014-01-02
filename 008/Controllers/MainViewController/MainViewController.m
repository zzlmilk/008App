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
    

    SetViewController *setVC = [[SetViewController alloc]init];
    UINavigationController *setNav = [[UINavigationController alloc]initWithRootViewController:setVC];
    setNav.title = @"我的";
    setNav.tabBarItem.image = [UIImage imageNamed:@"SetIcon"];
    
    
    UserLoginViewController *userLoginVC = [[UserLoginViewController alloc]init];
    UINavigationController *userLoginNav  = [[UINavigationController alloc]initWithRootViewController:userLoginVC];
    userLoginNav.title = @"登录";
    
    UserRegisterViewController *userRegisterVC = [[UserRegisterViewController alloc]init];
    UINavigationController *userRegisterNav = [[UINavigationController alloc]initWithRootViewController:userRegisterVC];
    userRegisterNav.title = @"注册";
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:homeNav,searchNav,setNav,userLoginNav,userRegisterNav, nil];
    
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
