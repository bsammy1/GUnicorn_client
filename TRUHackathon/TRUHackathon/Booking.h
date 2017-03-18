//
//  Booking.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Booking : RLMObject

+ (id)sharedInstance;

@property NSString *placeName;
@property NSString *time;
@property NSString *day;
@property NSString *service;
@property NSString *employee;

@end
