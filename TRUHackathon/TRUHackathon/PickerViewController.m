//
//  PickerViewController.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property UITableView *tableView;

@end

@implementation PickerViewController {
    NSMutableArray *selectionOptions;
    UIRefreshControl *refreshControl;
    LoadingImageView *loadingImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    selectionOptions = [NSMutableArray new];
    
    [self loadOptions];
    
    if (self.pickerOption==PickerOptionCategory) {
        self.title = @"Select Category";
    } else if (self.pickerOption==PickerOptionService) {
        self.title = @"Select Service";
    } else if (self.pickerOption==PickerOptionEmployee) {
        self.title = @"Select Employee";
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestFailed)
                                                 name:kRequestFailNotification
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)requestFailed {
    [loadingImageView hide];
    [self.view makeToast:@"No internet connection"];
    [refreshControl endRefreshing];
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    self.tableView = [[UITableView alloc] initWithFrame:screen.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(loadOptions) forControlEvents:UIControlEventValueChanged];

    loadingImageView = [LoadingImageView new];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.96 alpha:1.0]];
    [self.view addSubview:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [loadingImageView hide];
}

- (void)loadOptions {
    if (self.pickerOption==PickerOptionCategory) {
        selectionOptions = [@[@"Colouring services", @"Face treatments", @"Hair Cutting", @"Nail Treatments"] mutableCopy];
        
        [self.tableView reloadData];
    } else if (self.pickerOption==PickerOptionService) {
        [loadingImageView show];

        [[APIManager sharedInstance] getServicesForCategory:self.category withCompletionBlock:^(NSArray *response) {
            [refreshControl endRefreshing];
            [loadingImageView hide];
            
            selectionOptions = [response mutableCopy];
            
            [self.tableView reloadData];
        }];
    } else if (self.pickerOption==PickerOptionEmployee) {
        [loadingImageView show];

        [[APIManager sharedInstance] getEmployeesForService:@"" withCompletionBlock:^(NSArray *response) {
            [refreshControl endRefreshing];
            [loadingImageView hide];

            selectionOptions = [response mutableCopy];
            
            [self.tableView reloadData];
        }];        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return selectionOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    cell.textLabel.text = selectionOptions[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate pickedOptionWithName:selectionOptions[indexPath.row]];
    
    [self.navigationController popViewControllerAnimated:YES];
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
