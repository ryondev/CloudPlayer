//
//  BoldSlider.m
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/18.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import "BoldSlider.h"

@implementation BoldSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)trackRectForBounds:(CGRect)bounds {
    CGRect rect = CGRectOffset(bounds, -5, 0);
    return rect;
}

@end
