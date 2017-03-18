//
//  Booking.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "Booking.h"

@implementation Booking

+ (id)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)saveBooking {
    [[RLMRealm defaultRealm] transactionWithBlock:^{
        [Booking createInRealm:[RLMRealm defaultRealm] withValue:self];
    }];
}

@end
