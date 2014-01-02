//
//  Plan.h
//  008
//
//
//  Created by zzlmilk on 13-12-24.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.


#import <Foundation/Foundation.h>
#import "Business.h"


@interface Plan : NSObject
{
    
}

@property(nonatomic,strong) NSString *plan_id;
@property(nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *created_at;

@property(nonatomic,strong) NSMutableArray *businesses;

//@property (nonatomic,strong)Business * business;


-(instancetype)initWithDic:(NSDictionary *)dic;


//

@end
