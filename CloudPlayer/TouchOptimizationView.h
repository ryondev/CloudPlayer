//
//  TouchOptimizationView.h
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/13.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerProgressView.h"

@interface TouchOptimizationView : UIView

@property(nonatomic, strong) PlayerProgressView *progressView;

@property(nonatomic, assign) BOOL optimizationFlag;

@end
