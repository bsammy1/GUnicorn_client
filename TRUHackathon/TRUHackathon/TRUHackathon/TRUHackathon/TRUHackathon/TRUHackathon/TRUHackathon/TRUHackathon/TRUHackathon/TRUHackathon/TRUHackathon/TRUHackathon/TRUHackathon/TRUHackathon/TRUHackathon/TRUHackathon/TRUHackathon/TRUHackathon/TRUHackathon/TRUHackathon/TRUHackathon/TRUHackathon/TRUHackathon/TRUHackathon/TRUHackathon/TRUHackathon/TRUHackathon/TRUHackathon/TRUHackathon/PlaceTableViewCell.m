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
        
        self.nameLabel = [BasicElements defaultLabel];
        self.nameLabel.frame = CGRectMake(16, 16, screen.bounds.size.width-32, 34);
        [self.contentView addSubview:self.nameLabel];
        
        self.addressLabel = [BasicElements defaultLabel];
        self.addressLabel.frame = CGRectMake(16, 66, screen.bounds.size.width-32, 34);
        [self.contentView addSubview:self.nameLabel];

        self.phoneLabel = [BasicElements defaultLabel];
        self.phoneLabel.frame = CGRectMake(16, 116, screen.bounds.size.width-32, 34);
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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
