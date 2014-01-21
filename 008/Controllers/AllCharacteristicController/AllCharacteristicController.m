//
//  AllCharacteristicController.m
//  008
//
//  Created by 单好坤 on 14-1-16.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "AllCharacteristicController.h"
#import "CollectionSearchView.h"
#import "SearchViewController.h"
#import "Collection.h"

@interface AllCharacteristicController()

@end


@implementation AllCharacteristicController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//@synthesize charactDelegate = _charactDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    characteristicTableView = [[UITableView alloc] init];
    characteristicTableView.frame = CGRectMake(0, 0, 320, 480);
    characteristicTableView.dataSource = self;
    characteristicTableView.delegate = self;
    
    characteristicTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:characteristicTableView];
    

    collections = [NSMutableArray array];
    Collection *c1 = [[Collection alloc]init];
    c1.title = @"小清新";
    c1.imageName = @"xiaoQinXin";
    c1.collectionType = xiaoqingxin;
    
    Collection *c2 = [[Collection alloc]initWith:@"聚会" imageName:@"juHui"];
    c2.collectionType = juhui;
    
    Collection *c3 = [[Collection alloc]initWith:@"情侣约会" imageName:@"qinLvYueHui"];
    c3.collectionType = qinglvyuehui;
    
    Collection *c4 = [[Collection alloc]initWith:@"风景" imageName:@"fengJing"];
    c4.collectionType = fengjing;
    
    Collection *c5 = [[Collection alloc]initWith:@"今夜不眠" imageName:@"jinYeBuMian"];
    c5.collectionType = jingyebumian;
    
    Collection *c6 = [[Collection alloc]initWith:@"买醉" imageName:@"maiZui"];
    c6.collectionType = maizui;
    
    Collection *c7 = [[Collection alloc]initWith:@"一个人" imageName:@"qinLvYueHui"];
    c7.collectionType = yigeren;
    
    Collection *c8 = [[Collection alloc]initWith:@"亲子" imageName:@"qinZi"];
    c8.collectionType = qingzi;
    
    Collection *c9 = [[Collection alloc]initWith:@"其他" imageName:@"qita"];
    c9.collectionType = qita;
    
    [collections addObject:c1];
    [collections addObject:c2];
    [collections addObject:c3];
    [collections addObject:c4];
    [collections addObject:c5];
    [collections addObject:c6];
    [collections addObject:c7];
    [collections addObject:c8];
    [collections addObject:c9];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return collections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    
    Collection *characteristic = collections[indexPath.row];
    cell.textLabel.text = characteristic.title;
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:15];
    cell.textLabel.frame = CGRectMake(20,10, 100,30);
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Collection * p = collections[indexPath.row];
    SearchViewController *SearchView = [[SearchViewController alloc] init];
    SearchView.collection = p;
   [self.navigationController pushViewController:SearchView animated:YES];

//   [self.charactDelegate chooseCharacteristic:(Collection *)p];

}


@end