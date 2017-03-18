//
//  APIManager.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "APIManager.h"
#import "Constants.h"

@implementation APIManager

+ (id)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    if ([super init]) {
        NSURL* url = [[NSURL alloc] initWithString:kBaseURL];

        self.socket = [[SocketIOClient alloc] initWithSocketURL:url config:@{@"log": @YES, @"forcePolling": @YES}];
        
        [self.socket connect];
        
        [self.socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
            NSLog(@"socket connected");
            
            [[NSNotificationCenter defaultCenter]
             postNotificationName:kSocketConnectedNotification
             object:self];
        }];
    }
    
    return self;
}

- (void)authorizationWithEmail:(NSString *)email password:(NSString *)password name:(NSString *)name surname:(NSString *)surname phone:(NSString *)phone completionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"registration" with:@[email, password, name, surname, phone]];

    [self.socket on:@"registrationSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response);
        
        completionBlock(response);
    }];
}

- (void)getPlacesWithCompletionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"getPlaces" with:@[]];
    
    [self.socket on:@"getPlacesSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response);
        
        NSArray *placeDicts = response[0];
        
        NSMutableArray *placeObjects = [NSMutableArray new];
        
        for (NSDictionary *placeDict in placeDicts) {
            Place *place = [Place getPlaceObjectFromDictionary:placeDict];
            [placeObjects addObject:place];
        }
        
        completionBlock(placeObjects);
    }];
}

- (void)getServicesForCategory:(NSString *)category withCompletionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"getServices" with:@[category]];
    
    [self.socket on:@"getServicesSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response);
        
        NSArray *categories = response[0];
        
        completionBlock(categories);
    }];
}

- (void)getEmployeesForService:(NSString *)service withCompletionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"getEmployees" with:@[service]];
    
    [self.socket on:@"getEmployeesSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response);
        
        NSArray *employees = response[0];
        
        completionBlock(employees);
    }];
}

- (void)getDaysAndTimesForCategory:(NSString *)category service:(NSString *)service employee:(NSString *)employee withCompletionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"getDaysAndTimes" with:@[category, service, employee]];
    
    [self.socket on:@"getDaysAndTimesSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response[0]);
        
        completionBlock(response[0]);
    }];
}

- (void)bookWithDay:(NSString *)day andTime:(NSString *)time withCompletionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"book" with:@[day, time]];
    
    [self.socket on:@"bookSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response[0]);
        
        completionBlock(@[]);
    }];
}



@end
