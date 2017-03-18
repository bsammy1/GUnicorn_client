//
//  YourBookingsViewController.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "YourBookingsViewController.h"
#import "Booking.h"
#import "BookingTableViewCell.h"
#import "PlacesViewController.h"

@interface YourBookingsViewController ()

@property UITableView *tableView;

@end

@implementation YourBookingsViewController {
    RLMResults *bookings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    bookings = [Booking allObjects];
    
    [self.tableView registerClass:[BookingTableViewCell class] forCellReuseIdentifier:@"BookingTableViewCell"];

    [self.tableView reloadData];
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen.bounds.size.width, screen.bounds.size.height-64-56)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIButton *newBookButton = [[UIButton alloc] initWithFrame:CGRectMake(0, screen.bounds.size.height-56, screen.bounds.size.width, 56)];
    [newBookButton addTarget:self action:@selector(newBookTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.96 alpha:1.0]];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return bookings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookingTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BookingTableViewCell"];
    
    [cell fillCellWithObject:bookings[indexPath.row]];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (void)newBookTapped {
    PlacesViewController *vc = [PlacesViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];

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
