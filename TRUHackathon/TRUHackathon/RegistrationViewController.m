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
    
    LoadingImageView *loadingImageView;
    
    int currentY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Info";
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestFailed)
                                                 name:kRequestFailNotification
                                               object:nil];
    
    UIScreen *screen = [UIScreen mainScreen];
    int textFieldHeight = 56;

    [UIView animateWithDuration:2.0 animations:^{
        currentY = 0;

        emailTextField.frame = CGRectMake(0, currentY, screen.bounds.size.width, textFieldHeight);
        emailTextField.alpha = 1.0;
        
        currentY = currentY + textFieldHeight + 1;
        
        passwordTextField.frame = CGRectMake(0, currentY, screen.bounds.size.width, textFieldHeight);
        passwordTextField.alpha = 1.0;
        
        currentY = currentY + textFieldHeight + 1;

        nameTextField.frame = CGRectMake(0, currentY, screen.bounds.size.width, textFieldHeight);
        nameTextField.alpha = 1.0;
        
        currentY = currentY + textFieldHeight + 1;

        surnameTextField.frame = CGRectMake(0, currentY, screen.bounds.size.width, textFieldHeight);
        surnameTextField.alpha = 1.0;
        
        currentY = currentY + textFieldHeight + 1;

        phoneTextField.frame = CGRectMake(0, currentY, screen.bounds.size.width, textFieldHeight);
        phoneTextField.alpha = 1.0;
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)requestFailed {
    [loadingImageView hide];
    [self.view makeToast:@"No internet connection"];
}

- (void)loadView {
    [super loadView];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    int textFieldHeight = 56;
    currentY = 0;
    
    emailTextField = [BasicElements defaultTextField];
    emailTextField.frame = CGRectMake(-screen.bounds.size.width, currentY, screen.bounds.size.width, textFieldHeight);
    emailTextField.placeholder = @"Email";
    emailTextField.alpha = 0;
    
    currentY = currentY + textFieldHeight + 1;
    
    passwordTextField = [BasicElements defaultTextField];
    passwordTextField.frame = CGRectMake(-screen.bounds.size.width, currentY, screen.bounds.size.width, textFieldHeight);
    passwordTextField.placeholder = @"Password";
    passwordTextField.alpha = 0;

    currentY = currentY + textFieldHeight + 1;

    nameTextField = [BasicElements defaultTextField];
    nameTextField.frame = CGRectMake(-screen.bounds.size.width, currentY, screen.bounds.size.width, textFieldHeight);
    nameTextField.placeholder = @"Name";
    nameTextField.alpha = 0;

    currentY = currentY + textFieldHeight + 1;

    surnameTextField = [BasicElements defaultTextField];
    surnameTextField.frame = CGRectMake(-screen.bounds.size.width, currentY, screen.bounds.size.width, textFieldHeight);
    surnameTextField.placeholder = @"Surname";
    surnameTextField.alpha = 0;

    currentY = currentY + textFieldHeight + 1;

    phoneTextField = [BasicElements defaultTextField];
    phoneTextField.frame = CGRectMake(-screen.bounds.size.width, currentY, screen.bounds.size.width, textFieldHeight);
    phoneTextField.placeholder = @"Phone";
    phoneTextField.alpha = 0;
    
    int registerButtonWidth = 100;
    int registerButtonHeight = 30;
    UIButton *registerButton = [BasicElements defaultButton];
    registerButton.frame = CGRectMake(screen.bounds.size.width/2-registerButtonWidth/2, screen.bounds.size.height-registerButtonHeight-32-64, registerButtonWidth, registerButtonHeight);
    [registerButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerTapped) forControlEvents:UIControlEventTouchUpInside];
    
    loadingImageView = [LoadingImageView new];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.96 alpha:1.0]];
    [self.view addSubview:emailTextField];
    [self.view addSubview:passwordTextField];
    [self.view addSubview:nameTextField];
    [self.view addSubview:surnameTextField];
    [self.view addSubview:phoneTextField];
    [self.view addSubview:registerButton];
}


- (void)registerTapped {
    if ([emailTextField.text isEqualToString:@""] || [passwordTextField.text isEqualToString:@""] || [nameTextField.text isEqualToString:@""] || [surnameTextField.text isEqualToString:@""] || [phoneTextField.text isEqualToString:@""]) {
        [self.view makeToast:@"Please fill missing fields"];
        
        return;
    }
    
    [loadingImageView show];
    
    UIScreen *screen = [UIScreen mainScreen];
    
    [[APIManager sharedInstance] authorizationWithEmail:emailTextField.text password:passwordTextField.text name:@"1" surname:@"2" phone:@"3" completionBlock:^(NSArray *response) {
        [loadingImageView hide];
        
        // toast with all possible options
        [self.view makeToast:@""
                    duration:3.0
                    position:[NSValue valueWithCGPoint:CGPointMake(screen.bounds.size.width/2, screen.bounds.size.height/2)]
                       title:@""
                       image:[UIImage imageNamed:@"success"]
                       style:nil
                  completion:^(BOOL didTap) {
                      [self.navigationController popToRootViewControllerAnimated:YES];

                      if (didTap) {
                          NSLog(@"completion from tap");
                      } else {
                          NSLog(@"completion without tap");
                      }
                  }];
        
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
