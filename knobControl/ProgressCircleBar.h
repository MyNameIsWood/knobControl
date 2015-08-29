//
//  ProgressCircleBar.h
//  knobControl
//
//  Created by liupc on 15/8/21.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
/**
 *   环形进度条
 */
@interface ProgressCircleBar : CAShapeLayer
/** 环形进度条的宽度*/
@property ( nonatomic, assign) float        width;
/** 轨迹背景的颜色*/
@property ( nonatomic, assign) CGColorRef   trackColor;
/** 进度的颜色*/
@property ( nonatomic, assign) CGColorRef   progressColor;
/** 设置进度 0-2*PI之间的浮点型*/
@property ( nonatomic, assign) float        progress;
/** 圆环的中心点*/
@property ( nonatomic, assign) CGPoint      center;
/** 圆环的半径*/
@property ( nonatomic, assign) NSInteger    radius;
@end
