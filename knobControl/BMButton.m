//
//  BMButton.m
//  knobControl
//
//  Created by liupc on 15/8/24.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import "BMButton.h"
#import "UIView+Frame.h"
@implementation BMButton
{
    UIImageView* _backgroundImageView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        UIImageView* backgroundImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_bg"]];
        UIImageView* imageView = [[UIImageView alloc]init];
        UILabel*     label     = [[UILabel alloc]init];
        _imageView           = imageView;
        _label               = label;
        [_label setAdjustsFontSizeToFitWidth:YES];
        _backgroundImageView = backgroundImageView;
        [self addSubview:backgroundImageView];
        [self addSubview:_imageView];
        [self addSubview:_label];
        
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    _backgroundImageView.x    = 0;
    _backgroundImageView.y    = 0;
    _backgroundImageView.size = _backgroundImageView.image.size;

    _imageView.size           = _imageView.image.size;
    _imageView.center         = _backgroundImageView.center;

    _label.y                  = CGRectGetMaxY(_backgroundImageView.frame);
    _label.x                  = 0;
    _label.width              = _backgroundImageView.width;
    _label.height             = 30;
    

    self.width                = _backgroundImageView.width;
    self.height               = _backgroundImageView.height+_label.height;
    
}

@end
