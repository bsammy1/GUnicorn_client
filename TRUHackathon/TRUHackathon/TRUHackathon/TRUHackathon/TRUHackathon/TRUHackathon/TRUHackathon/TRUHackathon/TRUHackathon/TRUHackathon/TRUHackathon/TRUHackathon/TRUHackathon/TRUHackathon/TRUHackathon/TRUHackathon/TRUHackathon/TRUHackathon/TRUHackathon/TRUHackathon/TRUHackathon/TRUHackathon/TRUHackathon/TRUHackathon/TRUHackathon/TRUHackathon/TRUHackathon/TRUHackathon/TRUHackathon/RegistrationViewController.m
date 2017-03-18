//
//  RegistrationViewController.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "RegistrationViewController.h"
#import "PlacesViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController {
    UITextField *emailTextField;
    UITextField *passwordTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    emailTextField = [BasicElements defaultTextField];
    emailTextField.frame = CGRectMake(16, 140, screen.bounds.size.width-32, 40);
    emailTextField.placeholder = @"Email";
    
    passwordTextField = [BasicElements defaultTextField];
    passwordTextField.frame = CGRectMake(16, 196, screen.bounds.size.width-32, 40);
    passwordTextField.placeholder = @"Password";
    
    int registerButtonWidth = 100;
    int registerButtonHeight = 30;
    UIButton *registerButton = [BasicElements defaultButton];
    registerButton.frame = CGRectMake(screen.bounds.size.width/2-registerButtonWidth/2, screen.bounds.size.height-registerButtonHeight-16, registerButtonWidth, registerButtonHeight);
    [registerButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:emailTextField];
    [self.view addSubview:passwordTextField];
    [self.view addSubview:registerButton];
}


- (void)registerTapped {
    [[APIManager sharedInstance] authorizationWithEmail:emailTextField.text password:passwordTextField.text completionBlock:^(NSArray *response) {
        NSLog(@"AUTHORIZED!!!");
        
        PlacesViewController *vc = [[PlacesViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
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
