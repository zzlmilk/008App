//
//  UserRegisterViewController.m
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "UserRegisterViewController.h"
#import "User.h"
#import "Error.h"

@interface UserRegisterViewController ()

@end

@implementation UserRegisterViewController

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
    
    registerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*2)];
    registerScrollView.backgroundColor = [UIColor colorWithRed:250/255.f green:250/255.f blue:250/255.f alpha:1];
   // registerScrollView.backgroundColor = [UIColor redColor];
    registerScrollView.showsVerticalScrollIndicator = YES;
    registerScrollView.scrollEnabled = YES;
    registerScrollView.contentSize = CGSizeMake(320,960+200);
    [self.view addSubview:registerScrollView];
    
    userPhoto = [[UIImageView alloc]init];
    [userPhoto setImage:[UIImage imageNamed:@"touXiang"]];
    userPhoto.frame = CGRectMake(250/2, 80/2, 122/2, 122/2);
    [registerScrollView addSubview:userPhoto];
    
    registerInfoBackgroundImage = [[UIImageView alloc]init];
    [registerInfoBackgroundImage setImage:[UIImage imageNamed:@"zhuCe"]];
    registerInfoBackgroundImage.frame = CGRectMake(0, 256/2, 320, 355/2);
    [registerScrollView addSubview:registerInfoBackgroundImage];
    
    registerButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"queRen"] forState:UIControlStateNormal];
    [registerButton setFrame:CGRectMake(30/2, 674/2, 587/2, 75/2.f)];
    //[button addTarget:selfaction:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [registerButton addTarget:self action:@selector(userRegisterFun:) forControlEvents:UIControlEventTouchDown];
    [registerScrollView addSubview:registerButton];
    
    emailTextFieldRegister = [[UITextField alloc] initWithFrame:CGRectMake(81, 138, 230.0f, 30.0f)];
    [emailTextFieldRegister setBorderStyle:UITextBorderStyleNone];
    emailTextFieldRegister.returnKeyType = UIReturnKeyDone;
    emailTextFieldRegister.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    emailTextFieldRegister.delegate = self;
    [registerScrollView addSubview:emailTextFieldRegister];
    
    passwordTextFieldRegister = [[UITextField alloc] initWithFrame:CGRectMake(81, 182, 230.0f, 30.0f)];
    [passwordTextFieldRegister setBorderStyle:UITextBorderStyleNone];
    passwordTextFieldRegister.returnKeyType = UIReturnKeyDone;
    passwordTextFieldRegister.secureTextEntry = YES; //密码
    passwordTextFieldRegister.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    passwordTextFieldRegister.delegate = self;
    [registerScrollView addSubview:passwordTextFieldRegister];
    
    repeatPasswordTextFieldRegister = [[UITextField alloc] initWithFrame:CGRectMake(81, 225, 230.0f, 30.0f)];
    [repeatPasswordTextFieldRegister setBorderStyle:UITextBorderStyleNone];
    repeatPasswordTextFieldRegister.returnKeyType = UIReturnKeyDone;
    repeatPasswordTextFieldRegister.secureTextEntry = YES;//重复密码
    repeatPasswordTextFieldRegister.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    repeatPasswordTextFieldRegister.delegate = self;
    [registerScrollView addSubview:repeatPasswordTextFieldRegister];
    
    nicknameTextFieldRegister = [[UITextField alloc] initWithFrame:CGRectMake(81, 268, 230.0f, 30.0f)];
    [nicknameTextFieldRegister setBorderStyle:UITextBorderStyleNone];
    nicknameTextFieldRegister.returnKeyType = UIReturnKeyJoin;
    nicknameTextFieldRegister.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    nicknameTextFieldRegister.delegate = self;
    [registerScrollView addSubview:nicknameTextFieldRegister];
    
    //键盘出现通知事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:)name:UIKeyboardWillShowNotification object:nil];
    
    //键盘消失通知事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:)name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [emailTextFieldRegister resignFirstResponder];
    [passwordTextFieldRegister resignFirstResponder];
    [repeatPasswordTextFieldRegister resignFirstResponder];
    [nicknameTextFieldRegister resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    //开始编辑时触发，文本字段将成为first responder

}


//键盘弹起后处理scrollView的高度使得textfield可见

-(void)keyboardDidShow:(NSNotification*)notice{

    [registerScrollView setContentOffset:CGPointMake(0, 40) animated:YES];
}

//键盘隐藏后处理scrollview的高度，使其还原为本来的高度
-(void)keyboardDidHide:(NSNotification*)notice{
    
    [registerScrollView setContentOffset:CGPointMake(0, -65) animated:YES];

}

-(void)userRegisterFun:(id)sender{

    _emailTextRegister = emailTextFieldRegister.text;
    _passwordTextRegister = passwordTextFieldRegister.text;
    _repeatPasswordTextRegister = repeatPasswordTextFieldRegister.text;
    _nicknameTextRegister = nicknameTextFieldRegister.text;
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
                         _emailTextRegister, @"email",
                         _passwordTextRegister, @"password",
                         _nicknameTextRegister, @"user_name",
                         nil];
    
    [User userRegisterParameters:dic WithBlock:^(User *user,Error *e) {
        if (user) {
            
        }
        else{
            if (e) {
                Error *error = e;
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"%@",error.errorStatus] message:e.statusInfo delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }];
}



@end
