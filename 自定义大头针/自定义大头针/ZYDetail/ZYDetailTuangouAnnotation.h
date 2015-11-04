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

///
@property(assign, nonatomic)CLLocationCoordinate2D coordinate;
@end
