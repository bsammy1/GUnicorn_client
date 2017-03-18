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

- (void)authorizationWithEmail:(NSString *)email password:(NSString *)password completionBlock:(CompletionBlock)completionBlock;

- (void)getPlacesWithCompletionBlock:(CompletionBlock)completionBlock;

@property SocketIOClient *socket;


@end
