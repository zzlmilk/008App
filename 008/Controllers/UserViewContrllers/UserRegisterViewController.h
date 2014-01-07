//
//  UserRegisterViewController.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizer.h>

@interface UserRegisterViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
    UIScrollView *registerScrollView;
    UITextField *emailTextFieldRegister;
    UITextField *passwordTextFieldRegister;
    UITextField *repeatPasswordTextFieldRegister;
    UITextField *nicknameTextFieldRegister;
    UIImageView *userPhoto;
    UIImageView *registerInfoBackgroundImage;
    UIButton *registerButton;
    BOOL becomeFirstResponder;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)textFieldDidBeginEditing:(UITextField *)textField;

-(void)userRegisterFun:(id)sender;

@property (strong, nonatomic) NSString *emailTextRegister;
@property (strong, nonatomic) NSString *passwordTextRegister;
@property (strong, nonatomic) NSString *repeatPasswordTextRegister;
@property (strong, nonatomic) NSString *nicknameTextRegister;
//@property (strong, nonatomic) NSString *userPhoto;


@end
