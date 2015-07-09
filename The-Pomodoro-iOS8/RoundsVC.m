//
//  RoundsViewController.m
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsVC.h"
#import "Timer.h"

@interface RoundsVC ()

@end

@implementation RoundsVC

+ (RoundsVC *)sharedInstance {
    static RoundsVC *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RoundsVC new];
        
        
    });
    return sharedInstance;
}

- (void)roundSelected{
    [Timer sharedInstance].minutes = [[self roundTimes][self.currentRound] integerValue];
    [Timer sharedInstance].seconds = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)roundTimes{
    return @[ @25, @5, @25, @5, @25, @5, @25, @15 ];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
