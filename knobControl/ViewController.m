//
//  ViewController.m
//  knobControl
//
//  Created by bluemobi-wh01 on 15/8/19.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#define kStrokeColorGreen [UIColor colorWithRed:128/255.0 green:157/255.0 blue:47/255.0  alpha:0.8]
#define kStrokeColorBlue [UIColor colorWithRed:55/255.0 green:184/255.0 blue:222/255.0   alpha:0.8]
#define kStrokeColorOrange [UIColor colorWithRed:226/255.0 green:140/255.0 blue:43/255.0 alpha:0.8]
#define kStrokeColorRed [UIColor colorWithRed:210/255.0 green:86/255.0 blue:76/255.0     alpha:0.8]

#define BMImageNames @[@[@"design_icon3",@"construction_icon3",@"sight_icon3",@"mall_icon3",@"society_cion3"],@[@"design_icon",@"construction_icon",@"sight_icon",@"mall_icon",@"society_cion"],@[@"design_icon1",@"construction_icon1",@"sight_icon1",@"mall_icon1",@"society_cion1"],@[@"design_icon2",@"construction_icon2",@"sight_icon2",@"mall_icon2",@"society_cion2"]]

#define BMLabelTexts @[@[@"众装空间",@"装•杂志",@"insta•装",@"装•社区",@"装•小店"],@[@"装•设计",@"装•定制",@"装•视界",@"装•MALL",@"装•攻略"]]

#import "ViewController.h"
#import "BMKnobSensor.h"
#import "ProgressCircleBar.h"
#import "BMFiveButtonControl.h"

@interface ViewController ()<BMKnobSensorDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *knobImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ringImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end

@implementation ViewController
{
    int _state;//0~3  0代表下 1代表左 2代表上 3代表下
    ProgressCircleBar*  _circleBar;
    BMFiveButtonControl* _fiveButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加一个进度条 并设置其属性
    [self addAndSetProgressCircleBar];
    
    //添加手势
    [self addKnobSensor];
    
    //添加5个按钮控件
    [self addFiveButtonControl];
    
    //初始的时候 箭头应该只想最下方 美工的图感觉有点偏啊
    _knobImageView.transform=CGAffineTransformMakeRotation(-M_PI_2+0.01);
    
}

//添加一个进度条 并设置其属性
- (void)addAndSetProgressCircleBar {
    CGFloat width=0.75*[UIScreen mainScreen].bounds.size.width;
    ProgressCircleBar* circleBar=[ProgressCircleBar layer];
    circleBar.trackColor    = [UIColor colorWithRed:97/255.0 green:96/255.0 blue:92/255.0 alpha:0.45].CGColor;
    circleBar.width         = 8;
    circleBar.position      = CGPointMake(0.5*width, 0.5*width);
    circleBar.radius        = 0.8*width*0.5;
    circleBar.progressColor = kStrokeColorRed.CGColor;
    circleBar.progress      = 2*M_PI;
    _circleBar              = circleBar;
    [_backgroundImageView.layer addSublayer:circleBar];
}

//添加手势
- (void)addKnobSensor {
    BMKnobSensor* knobSensor=[[BMKnobSensor alloc]init];
    knobSensor.target=self;
    [_knobImageView addGestureRecognizer:knobSensor];
}

//添加5个按钮控件
- (void)addFiveButtonControl {
    BMFiveButtonControl* fiveButton=[[BMFiveButtonControl alloc]initWithFrame:self.view.bounds];
    [fiveButton addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    _fiveButton=fiveButton;
    [self.view addSubview:fiveButton];
    
    //设置初始的
    _fiveButton.imageNames=BMImageNames[0];
    _fiveButton.labelTexts=BMLabelTexts[0];
    
    [self.view sendSubviewToBack:_fiveButton];
}

//处理点击事件
- (void)clicked:(UIControl*)sender {
    NSLog(@"我被点击了--%ld",(long)sender.tag);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_fiveButton showButtonAnimation];
}

#pragma mark -BMKnobSensorDelegate

- (void)knobSensor:(BMKnobSensor*)knobSensor shouldRotateWithAngle:(CGFloat)angle {
    
    [UIView animateWithDuration:.35 animations:^{
    //在原transform的值得基础上 旋转
        _knobImageView.transform=CGAffineTransformRotate(_knobImageView.transform, angle);
    }];
    
}

- (void)knobSensor:(BMKnobSensor*)knobSensor shouldStopAtAngle:(CGFloat)angle {
    
    
    CGFloat toStopAngle;//toStopAngle为手势停止后 还需要旋转多少方向才能停在坐标轴上
    if (angle<=M_PI_4||angle>=7*M_PI_4) {
        toStopAngle=0-angle;
        
        
    } else if (angle>M_PI_4&&angle<=3*M_PI_4) {
        toStopAngle=M_PI_2-angle;
        _state+=1;
        _state%=4;
        
    } else if (angle>3*M_PI_4&&angle<=5*M_PI_4) {
        toStopAngle=M_PI-angle;
        _state+=2;
        _state%=4;
        
    } else if (angle>5*M_PI_4&&angle<7*M_PI_4) {
        toStopAngle=3*M_PI_2-angle;
        _state+=3;
        _state%=4;
        
    }
    
    
    [UIView animateWithDuration:.7 animations:^{
        
        _knobImageView.transform=CGAffineTransformRotate(_knobImageView.transform, toStopAngle);
        
        
    }];
    
    switch (_state) {
        case 0://南
            _ringImageView.image=[UIImage imageNamed:@"red"];
            _circleBar.progress=2*M_PI;
            _circleBar.progressColor=kStrokeColorRed.CGColor;
            
            //设置5个按钮的图片和文字
            _fiveButton.imageNames=BMImageNames[0];
            _fiveButton.labelTexts=BMLabelTexts[0];
            break;
            
        case 1://西
            _ringImageView.image=[UIImage imageNamed:@"green"];
            _circleBar.progress=M_PI_2;
            _circleBar.progressColor=kStrokeColorGreen.CGColor;
            
            //设置5个按钮的图片和文字
            _fiveButton.imageNames=BMImageNames[1];
            _fiveButton.labelTexts=BMLabelTexts[1];
            break;
            
        case 2://北
            _ringImageView.image=[UIImage imageNamed:@"blue"];
            _circleBar.progress=M_PI;
            _circleBar.progressColor=kStrokeColorBlue.CGColor;
            
            //设置5个按钮的图片和文字
            _fiveButton.imageNames=BMImageNames[2];
            _fiveButton.labelTexts=BMLabelTexts[1];
            break;
            
        case 3://东
            _ringImageView.image=[UIImage imageNamed:@"yellow"];
            _circleBar.progress=3*M_PI_2;
            _circleBar.progressColor=kStrokeColorOrange.CGColor;
            
            //设置5个按钮的图片和文字
            _fiveButton.imageNames=BMImageNames[3];
            _fiveButton.labelTexts=BMLabelTexts[1];
            break;
            
        default:
            break;
    }
    
}


@end
