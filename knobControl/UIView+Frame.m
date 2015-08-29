//
//  UIView+Frame.m
//  knobControl
//
//  Created by liupc on 15/8/24.
//  Copyright (c) 2015年 bluemobi-wh01. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (void)setX:(CGFloat)x {
    CGRect frame=self.frame;
    self.frame=CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame=self.frame;
    self.frame=CGRectMake(frame.origin.x, y, frame.size.width, frame.size.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame=self.frame;
    self.frame=CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame=self.frame;
    self.frame=CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame=self.frame;
    self.frame=CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
}

- (CGSize)size {
    return self.frame.size;
}
@end
