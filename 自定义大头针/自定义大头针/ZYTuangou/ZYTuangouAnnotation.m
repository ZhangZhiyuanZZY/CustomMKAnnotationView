//
//  ZYTuangouAnnotation.m
//  自定义大头针
//
//  Created by 章芝源 on 15/11/4.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYTuangouAnnotation.h"

@implementation ZYTuangouAnnotation

- (void)setTougou:(ZYTuangou *)tougou
{
    _tougou = tougou;
    
    _coordinate = tougou.coordinate;
}
@end
