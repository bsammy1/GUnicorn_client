//
//  OrderDetailsViewController.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "OrderDetailsViewController.h"
#import "SelectTimesViewController.h"

@interface OrderDetailsViewController ()

@end

@implementation OrderDetailsViewController {
    NSString *category;
    NSString *service;
    NSString *employee;
    PickerOption currentPickerOption;
    
    UIButton *pickCategoryButton;
    UIButton *pickServiceButton;
    UIButton *pickEmployeeButton;
    UIButton *nextStepButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    currentPickerOption = PickerOptionCategory;
    
    self.title = @"Order Details";
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    pickCategoryButton = [BasicElements defaultButton];
    pickCategoryButton.frame = CGRectMake(0, 116, screen.bounds.size.width, 44);
    [pickCategoryButton addTarget:self action:@selector(pickCategoryTapped) forControlEvents:UIControlEventTouchUpInside];
    [pickCategoryButton setTitle:@"Category" forState:UIControlStateNormal];
    
    pickServiceButton = [BasicElements defaultButton];
    pickServiceButton.frame = CGRectMake(0, 176, screen.bounds.size.width, 44);
    [pickServiceButton addTarget:self action:@selector(pickServiceTapped) forControlEvents:UIControlEventTouchUpInside];
    [pickServiceButton setTitle:@"Service" forState:UIControlStateNormal];

    pickEmployeeButton = [BasicElements defaultButton];
    pickEmployeeButton.frame = CGRectMake(0, 252, screen.bounds.size.width, 44);
    [pickEmployeeButton addTarget:self action:@selector(pickEmployeeTapped) forControlEvents:UIControlEventTouchUpInside];
    [pickEmployeeButton setTitle:@"Employee" forState:UIControlStateNormal];
    
    nextStepButton = [BasicElements defaultButton];
    nextStepButton.frame = CGRectMake(0, screen.bounds.size.height-44, screen.bounds.size.width, 44);
    [nextStepButton addTarget:self action:@selector(nextStepTapped) forControlEvents:UIControlEventTouchUpInside];
    [nextStepButton setTitle:@"NextStep" forState:UIControlStateNormal];

    [self.view addSubview:pickCategoryButton];
    [self.view addSubview:pickServiceButton];
    [self.view addSubview:pickEmployeeButton];
    [self.view addSubview:nextStepButton];
}

- (void)pickCategoryTapped {
    PickerViewController *vc = [PickerViewController new];
    vc.delegate = self;
    vc.pickerOption = PickerOptionCategory;
    currentPickerOption = PickerOptionCategory;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pickServiceTapped {
    if (category==nil) {
        
        return;
    }
    
    PickerViewController *vc = [PickerViewController new];
    vc.delegate = self;
    vc.category = category;
    vc.pickerOption = PickerOptionService;
    currentPickerOption = PickerOptionService;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pickEmployeeTapped {
    if (service==nil) {
        
        return;
    }
    
    PickerViewController *vc = [PickerViewController new];
    vc.delegate = self;
    vc.service = service;
    vc.pickerOption = PickerOptionEmployee;
    currentPickerOption = PickerOptionEmployee;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)nextStepTapped {
    SelectTimesViewController *vc = [SelectTimesViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pickedOptionWithName:(NSString *)option {
    if (currentPickerOption==PickerOptionCategory) {
        category = option;
        
        [pickCategoryButton setTitle:option forState:UIControlStateNormal];
        
        service = nil;
        employee = nil;
    } else if (currentPickerOption==PickerOptionService) {
        service = option;
        
        [pickServiceButton setTitle:option forState:UIControlStateNormal];
        
        employee = nil;
    } else if (currentPickerOption==PickerOptionEmployee) {
        employee = option;
        
        [pickEmployeeButton setTitle:option forState:UIControlStateNormal];
    }
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
