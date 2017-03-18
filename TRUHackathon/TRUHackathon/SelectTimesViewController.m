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
    
    LoadingImageView *loadingImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    days = [NSMutableArray new];
    times = [NSMutableArray new];
    
    [self.tableView registerClass:[BookTimeTableViewCell class] forCellReuseIdentifier:@"BookTimeTableViewCell"];
    
    self.title = @"Available times";
    
    [self loadTimes];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestFailed)
                                                 name:kRequestFailNotification
                                               object:nil];
}

- (void)requestFailed {
    [loadingImageView hide];
    [self.view makeToast:@"No internet connection"];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    self.tableView = [[UITableView alloc] initWithFrame:screen.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];

    loadingImageView = [LoadingImageView new];

    [self.view setBackgroundColor:[UIColor colorWithWhite:0.96 alpha:1.0]];
    [self.view addSubview:self.tableView];
    
    [self addCancelButton];
}

- (void)addCancelButton {
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelTapped) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, 0, 60, 44)];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    
    self.navigationItem.leftBarButtonItem = barButton;
}

- (void)cancelTapped {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)loadTimes {
    [loadingImageView show];

    [[APIManager sharedInstance] getDaysAndTimesForCategory:self.category service:self.service employee:self.employee withCompletionBlock:^(NSArray *response) {
        [loadingImageView hide];

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
    return 56;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    [header setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.78]];
    
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, header.frame.size.width, header.frame.size.height)];
    dayLabel.textColor = [UIColor colorWithWhite:0.33 alpha:1.0];
    dayLabel.text = days[section];
    
    [header addSubview:dayLabel];
    
    return header;
}

- (void)bookedDay:(NSString *)day andTime:(NSString *)time {
    [loadingImageView show];
    
    [[APIManager sharedInstance] bookWithDay:day andTime:time withCompletionBlock:^(NSArray *response) {
        [loadingImageView hide];

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
