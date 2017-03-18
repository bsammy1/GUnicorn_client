//
//  APIManager.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <Foundation/Foundation.h>
@import SocketIO;

typedef void (^CompletionBlock)(NSArray *response);

@interface APIManager : NSObject

+ (id)sharedInstance;

- (void)authorizationWithEmail:(NSString *)email password:(NSString *)password name:(NSString *)name surname:(NSString *)surname phone:(NSString *)phone completionBlock:(CompletionBlock)completionBlock;

- (void)getPlacesWithCompletionBlock:(CompletionBlock)completionBlock;

- (void)getServicesForCategory:(NSString *)category withCompletionBlock:(CompletionBlock)completionBlock;

- (void)getEmployeesForService:(NSString *)service withCompletionBlock:(CompletionBlock)completionBlock;

@property SocketIOClient *socket;

- (void)getDaysAndTimesForCategory:(NSString *)category service:(NSString *)service employee:(NSString *)employee withCompletionBlock:(CompletionBlock)completionBlock;

- (void)bookWithDay:(NSString *)day andTime:(NSString *)time withCompletionBlock:(CompletionBlock)completionBlock;

@end
