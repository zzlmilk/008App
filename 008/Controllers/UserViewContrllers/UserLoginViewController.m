//
//  UserLoginViewController.m
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "UserLoginViewController.h"
#import "User.h"
#import "WeiboSDK.h"

@interface UserLoginViewController ()

@end

@implementation UserLoginViewController

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

    [self.view setBackgroundColor:[UIColor colorWithRed:250/255.f green:250/255.f blue:250/255.f alpha:1]];
    
    UIImageView *loginBackgroundImage = [[UIImageView alloc]init];
    [loginBackgroundImage setImage:[UIImage imageNamed:@"dengRuBg"]];
    loginBackgroundImage.frame = CGRectMake(0, 79, 320, 184/2.f);
    [self.view addSubview:loginBackgroundImage];
    
    emailTextFieldLogin = [[UITextField alloc] initWithFrame:CGRectMake(165/2, 90.0f, 230.0f, 30.0f)];
    [emailTextFieldLogin setBorderStyle:UITextBorderStyleNone]; //外框类型
    emailTextFieldLogin.returnKeyType = UIReturnKeyDone;
    emailTextFieldLogin.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    [emailTextFieldLogin becomeFirstResponder];
    emailTextFieldLogin.delegate = self;
    [self.view addSubview:emailTextFieldLogin];
    
    passwordTextFieldLogin = [[UITextField alloc] initWithFrame:CGRectMake(165/2, 133.0f, 230.0f, 30.0f)];
    [passwordTextFieldLogin setBorderStyle:UITextBorderStyleNone]; //外框类型
    passwordTextFieldLogin.secureTextEntry = YES; //密码
    passwordTextFieldLogin.returnKeyType = UIReturnKeyGo;
    passwordTextFieldLogin.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    [passwordTextFieldLogin becomeFirstResponder];
    passwordTextFieldLogin.delegate = self;
    [self.view addSubview:passwordTextFieldLogin];
    
    UIButton *forgotPasswordButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [forgotPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgotPasswordButton setFrame:CGRectMake(242, 173, 80, 30)];
    forgotPasswordButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
    [forgotPasswordButton setTitleColor:[UIColor colorWithRed:235/255.f green:116/255.f blue:152/255.f alpha:1.0f] forState:UIControlStateNormal];
    [self.view addSubview:forgotPasswordButton];
    
    
    UIButton *loginButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"dengLu"] forState:UIControlStateNormal];
    [loginButton setFrame:CGRectMake(16, 208, 272/2, 75/2.f)];
    [loginButton addTarget:self action:@selector(userLoginFun:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loginButton];
    
    UIButton *registerButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"DengLuZhuCe"] forState:UIControlStateNormal];
    [registerButton setFrame:CGRectMake(168, 208, 272/2, 75/2.f)];
    [self.view addSubview:registerButton];
    
    UIButton *weiboLoginButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [weiboLoginButton setBackgroundImage:[UIImage imageNamed:@"WeiBoDengru"] forState:UIControlStateNormal];
    [weiboLoginButton setFrame:CGRectMake(16, 258, 577/2, 77/2.f)];
    [self.view addSubview:weiboLoginButton];
    [weiboLoginButton addTarget:self action:@selector(ssoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}


- (void)ssoButtonPressed
{
    webView = [[UIWebView alloc]init];
    webView.frame =CGRectMake(0, 60, 340, 600);
    [self.view addSubview:webView];
    
    
    NSString *urlString = @"https://api.weibo.com/oauth2/authorize?client_id=2909579077&redirect_uri=http://www.baidu.com&response_type=code&display=mobile&state=authorize";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [webView setDelegate:self];
    [webView loadRequest:request];

    
}
    //////weibo
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *backURL = [request URL];  //接受重定向的URL
    NSString *backURLString = [backURL absoluteString];
    
    //判断是否是授权调用返回的url
    if ([backURLString hasPrefix:@"http://www.baidu.com/?"]) {
        NSLog(@"back url string :%@",backURLString);
        
        //找到”code=“的range
        NSRange rangeOne;
        rangeOne=[backURLString rangeOfString:@"code="];
        
        //根据他“code=”的range确定code参数的值的range
        NSRange range = NSMakeRange(rangeOne.length+rangeOne.location, backURLString.length-(rangeOne.length+rangeOne.location));
        //获取code值
        NSString *codeString = [backURLString substringWithRange:range];
        NSLog(@"code = :%@",codeString);
        
        //access token调用URL的string
        NSMutableString *muString = [[NSMutableString alloc] initWithString:@"https://api.weibo.com/oauth2/access_token?client_id=2909579077&client_secret=90184f4606fd04f449131ea4fbdb74c4&grant_type=authorization_code&redirect_uri=http://www.baidu.com&code="];
        [muString appendString:codeString];
        NSLog(@"access token url :%@",muString);
        
        //第一步，创建URL
        NSURL *urlstring = [NSURL URLWithString:muString];
        //第二步，创建请求
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlstring cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
        NSString *str = @"type=focus-c";//设置参数
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        //第三步，连接服务器
        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
        NSLog(@"Back String :%@",str1);
        
        //如何从str1中获取到access_token
       // NSDictionary *dictionary = [str1 objectFromJSONString];
       // NSLog(@"access token is:%@",[dictionary objectForKey:@"access_token"]);
        
    }
    return YES;
}




- (void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [emailTextFieldLogin resignFirstResponder];
    [passwordTextFieldLogin resignFirstResponder];
    return YES;
}
    //用户登录
-(void)userLoginFun:(id)sender{
    
    _emailTextLogin = emailTextFieldLogin.text;
    _passwordTextLogin = passwordTextFieldLogin.text;
    
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
                         _emailTextLogin, @"userEmail",
                         _passwordTextLogin, @"userPassword",
                         nil];
    
    [User userLoginParameters:dic WithBlock:^(User *user, NSError *e) {
    
    }];
    
    
}

    //开始编辑时触发，文本字段将成为first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

@end
