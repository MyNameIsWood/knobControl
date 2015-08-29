//
//  BMFiveButtonControl.m
//  knobControl
//
//  Created by liupc on 15/8/24.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import "BMFiveButtonControl.h"
#import "BMButton.h"
@implementation BMFiveButtonControl
{
    BMButton* _btn1;
    BMButton* _btn2;
    BMButton* _btn3;
    BMButton* _btn4;
    BMButton* _btn5;
}

- (void)setImageNames:(NSArray *)imageNames {
    _imageNames=imageNames;
    _btn1.imageView.image=[UIImage imageNamed:(NSString*)imageNames[0]];
    _btn2.imageView.image=[UIImage imageNamed:(NSString*)imageNames[1]];
    _btn3.imageView.image=[UIImage imageNamed:(NSString*)imageNames[2]];
    _btn4.imageView.image=[UIImage imageNamed:(NSString*)imageNames[3]];
    _btn5.imageView.image=[UIImage imageNamed:(NSString*)imageNames[4]];
}

- (void)setLabelTexts:(NSArray *)labelTexts {
    _labelTexts=labelTexts;
    _btn1.label.text=(NSString*)labelTexts[0];
    _btn2.label.text=(NSString*)labelTexts[1];
    _btn3.label.text=(NSString*)labelTexts[2];
    _btn4.label.text=(NSString*)labelTexts[3];
    _btn5.label.text=(NSString*)labelTexts[4];
}

- (void)layoutSubviews {
    _btn1.center=self.center;
    _btn2.center=self.center;
    _btn3.center=self.center;
    _btn4.center=self.center;
    _btn5.center=self.center;
}

//重构初始化方法
- (instancetype)initWithFrame:(CGRect)aRect {
    if (self=[super initWithFrame:aRect]) {
        //添加5个按钮
        [self createFiveButtons];
        
        //背景设为透明
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

//添加5个按钮
- (void)createFiveButtons {
    BMButton* btn1=[[BMButton alloc]init];
    BMButton* btn2=[[BMButton alloc]init];
    BMButton* btn3=[[BMButton alloc]init];
    BMButton* btn4=[[BMButton alloc]init];
    BMButton* btn5=[[BMButton alloc]init];
    
    btn1.tag=1;
    btn2.tag=2;
    btn3.tag=3;
    btn4.tag=4;
    btn5.tag=5;
    
    _btn1=btn1;
    _btn2=btn2;
    _btn3=btn3;
    _btn4=btn4;
    _btn5=btn5;
    
    [self addSubview:btn1];
    [self addSubview:btn2];
    [self addSubview:btn3];
    [self addSubview:btn4];
    [self addSubview:btn5];
    
    
}

//重构添加目标方法
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [_btn1 addTarget:target action:action forControlEvents:controlEvents];
    [_btn2 addTarget:target action:action forControlEvents:controlEvents];
    [_btn3 addTarget:target action:action forControlEvents:controlEvents];
    [_btn4 addTarget:target action:action forControlEvents:controlEvents];
    [_btn5 addTarget:target action:action forControlEvents:controlEvents];
}

//显示5个按钮的动画
- (void)showButtonAnimation {
    CGFloat margin=40;
    CGFloat initialHeight=110;
    
    CGFloat HPadding=0.25*(BMScreenWidth-2*margin);
    CGFloat VPadding=0.5*(0.5*BMScreenHeight-2*initialHeight);
    
    [UIView animateWithDuration:2.0 animations:^{
        _btn1.transform=CGAffineTransformMakeTranslation(-2*HPadding, initialHeight);
        _btn2.transform=CGAffineTransformMakeTranslation(  -HPadding, initialHeight+  VPadding);
        _btn3.transform=CGAffineTransformMakeTranslation(          0, initialHeight+2*VPadding);
        _btn4.transform=CGAffineTransformMakeTranslation(   HPadding, initialHeight+  VPadding);
        _btn5.transform=CGAffineTransformMakeTranslation( 2*HPadding, initialHeight);
    }];
}


@end
