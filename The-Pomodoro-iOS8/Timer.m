//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"
@interface Timer ()

@property (nonatomic, assign) BOOL isOn;

@end
@implementation Timer

+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
    });
    return sharedInstance;
}
-(void)startTimer{
    self.isOn = YES;
    // [self checkActive];
}
-(void)endTimer{
    self.isOn = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotification object:nil];
}
-(void)decreaseSecond{
    self.seconds--;
    [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
    if (self.seconds < 0 && self.minutes > 0) {
        self.seconds = 59;
        self.minutes--;
    }
    else if (self.seconds == 0 && self.minutes == 0){
        [self endTimer];
    }
}

-(void)checkActive{
    if (self.isOn == YES) {
        [self decreaseSecond];
    }
}

-(void)cancelTimer{
    self.isOn = NO;
}

-(NSString *)updateTime{
//    return (@"%lu : %@", self.minutes, self.seconds);
}
@end
