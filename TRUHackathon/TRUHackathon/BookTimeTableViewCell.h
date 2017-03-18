//
//  BookTimeTableViewCell.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BookDelegate <NSObject>
@required
- (void)bookedDay:(NSString *)day andTime:(NSString *)time;
@end

@interface BookTimeTableViewCell : UITableViewCell

@property UILabel *timeLabel;
@property (weak) id <BookDelegate> delegate;

@property NSString *time;
@property NSString *day;

@end
