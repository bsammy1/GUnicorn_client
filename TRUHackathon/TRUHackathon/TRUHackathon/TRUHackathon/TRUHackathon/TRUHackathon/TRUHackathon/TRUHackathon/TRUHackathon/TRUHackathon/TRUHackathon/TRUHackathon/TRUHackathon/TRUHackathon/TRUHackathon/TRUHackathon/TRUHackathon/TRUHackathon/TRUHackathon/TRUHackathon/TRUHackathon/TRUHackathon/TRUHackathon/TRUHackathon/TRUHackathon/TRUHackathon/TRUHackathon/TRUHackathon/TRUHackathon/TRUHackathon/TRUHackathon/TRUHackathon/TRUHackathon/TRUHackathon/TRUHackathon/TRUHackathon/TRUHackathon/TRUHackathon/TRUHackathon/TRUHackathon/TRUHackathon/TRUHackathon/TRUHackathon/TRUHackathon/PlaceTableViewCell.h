//
//  PlaceTableViewCell.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceTableViewCell : UITableViewCell

@property UILabel *nameLabel;
@property UILabel *addressLabel;
@property UILabel *phoneLabel;

- (void)fillCellWithObject:(Place *)object;

@end
