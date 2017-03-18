//
//  PlaceTableViewCell.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Booking.h"

@interface BookingTableViewCell : UITableViewCell

@property UILabel *placeNameLabel;
@property UILabel *timeLabel;
@property UILabel *dayLabel;
@property UILabel *serviceLabel;
@property UILabel *employeeLabel;

- (void)fillCellWithObject:(Booking *)object;

@end
