//
//  User.h
//  008
//
//  Created by zzlmilk on 13-12-30.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *userPassword;
@property(nonatomic,strong)NSString *userNickName;

-(void)Login:(NSString *)name AndPassword:(NSString *)password;



@end
