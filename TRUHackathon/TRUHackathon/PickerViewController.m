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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    selectionOptions = [NSMutableArray new];
    
    [self loadOptions];
}


- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    self.tableView = [[UITableView alloc] initWithFrame:screen.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (void)loadOptions {
    if (self.pickerOption==PickerOptionCategory) {
        selectionOptions = [@[@"option1", @"option2", @"option3"] mutableCopy];
        
        [self.tableView reloadData];
    } else if (self.pickerOption==PickerOptionService) {
        [[APIManager sharedInstance] getServicesForCategory:self.category withCompletionBlock:^(NSArray *response) {
            selectionOptions = [response mutableCopy];
            
            [self.tableView reloadData];
        }];
    } else if (self.pickerOption==PickerOptionEmployee) {
        [[APIManager sharedInstance] getEmployeesForService:@"" withCompletionBlock:^(NSArray *response) {
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
