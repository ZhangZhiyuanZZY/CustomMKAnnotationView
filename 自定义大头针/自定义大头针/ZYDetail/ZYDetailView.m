//
//  ZYDetailView.m
//  自定义大头针
//
//  Created by 章芝源 on 15/11/5.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYDetailView.h"
@interface ZYDetailView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@end
@implementation ZYDetailView
///加载xib
+ (instancetype)descView
{
    return [[NSBundle mainBundle]loadNibNamed:@"ZYDetailView" owner:nil options:nil].lastObject;
}


- (void)setTuangou:(ZYTuangou *)tuangou
{
    _tuangou = tuangou;
    
    self.imageView.image = [UIImage imageNamed:tuangou.imageName];
    self.title.text = tuangou.title;
    self.subTitle.text = tuangou.subtitle;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    
    NSLog(@"self.frame%f", self.frame.origin.x);
    return self;
}




- (void)awakeFromNib
{
    NSLog(@"self.frame%f", self.frame.origin.x);
}


- (void)layoutSubviews
{
    
}





//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor = [UIColor redColor];
//    }
//    return self;
//}
@end
