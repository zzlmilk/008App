//
//  UserLoginViewController.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserLoginViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *emailTextFieldLogin;
    UITextField *passwordTextFieldLogin;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)textFieldDidBeginEditing:(UITextField *)textField;


@property (strong, nonatomic) UITextField *emailTextFieldLogin;
@property (strong, nonatomic) UITextField *passwordTextFieldLogin;
@end
