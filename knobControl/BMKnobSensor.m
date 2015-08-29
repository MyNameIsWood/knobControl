//
//  BMKnobSensor.m
//  knobControl
//
//  Created by bluemobi-wh01 on 15/8/19.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import "BMKnobSensor.h"

@implementation BMKnobSensor
{
    CGFloat _totalAngle;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _totalAngle=0;

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch* touch=[touches anyObject];
    //得到参数
    CGPoint startPoint=[touch previousLocationInView:nil];
    CGPoint endPoint=[touch locationInView:nil];
    CGPoint center=self.view.center;
    
    //判断是顺时针 还是逆时针
    CGFloat angle1=[self angleWithStartPoint:startPoint EndPoint:endPoint Center:center ClockWise:0];
    CGFloat angle2=[self angleWithStartPoint:startPoint EndPoint:endPoint Center:center ClockWise:1];
    //得到角度
     CGFloat angle=angle1<ABS(angle2)?angle1:angle2;
    
    //累积totalAngle总和
    _totalAngle+=angle;
    
//    NSLog(@"startPoint---%@",NSStringFromCGPoint(startPoint));
//    NSLog(@"endPoint  ---%@",NSStringFromCGPoint(endPoint));
//    NSLog(@"center    ---%@",NSStringFromCGPoint(center));
//    NSLog(@"clockWise ---%d",clockWise);
//    NSLog(@"angle     ---%f",angle);
    
    //使代理对角度做出响应
    [_target knobSensor:self shouldRotateWithAngle:angle];
        
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_totalAngle>0) {
        while (_totalAngle>=2*M_PI) {
            _totalAngle-=2*M_PI;
        }
    } else {
        while (_totalAngle<0) {
            _totalAngle+=2*M_PI;
        }
    }
    
    [_target knobSensor:self shouldStopAtAngle:_totalAngle];
}

#pragma mark -math
/**
 *  计算起始点和终点之间转过的角度
 *
 *  @param startPoint 起始点
 *  @param endPoint   终点
 *  @param center     中间点
 *  @param clockWise  顺时针是0 否则逆时针
 *
 *  @return 角度 顺时针的角度为正 逆时针角度为负
 */

- (CGFloat)angleWithStartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint Center:(CGPoint)center ClockWise:(int)clockWise{
    //换算成以center为原点的坐标系的值
    CGFloat point1X=startPoint.x-center.x;
    CGFloat point1Y=center.y-startPoint.y;
    CGFloat point2X=endPoint.x-center.x;
    CGFloat point2Y=center.y-endPoint.y;
    
    
    CGFloat angle1=atan2(point1Y, point1X);
    CGFloat angle2=atan2(point2Y, point2X);
    
    
    CGFloat resultAngle=(angle1-angle2);
    
    if (resultAngle<0) {
            resultAngle+=2*M_PI;
        }
    
    if (clockWise) {//逆时针
        resultAngle-=2*M_PI;
    }
    
    return resultAngle;
}

@end
