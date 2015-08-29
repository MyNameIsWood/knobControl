//
//  BMFiveButtonControl.h
//  knobControl
//
//  Created by liupc on 15/8/24.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#define BMRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]
#define BMScreenWidth  [UIScreen mainScreen].bounds.size.width
#define BMScreenHeight [UIScreen mainScreen].bounds.size.height

#import <UIKit/UIKit.h>



@interface BMFiveButtonControl : UIControl

/** 5个按钮显示图片的名字 元素是NSString*/
@property (nonatomic, strong) NSArray* imageNames;

/** 5个按钮显示的文字 元素是字符串*/
@property (nonatomic, strong) NSArray* labelTexts;

/** 显示5个按钮的动画*/
- (void)showButtonAnimation;
@end
