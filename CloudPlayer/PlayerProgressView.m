//
//  PlayerProgressView.m
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/13.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import "PlayerProgressView.h"
#import "BoldSlider.h"

@interface PlayerProgressView ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet BoldSlider *sliderView;


@end

@implementation PlayerProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        _sliderView.maximumValueImage = [UIImage new];
        _sliderView.maximumTrackTintColor = UIColor.clearColor;
    }
    return self;
}

- (float)maximumValue {
    return self.sliderView.maximumValue;
}

- (void)setMaximumValue:(float)maximumValue {
    self.sliderView.maximumValue = maximumValue;
    
}

- (float)minimumValue {
    return self.sliderView.minimumValue;
}

- (void)setMinimumValue:(float)minimumValue {
    self.sliderView.minimumValue = minimumValue;
}

- (float)value {
    return self.sliderView.value;
}

- (void)setValue:(float)value {
    self.sliderView.value = value;
}

- (void)setCacheValue:(float)cacheValue {
    _cacheValue = cacheValue;
}

- (void)updatePlayableUI {
    if (fabs(self.sliderView.maximumValue) > 10e-6) {
        float progress = self.cacheValue / self.sliderView.maximumValue;
        self.progressView.progress = progress;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect frame = self.bounds;
    frame = CGRectInset(frame, 0, -20);
    frame = CGRectOffset(frame, 0, -10);
    if (CGRectContainsPoint(frame, point)) {
        return self.sliderView;
        
    } else {
        return [super hitTest:point withEvent:event];
    }
}

@end
