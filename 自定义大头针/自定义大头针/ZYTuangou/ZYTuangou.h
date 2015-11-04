//
//  ZYTuangou.h
//  自定义大头针
//
//  Created by 章芝源 on 15/11/4.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h> //这个框架里面内置了<CoreLocation>框架
///模型-大头针普通信息
@interface ZYTuangou : NSObject

///图片
@property(copy, nonatomic)NSString *icon;

///配图
@property(copy, nonatomic)NSString *imageName;

///标题
@property(copy, nonatomic)NSString *title;

///子标题
@property(copy, nonatomic)NSString *subtitle;

///团购位置
@property(assign, nonatomic)CLLocationCoordinate2D coordinate;

@end
