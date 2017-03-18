//
//  BookTimeTableViewCell.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "BookTimeTableViewCell.h"
#import "DesingUtils.h"

@implementation BookTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIScreen *screen = [UIScreen mainScreen];
        
        int buttonWidth = 56;
        
        self.timeLabel = [BasicElements defaultLabel];
        self.timeLabel.frame = CGRectMake(16, 0, screen.bounds.size.width-32-buttonWidth, 56);
        [self.contentView addSubview:self.timeLabel];
        
        UIButton *bookButton = [UIButton new];
        bookButton.frame = CGRectMake(screen.bounds.size.width-buttonWidth, 0, buttonWidth, 56);
        [bookButton setImage:[UIImage imageNamed:@"bookIcon"] forState:UIControlStateNormal];
        [bookButton addTarget:self action:@selector(bookTapped) forControlEvents:UIControlEventTouchUpInside];
        [bookButton setBackgroundColor:[DesingUtils colorFromHexString:@"E8F3FF"]];
        
        //UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(screen.bounds.size.width-buttonWidth, 0, 1.0, 56)];
        //[separatorView setBackgroundColor:[UIColor lightGrayColor]];
        
//        [self.contentView addSubview:separatorView];
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
