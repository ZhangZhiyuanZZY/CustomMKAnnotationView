//
//  ZYDetailTuangouAnnotationView.m
//  自定义大头针
//
//  Created by 章芝源 on 15/11/4.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYDetailTuangouAnnotationView.h"
#import "ZYDetailView.h"
#import "UIView+AdjustFrame.h"
@interface ZYDetailTuangouAnnotationView()
@property(nonatomic, weak)ZYDetailView *detailView;
@end
@implementation ZYDetailTuangouAnnotationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        ZYDetailView *detailView = [ZYDetailView descView];
        detailView.tuangou = self.tougou;
        detailView.x = -85;
        detailView.y = -110;
        self.detailView = detailView;
        [self addSubview:detailView];
    }
    return self;
}





- (void)setTougou:(ZYTuangou *)tougou
{
    _tougou = tougou;
    self.detailView.tuangou = tougou;
}
@end
