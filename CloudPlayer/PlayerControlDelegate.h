//
//  PlayerControlDelegate.h
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/14.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlayerControlDelegate <NSObject>

- (void)play;
- (void)pause;
- (void)seek:(NSTimeInterval)position;
- (void)destroy;
- (void)realtimeVariable:(NSTimeInterval *)playableDuration position:(NSTimeInterval *)position;

@end

@protocol PlayerActionDelegate <NSObject>

- (void)updateTitle:(NSString *)title;
- (void)startLoadingAnimation;
- (void)stopLoadingAnimation;
- (void)updatePlayerState:(NSInteger)state;
- (void)updateDuration:(NSTimeInterval)duration;
- (void)updatePosition:(NSTimeInterval)position;


@end
