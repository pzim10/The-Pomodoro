//
//  TimerViewController.m
//  The-Pomodoro-iOS8
//
//  Created by Peter Zimmerman on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TimerVC.h"

@interface TimerVC ()

@property (nonatomic, strong) UILabel *timeLeft;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation TimerVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self registerForNotifications];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.timeLeft = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/ 2 - 50,
                                                              self.view.frame.size.height/ 2 - 25, 100, 50)];
    self.startButton= [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2- 50,
                                                                  self.view.frame.size.height - 150, 100, 50)];

    [self.startButton setTitle:@"Start Timer" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.timeLeft setText:@"Initial Text"];
    [self.view addSubview:self.timeLeft];
    [self.view addSubview:self.startButton];
    [self.startButton addTarget:self action:@selector(startButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabel{
    self.timeLeft.text = [Timer sharedInstance].updateTime;
}

-(void)newRound{
    self.timeLeft.enabled = YES;
    [self updateLabel];
}

-(void)registerForNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel) name:SecondTickNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel) name:NewRoundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel) name:TimerCompleteNotification object:nil];
}

-(void)unregisterForNotifications{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//-(id)targetForAction:(SEL)action withSender:(id)sender{
//    
//}
-(void)startButtonTapped{
    self.timeLeft.enabled = NO;
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
