//
//  AllCharacteristicController.h
//  008
//
//  Created by 单好坤 on 14-1-16.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "Regions.h"
#import "CollectionSearchView.h"
#import "Collection.h"

@class Characteristic;

//@protocol CharacteristicDelegate <NSObject>
//
//- (void)chooseCharacteristic:(Collection *)p;
//
//@end


//-(void)changeCharacteristic:(Collection *)p;//1.1定义协议与方法
//@end


@interface AllCharacteristicController :UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *characteristicTableView;
    NSMutableArray *collections;

}

//@property (nonatomic, assign) id<CharacteristicDelegate> charactDelegate;
@property(nonatomic,strong)Collection *collection;

@end
