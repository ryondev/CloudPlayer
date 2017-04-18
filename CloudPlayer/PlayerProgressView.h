//
//  PlayerProgressView.h
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/13.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerProgressView : UIView

@property(nonatomic, assign) float maximumValue;
@property(nonatomic, assign) float minimumValue;
@property(nonatomic, assign) float value;
@property(nonatomic, assign) float cacheValue;

@property(nonatomic, copy) void (^downBlock)();
@property(nonatomic, copy) void (^seekBlock)(float value);

- (void)updatePlayableUI;

@end
