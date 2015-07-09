//
//  RoundsViewController.h
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Rounds : NSObject

@property (strong, nonatomic, readonly) NSArray *roundTimes;
@property (assign, nonatomic) NSInteger currentRound;
+(Rounds *)sharedInstance;

-(void) roundSelected;

@end
