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
        }];
    }
    
    return self;
}

- (void)authorizationWithEmail:(NSString *)email password:(NSString *)password completionBlock:(CompletionBlock)completionBlock {
    [self.socket emit:@"registration" with:@[@"test", @"test"]];

    [self.socket on:@"registrationSuccess" callback:^(NSArray *response, SocketAckEmitter * ack) {
        NSLog(@"%@", response);
        
        completionBlock(response);
    }];
//    [socket on:@"currentAmount" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        double cur = [[data objectAtIndex:0] floatValue];
//        
//        [[socket emitWithAck:@"canUpdate" with:@[@(cur)]] timingOutAfter:0 callback:^(NSArray* data) {
//            [socket emit:@"update" with:@[@{@"amount": @(cur + 2.50)}]];
//        }];
//        
//        [ack with:@[@"Got your currentAmount, ", @"dude"]];
//    }];
//    
//    [socket connect];
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

@end
