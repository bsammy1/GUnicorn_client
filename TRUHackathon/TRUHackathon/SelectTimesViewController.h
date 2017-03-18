//
//  SelectTimesViewController.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookTimeTableViewCell.h"

@interface SelectTimesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, BookDelegate>

@property NSString *category;
@property NSString *service;
@property NSString *employee;

@end
