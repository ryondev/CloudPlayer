//
//  PlayerModel.m
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/14.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import "VideoInfoModel.h"

@implementation VideoInfoModel

- (instancetype)initWithURL:(NSString *)url title:(NSString *)title {
    if (self = [super init]) {
        _url = url;
        _title = title;
        
    }
    return self;
}

@end
