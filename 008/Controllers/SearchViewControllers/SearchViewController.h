//
//  SearchViewController.h
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionSearchView.h"

@class Regions;

@interface SearchViewController : UIViewController<AllRegionsDelegate,CollectSearchDelegate>{
    NSString *regionsName;
    CollectionSearchView *collectionSearchView;
    BOOL flag;
}

@property (nonatomic,strong) Regions *regions;

@end
