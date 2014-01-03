//
//  CollectionPlanView.h
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recommend.h"
#import "Collection.h"



@class CollectionItem;
@protocol CollectionItemDelegate <NSObject>

-(void)CollectionItemDidSelect:(CollectionItem *)collectionItem;

@end

@interface  CollectionItem: UIView

-(id)initWithFrame:(CGRect)frame WithTitile:(NSString *)aTitle imageName:(NSString *)aImageName;
@property(nonatomic,strong)Collection *collection;
@property (nonatomic,weak) id<CollectionItemDelegate> delegate;


@end

@interface CollectionPlanView : UIView
@property (nonatomic,weak) id delegate;
-(id)initWithFrame:(CGRect)frame WithDelegat:(id)delegate;

@end
