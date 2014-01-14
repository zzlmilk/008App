//
//  UserViewController.m
//  008
//
//  Created by zhaixiaoping on 14-1-2.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "UserViewController.h"
#import "UserLoginViewController.h"


@interface UserViewController ()

@end

@implementation UserViewController

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
    
    UIImage *backgroundImage = [UIImage  imageNamed:@"tuPian"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage: backgroundImage];
    imageView.frame = CGRectMake(0, 0, 640/2, 320/2);

    
    UILabel *lable1 = [[UILabel alloc]init];
    lable1.frame = CGRectMake(218/2, 160/2, 209/2, 30/2);
    lable1.text = @"您还没有登陆哦～";
    lable1.font = [UIFont fontWithName:@"Arial" size:13];
    lable1.textColor = RGBACOLOR(98, 98, 98,1);
    
    
    
    ableLoginButton = [[UIButton alloc] init];
    ableLoginButton.frame = CGRectMake(lable1.frame.origin.x + 9/2, lable1.frame.origin.y
                                       + lable1.frame.size.height + 20/2, 175/2, 63/2);
    
    
    
    UIImage *LoginImage = [UIImage imageNamed:@"maShangDengRu"];
    [ableLoginButton setImage:LoginImage forState:UIControlStateNormal];
    
    
    [ableLoginButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    UIImage *collectImage = [UIImage imageNamed:@"shouCang"];
    UIImageView  *collectImageView = [[UIImageView alloc] initWithImage:collectImage];
    collectImageView.frame = CGRectMake(0,imageView.frame.origin.y + imageView.frame.size.height, 322/2, 128/2);
    UIImage *shareImage = [UIImage imageNamed:@"fenXiangGuoDe"];
    
    
    UIImageView  *shareImageview = [[UIImageView alloc] initWithImage:shareImage];
    
    shareImageview.frame = CGRectMake(collectImageView.frame.origin.x + collectImageView.frame.size.width,imageView.frame.origin.y + imageView.frame.size.height, 318/2, 128/2);
    
    //shareImageview.backgroundColor = [UIColor orangeColor];
    
    

    UILabel *collectLableNumber = [[UILabel alloc] initWithFrame:CGRectMake(142/2,imageView.frame.size.height + 30/2, 50/2, 44/2)];
    collectLableNumber.text = @"0";
    NSLog(@"%f",collectLableNumber.frame.origin.y);
    
    collectLableNumber.textColor = RGBACOLOR(220, 127, 159, 1);
    
    
    
    
    collectLableNumber.font = [UIFont fontWithName:@"Arial" size:21];
    
    
    
    UILabel *collectLable = [[UILabel alloc] initWithFrame:CGRectMake(134/2, collectLableNumber.frame.origin.y + collectLableNumber.frame.size.height + 8/2, 62/2,30/2)];
    
    
    collectLable.text = @"收藏";
    
    
    collectLable.font = [UIFont fontWithName:@"Arial" size:24/2];
    
    
    collectLable.textColor = RGBACOLOR(220, 127, 159, 1);
    
    
    
    
    
    
    UILabel *shareLableNumber = [[UILabel alloc] initWithFrame:CGRectMake(shareImageview.frame.origin.x + 134/2,imageView.frame.size.height + 30/2 , 27/2, 33/2)];
    
    
    shareLableNumber.text = @"0";
    
    shareLableNumber.textColor = RGBACOLOR(110, 137, 191, 1);
    
    
    
    
    shareLableNumber.font = [UIFont fontWithName:@"Arial" size:21];
    
    
    
    UILabel *shareLable = [[UILabel alloc] initWithFrame:CGRectMake(shareImageview.frame.origin.x + 107/2, shareLableNumber.frame.origin.y + shareLableNumber.frame.size.height + 18/2, 97/2,30/2)];
    
    
    shareLable.text = @"分享过的";
    
    
    shareLable.font = [UIFont fontWithName:@"Arial" size:24/2];
    
    
    shareLable.textColor = RGBACOLOR(110, 137, 191, 1);

    
    
    
    
    
    
    
    
    
    
    [self.view addSubview:collectImageView];
     [self.view addSubview:shareImageview];
    [self.view addSubview:imageView];
    
    [self.view addSubview:shareLableNumber];
    
    [self.view addSubview:shareLable];
    
    
    
    [self.view addSubview:collectLable];
    
    [self.view addSubview:collectLableNumber];
    
   
    
    
    [self.view addSubview:lable1];
    
    
    [self.view addSubview:ableLoginButton];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonClick{
    
//    ableLoginButton.backgroundColor  = [UIColor redColor];
    
    
    UserLoginViewController *userLogin = [[UserLoginViewController alloc] init];
    
    [self.navigationController pushViewController:userLogin animated:YES];
    //NSLog(@"dddddd");
}
@end
