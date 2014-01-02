//
//  UserRegisterViewController.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizer.h>

<<<<<<< HEAD
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

-(void)chooseImage:(id)sender;

@property (strong, nonatomic) UITextField *emailTextFieldRegister;
@property (strong, nonatomic) UITextField *passwordTextFieldRegister;
@property (strong, nonatomic) UITextField *repeatPasswordTextFieldRegister;
@property (strong, nonatomic) UITextField *nicknameTextFieldRegister;
@property (strong, nonatomic) UIImageView *userPhoto;

=======
@interface UserRegisterViewController : UIViewController
    
>>>>>>> 71e9562e1f8c3759715c5fdc2789978dec6ec2ab
@end
