//
//  UserLoginViewController.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WeiboSDK.h"

@interface UserLoginViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *emailTextFieldLogin;
    UITextField *passwordTextFieldLogin;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)textFieldDidBeginEditing:(UITextField *)textField;

-(void)userLoginFun:(id)sender;

- (void)ssoButtonPressed;

@property (strong, nonatomic) NSString *emailTextLogin;
@property (strong, nonatomic) NSString *passwordTextLogin;
@end
