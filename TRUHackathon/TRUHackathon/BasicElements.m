//
//  BasicElements.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "BasicElements.h"
#import "DesingUtils.h"

@implementation BasicElements

+ (UITextField *)defaultTextField {
    UITextField *textField = [[UITextField alloc] init];
    
    [textField setBackgroundColor:[UIColor whiteColor]];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 40)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;

    return textField;
}

+ (UIButton *)defaultButton {
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[DesingUtils colorFromHexString:@"FFB42E"]];
    button.layer.cornerRadius = 8;
    
    return button;
}

+ (UILabel *)defaultLabel {
    UILabel *label = [[UILabel alloc] init];
    
    label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
    label.textColor = [UIColor colorWithWhite:0.55 alpha:1.0];
    
    return label;
}

@end
