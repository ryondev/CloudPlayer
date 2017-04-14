//
//  PlayerModel.h
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/14.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PlayerControlDelegate.h"

@interface PlayerModel : NSObject <PlayerControlDelegate>

@property(nonatomic, weak) id<PlayerActionDelegate> actionDelegate;

- (instancetype)initWithURL:(NSString *)url
                      title:(NSString *)title
                 uploadName:(NSString *)name;

- (void)layout:(UIView *)parent;
- (void)start;

@end
