//
//  BMKnobSensor.h
//  knobControl
//
//  Created by bluemobi-wh01 on 15/8/19.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BMKnobSensor;
@protocol BMKnobSensorDelegate <UIGestureRecognizerDelegate>
@optional
/**
 *  在拖动的过程中代理会不断接受此消息
 *
 *  @param knobSensor 手势识别器对象
 *  @param angle      角度
 */
- (void)knobSensor:(BMKnobSensor*)knobSensor shouldRotateWithAngle:(CGFloat)angle;
/**
 *  在拖动停止时代理会接收此消息
 *
 *  @param knobSensor 手势识别器对象
 *  @param angle      手势停止时 终止的位置 与开始位置转过的角度（0-2*PI）
 */
- (void)knobSensor:(BMKnobSensor*)knobSensor shouldStopAtAngle:(CGFloat)angle;

@end


@interface BMKnobSensor : UIGestureRecognizer
@property ( weak, nonatomic) id<BMKnobSensorDelegate> target;
@end
