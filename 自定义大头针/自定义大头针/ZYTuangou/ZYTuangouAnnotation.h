//
//  ZYTuangouAnnotation.h
//  自定义大头针
//
//  Created by 章芝源 on 15/11/4.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ZYTuangou.h"
///模型自定义大头针
@interface ZYTuangouAnnotation : NSObject<MKAnnotation>


///位置
@property(assign, nonatomic)CLLocationCoordinate2D coordinate;

///设置团购模型
@property(nonatomic, strong)ZYTuangou *tougou;

///详细视图有没有被点开的标志
@property(assign, nonatomic)BOOL isShow;

@end
