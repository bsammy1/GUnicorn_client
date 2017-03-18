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
    
    int currentY = 0;
    int buttonHeight = 72;
    
    int iconSize = 72;
    
    pickCategoryButton = [UIButton new];
    pickCategoryButton.frame = CGRectMake(0, currentY, screen.bounds.size.width, buttonHeight);
    [pickCategoryButton addTarget:self action:@selector(pickCategoryTapped) forControlEvents:UIControlEventTouchUpInside];
    [pickCategoryButton setTitle:@"Category" forState:UIControlStateNormal];
    [pickCategoryButton setTitleColor:[UIColor colorWithWhite:0.30 alpha:1.0] forState:UIControlStateNormal];
    [pickCategoryButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 72.0, 0.0, 0.0)];
    pickCategoryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *categoryIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, currentY, iconSize, iconSize)];
    [categoryIcon setImage:[UIImage imageNamed:@"categoryIcon"]];
    categoryIcon.contentMode = UIViewContentModeCenter;
    
    currentY = currentY + buttonHeight + 1;
    
    pickServiceButton = [UIButton new];
    pickServiceButton.frame = CGRectMake(0, currentY, screen.bounds.size.width, buttonHeight);
    [pickServiceButton addTarget:self action:@selector(pickServiceTapped) forControlEvents:UIControlEventTouchUpInside];
    [pickServiceButton setTitle:@"Service" forState:UIControlStateNormal];
    [pickServiceButton setTitleColor:[UIColor colorWithWhite:0.30 alpha:1.0] forState:UIControlStateNormal];
    [pickServiceButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 72.0, 0.0, 0.0)];
    [pickServiceButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
    pickServiceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *serviceIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, currentY, iconSize, iconSize)];
    [serviceIcon setImage:[UIImage imageNamed:@"serviceIcon"]];
    serviceIcon.contentMode = UIViewContentModeCenter;
    
    currentY = currentY + buttonHeight + 1;

    pickEmployeeButton = [UIButton new];
    pickEmployeeButton.frame = CGRectMake(0, currentY, screen.bounds.size.width, buttonHeight);
    [pickEmployeeButton addTarget:self action:@selector(pickEmployeeTapped) forControlEvents:UIControlEventTouchUpInside];
    [pickEmployeeButton setTitle:@"Employee" forState:UIControlStateNormal];
    [pickEmployeeButton setTitleColor:[UIColor colorWithWhite:0.30 alpha:1.0] forState:UIControlStateNormal];
    [pickEmployeeButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 72.0, 0.0, 0.0)];
    [pickEmployeeButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
    pickEmployeeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *employeeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, currentY, iconSize, iconSize)];
    [employeeIcon setImage:[UIImage imageNamed:@"ic_people"]];
    employeeIcon.contentMode = UIViewContentModeCenter;
    

    nextStepButton = [UIButton new];
    nextStepButton.frame = CGRectMake(0, screen.bounds.size.height-buttonHeight-64, screen.bounds.size.width, buttonHeight);
    [nextStepButton addTarget:self action:@selector(nextStepTapped) forControlEvents:UIControlEventTouchUpInside];
    [nextStepButton setTitle:@"Book" forState:UIControlStateNormal];
    [nextStepButton setTitleColor:[UIColor colorWithWhite:0.30 alpha:1.0] forState:UIControlStateNormal];
    [nextStepButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 72.0, 0.0, 0.0)];
    nextStepButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *bookIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, screen.bounds.size.height-buttonHeight-64, iconSize, iconSize)];
    [bookIcon setImage:[UIImage imageNamed:@"bookIcon"]];
    bookIcon.contentMode = UIViewContentModeCenter;
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1.0]];
    [self.view addSubview:pickCategoryButton];
    [self.view addSubview:pickServiceButton];
    [self.view addSubview:pickEmployeeButton];
    [self.view addSubview:nextStepButton];
    
    [self.view addSubview:categoryIcon];
    [self.view addSubview:serviceIcon];
    [self.view addSubview:employeeIcon];
    [self.view addSubview:bookIcon];
    
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

- (void)pickCategoryTapped {
    PickerViewController *vc = [PickerViewController new];
    vc.delegate = self;
    vc.pickerOption = PickerOptionCategory;
    currentPickerOption = PickerOptionCategory;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pickServiceTapped {
    if (category==nil) {
        [self.view makeToast:@"Choose category first"];

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
        [self.view makeToast:@"Choose service first"];

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
    if (employee==nil) {
        [self.view makeToast:@"Choose service and employee"];
        
        return;
    }
    
    SelectTimesViewController *vc = [SelectTimesViewController new];
    vc.category = category;
    vc.service = service;
    vc.employee = employee;
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
