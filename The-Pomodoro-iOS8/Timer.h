//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString const *SecondTickNotification = @"Second Tick";
static NSString const *TimerCompleteNotification = @"Timer Complete";
static NSString const *NewRoundNotification = @"New Round";

@interface Timer : NSObject

+(Timer *) sharedInstance;
@property(nonatomic, assign) NSInteger *minutes;
@property(nonatomic, assign) NSInteger *seconds;

@end
