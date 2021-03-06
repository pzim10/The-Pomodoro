//
//  RoundsViewController.m
//  The-Pomodoro-iOS8
//
//  Created by Taylor Mott on 18.2.2015.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsViewController.h"
#import "Rounds.h"
#import "Timer.h"

static NSString *reuseID = @"reuseID";

@interface RoundsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RoundsViewController

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self registerForNotifications];
    }
    
    return self;
}

//Set the tableView delegate and datasource to self.
//register the class
//add tableview as the subview of the viewControllers view
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.title = @"Rounds";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Unregister for notifications
- (void)dealloc
{
    [self unregisterForNotifications];
}

#pragma mark - TableView Delegate Methods

//Set the currentRound for the index selected
//call the roundSelected method which sets the minutes and seconds accordingly
//Cancel the timer
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Rounds sharedInstance].currentRound = indexPath.row;
    [[Rounds sharedInstance] roundSelected];
    [[Timer sharedInstance] cancelTimer];
}

#pragma mark - TableView DataSource Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    NSArray *roundsArray = [Rounds sharedInstance].roundTimes;
    NSNumber *minutes = roundsArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li minutes", (long)[minutes integerValue]];
    NSString *imageName;
    if (indexPath.row == 0 || indexPath.row == 2 ||
        indexPath.row == 4 || indexPath.row == 6) {
        imageName = @"work.jpg";
    } else if (indexPath.row ==7) {
        imageName = @"nap.jpg";
    }
    else {
        imageName = @"play.jpg";
    }
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", imageName]]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", imageName]]];

    imageView.frame = CGRectMake(5, 5, 25, 25);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    imageView2.frame = CGRectMake(cell.frame.size.width +25, 5, 25, 25);
    imageView2.contentMode = UIViewContentModeScaleAspectFit;

    [cell addSubview:imageView];
    [cell addSubview:imageView2];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Rounds sharedInstance].roundTimes.count;
}

#pragma mark - Notification Methods

//Use the notficationCenter to register for the notification
- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(roundComplete) name:TimerCompleteNotification object:nil];
}

//Compare the current round to the roundTimes.count to see if there are still times left to be ran.
//If there are still times left add one to current round and then update the time.
//Otherwise set currentRound to 0
- (void)roundComplete
{
    if ([Rounds sharedInstance].currentRound < [Rounds sharedInstance].roundTimes.count - 1)
    {
        [Rounds sharedInstance].currentRound++;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[Rounds sharedInstance].currentRound inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[Rounds sharedInstance] roundSelected];
    }
    else
    {
        [Rounds sharedInstance].currentRound = 0;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[Rounds sharedInstance].currentRound inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[Rounds sharedInstance] roundSelected];
    }
}


//Unregister the notifications
- (void)unregisterForNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
