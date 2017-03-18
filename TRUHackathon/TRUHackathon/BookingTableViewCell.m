//
//  PlaceTableViewCell.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "BookingTableViewCell.h"

@implementation BookingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIScreen *screen = [UIScreen mainScreen];
        
        int currentY = 16;
        int labelHeight = 20;
        
        self.placeNameLabel = [BasicElements defaultLabel];
        self.placeNameLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);
        [self.contentView addSubview:self.placeNameLabel];
        self.placeNameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        self.placeNameLabel.textColor = [UIColor colorWithWhite:0.22 alpha:1.0];
        
        currentY = currentY + labelHeight + 8;
        
        self.timeLabel = [BasicElements defaultLabel];
        self.timeLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);
        [self.contentView addSubview:self.timeLabel];

        currentY = currentY + labelHeight + 8;

        self.dayLabel = [BasicElements defaultLabel];
        self.dayLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);
        
        currentY = currentY + labelHeight + 8;
        
        self.serviceLabel = [BasicElements defaultLabel];
        self.serviceLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);

        currentY = currentY + labelHeight + 8;
        
        self.employeeLabel = [BasicElements defaultLabel];
        self.employeeLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);

        
        [self.contentView addSubview:self.placeNameLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.dayLabel];
        [self.contentView addSubview:self.serviceLabel];
        [self.contentView addSubview:self.employeeLabel];
    }
    
    return self;
}

- (void)fillCellWithObject:(Booking *)booking {
    self.placeNameLabel.text = booking.placeName;
    self.timeLabel.text = booking.time;
    self.dayLabel.text = booking.day;
    self.serviceLabel.text = booking.service;
    self.employeeLabel.text = booking.employee;
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
