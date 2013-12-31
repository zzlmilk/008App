//
//  CollectionPlanView.m
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "CollectionPlanView.h"
#import "Collection.h"

@implementation CollectionItem
-(id)initWithFrame:(CGRect)frame WithTitile:(NSString *)aTitle imageName:(NSString *)aImageName{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:aImageName]];
        imageView.frame = CGRectMake(0, 0, 113.f/2, 113.f/2);
        [self addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height , frame.size.width, 13)];
        label.text = aTitle;
        label.textColor = RGBACOLOR(80, 80, 80, 1);
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
    }
    
    return self;
}

@end

@implementation CollectionPlanView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        NSMutableArray *collections = [NSMutableArray array];
        Collection *c1 = [[Collection alloc]init];
        c1.title = @"小清新";
        c1.imageName = @"xiaoQinXin";
        Collection *c2 = [[Collection alloc]initWith:@"聚会" imageName:@"juHui"];
        Collection *c3 = [[Collection alloc]initWith:@"情侣约会" imageName:@"qinLvYueHui"];
        Collection *c4 = [[Collection alloc]initWith:@"风景" imageName:@"fengJing"];
        Collection *c5 = [[Collection alloc]initWith:@"今夜不眠" imageName:@"jinYeBuMian"];
        Collection *c6 = [[Collection alloc]initWith:@"买醉" imageName:@"maiZui"];
        Collection *c7 = [[Collection alloc]initWith:@"一个人" imageName:@"qinLvYueHui"];
        Collection *c8 = [[Collection alloc]initWith:@"亲子" imageName:@"qinZi"];
        Collection *c9 = [[Collection alloc]initWith:@"其他" imageName:@"qita"];
        
        [collections addObject:c1];
        [collections addObject:c2];
        [collections addObject:c3];
        [collections addObject:c4];
        [collections addObject:c5];
        [collections addObject:c6];
        [collections addObject:c7];
        [collections addObject:c8];
        [collections addObject:c9];
        

        
        for (int i = 0; i <9; i++) {
            Collection *c = [collections objectAtIndex:i];
            CollectionItem *itemView = [[CollectionItem alloc]initWithFrame:CGRectMake(i%3 *(113.f/2 + 75/2)+75/2, floor(i/3)*(15+75), 113.f/2, 149/2) WithTitile:c.title imageName:c.imageName];
            itemView.collection  = c;
            itemView.delegate = self;
            itemView.backgroundColor = [UIColor clearColor];
            [self addSubview:itemView];
            
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
