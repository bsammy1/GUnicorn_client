//
//  DesingUtils.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesingUtils : NSObject

+ (void)setNavigationBarDesign;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

+ (UIColor *)colorFromHexString:(NSString *)hexString andAlpha:(float)alpha;

+ (void)setToastDesign;

@end
