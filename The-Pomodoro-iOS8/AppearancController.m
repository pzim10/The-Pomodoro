//
//  AppearancController.m
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppearancController.h"
#import "TimerVC.h"

@interface AppearancController ()

@end

@implementation AppearancController


+(void)initializeNewAppearance{
    [[UIView appearanceWhenContainedIn:[TimerVC class], nil] setBackgroundColor:[UIColor darkGrayColor]];
    [[UINavigationBar appearance] setBarTintColor: [UIColor blueColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor greenColor]} forState:UIControlStateNormal];
    [[UIButton appearance] setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [[UITableView appearance] setBackgroundColor:[UIColor lightGrayColor]];
    [[UITableViewCell appearance] setBackgroundColor:[UIColor redColor]];
//    [[UITableViewCell appearance] setTextColor:[UIColor greenColor]];
    [[UILabel appearance] setTextColor:[UIColor cyanColor]];
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
