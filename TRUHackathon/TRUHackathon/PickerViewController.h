//
//  PickerViewController.h
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum PickerOption
{
    PickerOptionCategory = 0,
    PickerOptionService = 1,
    PickerOptionEmployee = 2
} PickerOption;

@protocol PickerDelegate <NSObject>
@required
- (void)pickedOptionWithName:(NSString *)option;
@end

@interface PickerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property PickerOption pickerOption;
@property (weak) id <PickerDelegate> delegate;

@property NSString *category;
@property NSString *service;

@end
