//
//  TimerViewController.m
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TimerVC.h"

@interface TimerVC ()

@end

@implementation TimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.timeLeft = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/ 2 - 50,
                                                              self.view.frame.size.height/ 2 - 25, 100, 50)];
    self.startButton= [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2- 50,
                                                                  self.view.frame.size.height - 150, 100, 50)];

    
    self.timeLeft.text = @"25:00";
    self.startButton.titleLabel.text = @"Start Timer";
    self.startButton.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.timeLeft];
    [self.view addSubview:self.startButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabel{
    self.timeLeft.text = [Timer sharedInstance].updateTime;
}
-(void)observeNotification: (NSNotificationCenter *)notification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel) name:SecondTickNotification object:nil];
}

//-(id)targetForAction:(SEL)action withSender:(id)sender{
//    
//}
-(void)startButtonTapped{
    [[Timer sharedInstance] startTimer];
    
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
