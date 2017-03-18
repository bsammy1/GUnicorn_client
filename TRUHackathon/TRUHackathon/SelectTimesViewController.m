//
//  SelectTimesViewController.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "SelectTimesViewController.h"
#import "RegistrationViewController.h"

@interface SelectTimesViewController ()

@property UITableView *tableView;

@end

@implementation SelectTimesViewController {
    NSMutableArray *days;
    NSMutableArray *times;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    days = [NSMutableArray new];
    times = [NSMutableArray new];
    
    [self.tableView registerClass:[BookTimeTableViewCell class] forCellReuseIdentifier:@"BookTimeTableViewCell"];
    
    self.title = @"Available times";
    
    [self loadTimes];
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    self.tableView = [[UITableView alloc] initWithFrame:screen.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (void)loadTimes {
    [[APIManager sharedInstance] getDaysAndTimesForCategory:@"" service:@"" employee:@"" withCompletionBlock:^(NSArray *response) {
        days = response[0];
        times = response[1];
        
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [times[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return days.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookTimeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BookTimeTableViewCell"];

    cell.delegate = self;
    
    cell.timeLabel.text = times[indexPath.section][indexPath.row];
    cell.day = days[indexPath.section];
    cell.time = times[indexPath.section][indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:header.frame];
    dayLabel.text = days[section];
    
    [header addSubview:dayLabel];
    
    return header;
}

- (void)bookedDay:(NSString *)day andTime:(NSString *)time {
    [[APIManager sharedInstance] bookWithDay:day andTime:time withCompletionBlock:^(NSArray *response) {
        RegistrationViewController *vc = [RegistrationViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
