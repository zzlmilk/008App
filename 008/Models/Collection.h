//
//  Collection.h
//  008
//
//  Created by zzlmilk on 13-12-20.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
小清新  1
聚会2
情侣约会3
风景4
今夜不眠5
买醉6
一个人 7
亲子8
其他9
 
  typedef enum {north, south, east, west} direction;

 */
typedef enum {
    xiaoqingxin =1,
    juhui=2,
    qinglvyuehui=3,
    fengjing = 4,
    jingyebumian=5,
    maizui=6,
    yigeren=7,
    qingzi=8,
    qita=9
}type;



@interface Collection : NSObject

-(id)initWith:(NSString *)title imageName:(NSString *)imageName;

@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *imageName;
@property(nonatomic) type collectionType ;



//可从网络获取所有标签 ， 但是目前不用网络获取，直接采用本地和服务器制定的id来枚举实现
+(NSURLSessionDataTask *)collectionParameters:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *collection, NSError *e))block;




@end
