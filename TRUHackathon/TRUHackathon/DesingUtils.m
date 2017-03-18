//
//  DesingUtils.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "DesingUtils.h"

@implementation DesingUtils

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    return [self colorFromHexString:hexString andAlpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString andAlpha:(float)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:0]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

+ (void)setNavigationBarDesign {
    [[UINavigationBar appearance] setBarTintColor:[self colorFromHexString:@"2B81E5"]];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //[[UINavigationBar appearance] setTintColor:[self colorFromHexString:@"2B81E5"]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
}

+ (void)setToastDesign {
    // create a new style
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    
    // this is just one of many style options
    style.messageColor = [UIColor whiteColor];
    style.backgroundColor = [DesingUtils colorFromHexString:@"2B81E5" andAlpha:0.85];
    
    // or perhaps you want to use this style for all toasts going forward?
    // just set the shared style and there's no need to provide the style again
    [CSToastManager setSharedStyle:style];
    
    // toggle "tap to dismiss" functionality
    [CSToastManager setTapToDismissEnabled:YES];
        
    [CSToastManager setDefaultDuration:1.5];
}

@end
