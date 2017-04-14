//
//  PlayerViewController.m
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/13.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import "PlayerVC.h"
#import "PlayerControllerVC.h"

@interface PlayerVC ()

@property (nonatomic, strong) PlayerControllerVC *playerController;

@end

@implementation PlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc {
    
}

- (void)addChildViewController:(UIViewController *)childController {
    [super addChildViewController:childController];
    self.playerController = (PlayerControllerViewController *)childController;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
