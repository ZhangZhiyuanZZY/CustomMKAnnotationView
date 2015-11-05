//
//  ViewController.m
//  自定义大头针
//
//  Created by 章芝源 on 15/11/4.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
/**
 *  团购详情
 */
#import "ZYDetailTuangouAnnotation.h"
/**
 *  团购头文件
 */
#import "ZYTuangou.h"
#import "ZYTuangouAnnotation.h"
#import "ZYTuangouAnnotationView.h"
#import "ZYDetailTuangouAnnotationView.h"
@interface ViewController ()<MKMapViewDelegate>
///mapview
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

///创建一个数组存放所有数据
@property(nonatomic, strong)NSArray *allData;
@end

@implementation ViewController

#pragma mark - lazy
- (NSArray *)allData
{
    if (!_allData) {
        ZYTuangou *tougou = [[ZYTuangou alloc]init];
        tougou.title = @"大保健";
        tougou.subtitle = @"你懂得";
        tougou.icon = @"category_1";
        tougou.imageName = @"ktv";
        tougou.coordinate = CLLocationCoordinate2DMake(45, 120);
        
        ZYTuangou *tougou1 = [[ZYTuangou alloc]init];
        tougou1.title = @"天上人间";
        tougou1.subtitle = @"乐不思蜀";
        tougou1.icon = @"category_2";
        tougou1.imageName = @"ktv";
        tougou1.coordinate = CLLocationCoordinate2DMake(29, 110);
        
        ///创建数组
        _allData = @[tougou,tougou1];
    }
    return _allData;
}


- (void)loadView
{
    [super loadView];
}


- (void)awakeFromNib
{
//    UIButton *bb = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    [self.view addSubview:bb];
    
    UIView *vv = [[UIView alloc]init];
    vv.backgroundColor = [UIColor redColor];
//    vv.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:vv];
}





- (void)viewDidLoad {
    [super viewDidLoad];
  
    //代理
    self.mapView.delegate = self;
    //遍历模型添加到mapView   这是第一次进程序的时候默认加载, 地图上的大图标, 一进程序就能看见
    for (ZYTuangou *tougou in self.allData) {
        ZYTuangouAnnotation *annotation = [[ZYTuangouAnnotation alloc]init];
        annotation.tougou = tougou;
        [self.mapView addAnnotation:annotation];
    }
}


///2. 添加大头针视图
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    ///判断大头针模型类型
    if ([annotation isKindOfClass:[ZYTuangouAnnotation class]]) {
        //创建view
        static NSString *ID = @"anno";
        ZYTuangouAnnotationView *view = (ZYTuangouAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:ID];
        if (view == nil) {
            view = [[ZYTuangouAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:ID];
        }
        ZYTuangouAnnotation *tougouAnnotation = annotation;
        ///设置图标
        view.image = [UIImage imageNamed:tougouAnnotation.tougou.icon];
        
        return view;
        ///如果是详细大头针模型, 就创建详细大头针视图
    }else if ([annotation isKindOfClass:[ZYDetailTuangouAnnotation class]]){
        static NSString *ID = @"desc";
        ZYDetailTuangouAnnotationView *view = (ZYDetailTuangouAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:ID];
        if (view == nil) {
            view = [[ZYDetailTuangouAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:ID];
        }
        ZYDetailTuangouAnnotation *detail = (ZYDetailTuangouAnnotation *)annotation;
        view.tougou = detail.tougou;
        return view;
    }
    ///这里不需要蓝色系统自带的大头针
    return nil;
}

#pragma mark -MKMapViewDelegate  
//大头针被点击之后, 调用
//3. 代理方法
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    ///被点击的大头针
    //详情 跳转界面
    if ([view isKindOfClass:[ZYDetailTuangouAnnotationView class]]) {
        NSLog(@"去跳转界面");
        ///如果是团购大头针view
    }else if([view isKindOfClass:[ZYTuangouAnnotationView class]]){
        ///这个视图还有这个属性
        ZYTuangouAnnotation *tuangouAnnotation = (ZYTuangouAnnotation *)view.annotation;
        ///判断
        if (tuangouAnnotation.isShow) {
            return;
        }
        
        ///移除所有团购视图
        for (id annnotation in mapView.annotations) {
            ///是详情团购大头针的话, 移除
            if ([annnotation isKindOfClass:[ZYDetailTuangouAnnotation class]]) {
                [self.mapView removeAnnotation:annnotation];
                ///是团购大头针模型的话 修改展开标志
            }else{
                ///将所有mapView上 大头针都 设置成no
                ZYTuangouAnnotation *tougouAnno = (ZYTuangouAnnotation *)annnotation;
                tougouAnno.isShow = NO;
            }
            
          ///创建被点击大头针的详情大头针视图
           ZYTuangouAnnotation *tougou = (ZYTuangouAnnotation *)view.annotation;
            tougou.isShow = YES;
            ///创建详情大头针模型
            ZYDetailTuangouAnnotation *detailTuangou = [[ZYDetailTuangouAnnotation alloc]init];
            
            ///赋值
            detailTuangou.tougou = tougou.tougou;
            
            ///将大头针模型添加到 mapView会自动调用  返回  MKAnnotationView的方法
            [self.mapView addAnnotation:detailTuangou];
            
        }
        
    }
}
@end
