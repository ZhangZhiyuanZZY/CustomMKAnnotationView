//
//  ZYDetailTuangouAnnotation.h
//  自定义大头针
//
//  Created by 章芝源 on 15/11/4.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ZYTuangou.h"
@interface ZYDetailTuangouAnnotation : NSObject<MKAnnotation>
///团购模型
@property(nonatomic, strong)ZYTuangou *tougou;

///详细信息的coordinate 这个属性, 因为是遵守  MKAnnotation协议, 处理的其实是MKAnnotation 的coordinate属性, 系统会
///自动帮助我们找到经纬度的点, 并把控件移动过去, 不需要我们设置
@property(assign, nonatomic)CLLocationCoordinate2D coordinate;
@end
