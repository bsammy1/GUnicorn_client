//
//  BasicElements.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "BasicElements.h"

@implementation BasicElements

+ (UITextField *)defaultTextField {
    UITextField *textField = [[UITextField alloc] init];
    
    return textField;
}

+ (UIButton *)defaultButton {
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return button;
}

+ (UILabel *)defaultLabel {
    UILabel *label = [[UILabel alloc] init];
    
    return label;
}

@end
