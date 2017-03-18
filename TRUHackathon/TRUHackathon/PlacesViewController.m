//
//  PlacesViewController.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "PlacesViewController.h"
#import "PlaceTableViewCell.h"
#import "OrderDetailsViewController.h"

@interface PlacesViewController ()

@property UITableView *tableView;

@end

@implementation PlacesViewController {
    NSMutableArray *places;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    places = [NSMutableArray new];
    
    [self.tableView registerClass:[PlaceTableViewCell class] forCellReuseIdentifier:@"PlaceTableViewCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadPlaces)
                                                 name:kSocketConnectedNotification
                                               object:nil];
    
    self.title = @"Places";
}

- (void)loadPlaces {
    [[APIManager sharedInstance] getPlacesWithCompletionBlock:^(NSArray *response) {
        places = [response mutableCopy];
        
        [self.tableView reloadData];
    }];
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    self.tableView = [[UITableView alloc] initWithFrame:screen.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlaceTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PlaceTableViewCell"];
    
    [cell fillCellWithObject:places[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 166;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderDetailsViewController *vc = [OrderDetailsViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
