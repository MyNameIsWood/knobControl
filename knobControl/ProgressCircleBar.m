//
//  ProgressCircleBar.m
//  knobControl
//
//  Created by liupc on 15/8/21.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import "ProgressCircleBar.h"

@implementation ProgressCircleBar
{
    CAShapeLayer* _progressLayer;
}

- (instancetype)init {
    if (self=[super init]) {//设定一些初始化的东西 此时还没有属性
        self.fillColor=[UIColor clearColor].CGColor;
        
        //初始化一些进度条的一些东东
        CAShapeLayer* progressLayer=[CAShapeLayer layer];
        _progressLayer=progressLayer;
        _progressLayer.fillColor=[UIColor clearColor].CGColor;
//        _progressLayer.strokeStart=0;
        _progressLayer.transform=CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
        _progressLayer.lineCap=kCALineCapRound;
        [self addSublayer:progressLayer];
    }
    return self;
}

- (void)setWidth:(float)width {
    _width=width;
    self.lineWidth=width;
    _progressLayer.lineWidth=width;
}

- (void)setTrackColor:(CGColorRef)trackColor {
    _trackColor=trackColor;
    self.strokeColor=trackColor;
}

- (void)setCenter:(CGPoint)center {
    _center=center;
    self.position=center;
}

-(void)setRadius:(NSInteger)radius {
    _radius=radius;
    //设置轨道的
    self.bounds=CGRectMake(0, 0, 2*radius, 2*radius);
    UIBezierPath* circlePath=[UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.path=circlePath.CGPath;
    
    //设置进度条的
    _progressLayer.frame=self.bounds;
    _progressLayer.path=circlePath.CGPath;
}

- (void)setProgressColor:(CGColorRef)progressColor {
    _progressColor=progressColor;
    _progressLayer.strokeColor=progressColor;
}

- (void)setProgress:(float)progress {
    _progress=progress;
    
    _progressLayer.strokeEnd=progress*M_1_PI*.5;
}
@end
