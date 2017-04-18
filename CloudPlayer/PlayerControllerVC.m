//
//  PlayerControllerViewController.m
//  CloudPlayer
//
//  Created by He,Rui on 2017/4/13.
//  Copyright © 2017年 RyonLab. All rights reserved.
//

#import <BDCloudMediaPlayer/BDCloudMediaPlayer.h>

#import "PlayerControllerVC.h"
#import "PlayerProgressView.h"
#import "TouchOptimizationView.h"

@interface PlayerControllerVC ()

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *fullScreen;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *playbackLabel;
@property (weak, nonatomic) IBOutlet PlayerProgressView *playerProgressView;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

@property (assign, nonatomic) BOOL blockPositionUpdate;

@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSTimer *timer;

@property (assign, nonatomic) NSTimeInterval playableDuration;
@property (assign, nonatomic) NSTimeInterval currentPlaybackTime;

@end

@implementation PlayerControllerVC

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self optimizationView].progressView = self.playerProgressView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Optimization Declear

- (TouchOptimizationView *)optimizationView {
    return (TouchOptimizationView *)self.view;
}

- (void)enableOptimization:(BOOL)enable {
    [self optimizationView].optimizationFlag = enable;
}

- (void)startTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                      target:self
                                                    selector:@selector(onTimer:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)stopTimer {
    if (self.timer.isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)onTimer:(NSTimer *)timer {
    NSTimeInterval interval = fabs([self.startTime timeIntervalSinceNow]);
    if (interval > 3 && !self.topView.hidden) {
        [self autoHide];
    }
    
    [self.controlDelegate realtimeVariable:&_playableDuration position:&_currentPlaybackTime];
    self.playerProgressView.cacheValue = self.playableDuration;
    [self updatePosition:self.currentPlaybackTime];
}

- (void)updateIdleTime {
    self.startTime = [NSDate date];
}

- (void)autoHide {
    self.topView.hidden = YES;
    self.bottomView.hidden = YES;
}

#pragma mark - Play Actions

- (void)play {
    
}

- (void)updateTitle:(NSString *)title {
    self.titleLabel.text = title;
    self.startTime = [NSDate date];
}

- (void)startLoadingAnimation {
    self.loadingView.hidden = NO;
    [self.loadingView startAnimating];
}

- (void)stopLoadingAnimation {
    self.loadingView.hidden = YES;
    [self.loadingView stopAnimating];
}

- (void)updatePlayerState:(NSInteger)state {
    
    self.playButton.enabled = NO;
    self.playerProgressView.userInteractionEnabled = NO;//不再响应事件
    
    switch (state) {
        case BDCloudMediaPlayerPlaybackStateStopped:
        case BDCloudMediaPlayerPlaybackStateInterrupted:
            self.playButton.enabled = YES;
            //todo: setting playbutton UI to Play
            break;
        
        case BDCloudMediaPlayerPlaybackStatePlaying:
            //todo: setting playbutton UI to pause
            self.playButton.enabled = YES;
            self.playerProgressView.userInteractionEnabled = YES;
            break;
        case BDCloudMediaPlayerPlaybackStatePaused:
            //todo: setting playbutton UI to Play
            self.playButton.enabled = YES;
            self.playerProgressView.userInteractionEnabled = YES;
            break;
        default:
            break;
    }
    
}

- (void)updateDuration:(NSTimeInterval)duration {
    self.playerProgressView.userInteractionEnabled = fabs(duration) > 10e-6;
    self.playerProgressView.maximumValue = duration;
    self.playerProgressView.minimumValue = 0;
    self.playerProgressView.value = 0;
    self.playerProgressView.cacheValue = 0;
    
    [self startTimer];
    
}

- (void)updatePosition:(NSTimeInterval)position {
    
    if (self.blockPositionUpdate) {
        return;
    }
    
    self.playerProgressView.value = position;
    [self.playerProgressView updatePlayableUI];
    
}

#pragma mar - UI actions

- (IBAction)onBack:(id)sender {
    NSLog(@"onBack clicked in PlayerController VC");
    [self stopTimer];
    [self.controlDelegate destroy];
}

- (IBAction)onShare:(id)sender {
    NSLog(@"onShare clicked in PlayerController VC");
}

- (IBAction)onPlay:(id)sender {
    NSLog(@"onPlay clicked in PlayerController VC");
    [self updateIdleTime];
    [self.controlDelegate play];
}

- (IBAction)onFullScreen:(id)sender {
    NSLog(@"onFullScreen clicked in PlayerController VC");
    
}

- (IBAction)onSliderSeek:(id)sender {
    NSLog(@"onSliderSeek in PlayerController VC");
    [self updateIdleTime];
    [self.controlDelegate seek:self.playerProgressView.value];
    [self performSelector:@selector(enableUpdatePosition) withObject:nil afterDelay:2];
}

- (IBAction)onSliderDown:(id)sender {
    NSLog(@"onSliderDown in PlayerController VC");
    [self updateIdleTime];
    self.blockPositionUpdate = NO;
}

- (void)enableUpdatePosition {
    self.blockPositionUpdate = NO;
}

- (IBAction)onTapBlank:(id)sender {
    CGPoint point = [self.tapGesture locationInView:self.view];
    CGRect topFrame = self.topView.frame;
    CGRect bottomFrame = self.bottomView.frame;
    
    if (CGRectContainsPoint(topFrame, point) || CGRectContainsPoint(bottomFrame, point)) {
        [self updateIdleTime];
        return;
    }
    
    BOOL hidden = !self.topView.hidden;
    self.topView.hidden = hidden;
    self.bottomView.hidden = hidden;
    self.playerProgressView.hidden = hidden;
    [self enableOptimization:YES];
    
    
}

@end
