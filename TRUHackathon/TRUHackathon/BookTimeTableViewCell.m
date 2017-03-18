//
//  BookTimeTableViewCell.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "BookTimeTableViewCell.h"

@implementation BookTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIScreen *screen = [UIScreen mainScreen];
        
        int buttonWidth = 40;
        
        self.timeLabel = [BasicElements defaultLabel];
        self.timeLabel.frame = CGRectMake(16, 16, screen.bounds.size.width-32-buttonWidth, 34);
        [self.contentView addSubview:self.timeLabel];
        
        UIButton *bookButton = [BasicElements defaultButton];
        bookButton.frame = CGRectMake(screen.bounds.size.width-16-buttonWidth, 16, buttonWidth, 34);
        [bookButton setTitle:@"Book" forState:UIControlStateNormal];
        [bookButton addTarget:self action:@selector(bookTapped) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:bookButton];
    }
    
    return self;
}

- (void)bookTapped {
    [self.delegate bookedDay:self.day andTime:self.time];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
