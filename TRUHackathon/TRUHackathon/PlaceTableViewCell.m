//
//  PlaceTableViewCell.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "PlaceTableViewCell.h"

@implementation PlaceTableViewCell

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
        
        self.nameLabel = [BasicElements defaultLabel];
        self.nameLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        self.nameLabel.textColor = [UIColor colorWithWhite:0.22 alpha:1.0];
        
        currentY = currentY + labelHeight + 8;
        
        self.addressLabel = [BasicElements defaultLabel];
        self.addressLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);
        [self.contentView addSubview:self.nameLabel];

        currentY = currentY + labelHeight + 8;

        self.phoneLabel = [BasicElements defaultLabel];
        self.phoneLabel.frame = CGRectMake(16, currentY, screen.bounds.size.width-32, labelHeight);
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.phoneLabel];
    }
    
    return self;
}

- (void)fillCellWithObject:(Place *)place {
    self.nameLabel.text = place.name;
    self.addressLabel.text = place.address;
    self.phoneLabel.text = place.phone;
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
