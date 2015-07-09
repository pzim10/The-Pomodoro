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
    [self checkActive];
}

-(void)endTimer{
    self.isOn = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotification object:nil];
}

-(void)decreaseSecond{
    if (self.seconds > 0) {
        self.seconds--;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
    }
    else if (self.seconds == 0 && self.minutes > 0) {
        self.seconds = 59;
        self.minutes--;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
    }
    else{
        [self endTimer];
    }
}

-(void)checkActive{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    if (self.isOn == YES) {
        [self decreaseSecond];
        [self performSelector:@selector(checkActive) withObject:nil afterDelay:1.0];
    }
}

-(void)cancelTimer{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    self.isOn = NO;
}

-(NSString *)updateTime{
    NSString *timerString;
    
    if (self.minutes >= 10)
    {
        timerString = [NSString stringWithFormat:@"%li:", (long)self.minutes];
    }
    else
    {
        timerString = [NSString stringWithFormat:@"0%li:", (long)self.minutes];
    }
    
    if (self.seconds >= 10)
    {
        timerString = [timerString stringByAppendingString:[NSString stringWithFormat:@"%li", (long)self.seconds]];
    }
    else
    {
        timerString = [timerString stringByAppendingString:[NSString stringWithFormat:@"0%li", (long)self.seconds]];
    }
    
    return timerString;
}
@end
