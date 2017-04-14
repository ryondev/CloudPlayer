//
//  PlayerModel.h
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/14.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoInfoModel : NSObject

@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *title;

- (instancetype)initWithURL:(NSString *)url
                      title:(NSString *)title;

@end
