//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *SecondTickNotification = @"Second Tick";
static NSString *TimerCompleteNotification = @"Timer Complete";
static NSString *NewRoundNotification = @"New Round";

@interface Timer : NSObject

+(Timer *) sharedInstance;
@property(nonatomic, assign) NSInteger minutes;
@property(nonatomic, assign) NSInteger seconds;

-(void)startTimer;
-(void)cancelTimer;
-(NSString *) updateTime;

@end
