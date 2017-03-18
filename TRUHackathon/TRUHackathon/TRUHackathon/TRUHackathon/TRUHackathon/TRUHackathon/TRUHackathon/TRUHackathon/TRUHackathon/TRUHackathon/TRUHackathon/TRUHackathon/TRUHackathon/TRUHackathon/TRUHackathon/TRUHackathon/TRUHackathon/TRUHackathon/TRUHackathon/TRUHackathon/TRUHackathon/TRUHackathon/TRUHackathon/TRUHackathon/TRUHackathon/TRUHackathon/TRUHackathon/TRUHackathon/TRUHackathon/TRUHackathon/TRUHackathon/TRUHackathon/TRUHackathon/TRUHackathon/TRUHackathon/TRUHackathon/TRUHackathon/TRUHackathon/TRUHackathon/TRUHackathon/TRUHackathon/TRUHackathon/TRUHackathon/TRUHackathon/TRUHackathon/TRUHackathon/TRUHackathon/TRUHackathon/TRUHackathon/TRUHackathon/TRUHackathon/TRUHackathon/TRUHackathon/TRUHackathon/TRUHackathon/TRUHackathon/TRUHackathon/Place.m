//
//  Place.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "Place.h"

@implementation Place

+ (Place *)getPlaceObjectFromDictionary:(NSDictionary *)dict {
    Place *place = [Place new];
    place.name = dict[@"name"];
    place.address = dict[@"address"];
    place.phone = dict[@"phone"];
    
    return place;
}

@end
