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

@interface AllCharacteristicController :
UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *characteristicTableView;
    NSMutableArray *collections;
}
@property(nonatomic,strong)Collection *collection;

@end
