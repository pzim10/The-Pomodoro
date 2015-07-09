//
//  RoundsViewController.h
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundsVC : UIViewController

@property (strong, nonatomic, readonly) NSArray *roundTimes;
@property (assign, nonatomic) NSInteger currentRound;
+(RoundsVC *)sharedInstance;

-(void) roundSelected;

@end
