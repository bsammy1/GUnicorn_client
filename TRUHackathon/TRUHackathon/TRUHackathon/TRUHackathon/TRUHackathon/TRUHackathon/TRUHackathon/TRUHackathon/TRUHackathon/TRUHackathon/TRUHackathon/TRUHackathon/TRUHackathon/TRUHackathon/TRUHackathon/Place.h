//
//  Place.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property NSString *name;
@property NSString *address;
@property NSString *phone;

+ (Place *)getPlaceObjectFromDictionary:(NSDictionary *)dict;

@end
