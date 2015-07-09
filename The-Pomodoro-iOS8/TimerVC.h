//
//  TimerViewController.h
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerVC : UIViewController

@property (nonatomic, strong) UILabel *timeLeft;
@property (nonatomic, strong) UIButton *startButton;

-(void)startButtonTapped;

@end
