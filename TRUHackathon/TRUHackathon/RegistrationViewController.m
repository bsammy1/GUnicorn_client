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
    UITextField *nameTextField;
    UITextField *surnameTextField;
    UITextField *phoneTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Info";
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    int textFieldHeight = 40;
    int currentY = 140;
    
    emailTextField = [BasicElements defaultTextField];
    emailTextField.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, textFieldHeight);
    emailTextField.placeholder = @"Email";
    
    currentY = currentY + textFieldHeight + 16;
    
    passwordTextField = [BasicElements defaultTextField];
    passwordTextField.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, textFieldHeight);
    passwordTextField.placeholder = @"Password";

    currentY = currentY + textFieldHeight + 16;

    nameTextField = [BasicElements defaultTextField];
    nameTextField.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, textFieldHeight);
    nameTextField.placeholder = @"Name";

    currentY = currentY + textFieldHeight + 16;

    surnameTextField = [BasicElements defaultTextField];
    surnameTextField.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, textFieldHeight);
    surnameTextField.placeholder = @"Surname";

    currentY = currentY + textFieldHeight + 16;

    phoneTextField = [BasicElements defaultTextField];
    phoneTextField.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, textFieldHeight);
    phoneTextField.placeholder = @"Phone";
    
    int registerButtonWidth = 100;
    int registerButtonHeight = 30;
    UIButton *registerButton = [BasicElements defaultButton];
    registerButton.frame = CGRectMake(screen.bounds.size.width/2-registerButtonWidth/2, screen.bounds.size.height-registerButtonHeight-16, registerButtonWidth, registerButtonHeight);
    [registerButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:emailTextField];
    [self.view addSubview:passwordTextField];
    [self.view addSubview:nameTextField];
    [self.view addSubview:surnameTextField];
    [self.view addSubview:phoneTextField];
    [self.view addSubview:registerButton];
}


- (void)registerTapped {
    [[APIManager sharedInstance] authorizationWithEmail:emailTextField.text password:passwordTextField.text name:@"1" surname:@"2" phone:@"3" completionBlock:^(NSArray *response) {
        
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
