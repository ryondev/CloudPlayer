//
//  TouchOptimizationView.m
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/13.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import "TouchOptimizationView.h"

@implementation TouchOptimizationView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.optimizationFlag) {
        return [super hitTest:point withEvent:event];
    } else {
        CGRect frame = self.progressView.frame;
        frame = CGRectInset(frame, 0, -20);//边界扩大20px
        frame = CGRectOffset(frame, 0, -10);//位置向y轴负方向偏移10像素
        
        if (CGRectContainsPoint(frame, point)) {//判断触摸位置坐标是否在优化后的progress frame内
            CGPoint aPoint = [self convertPoint:point toView:self.progressView];
            return [self.progressView hitTest:aPoint withEvent:event];//主动将touch事件传递给progressView以实现touch optimization
        } else {
            return [super hitTest:point withEvent:event];
        }
    }
}

@end
