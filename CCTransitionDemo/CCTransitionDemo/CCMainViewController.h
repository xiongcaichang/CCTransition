//
//  CCMainViewController.h
//  CCTransitionAnimation
// https://github.com/xiongcaichang/CCTransition
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCViewController.h"

@interface CCMainViewController : CCViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *optionView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (weak, nonatomic) IBOutlet UITextField *navigationField;
@property (weak, nonatomic) IBOutlet UITextField *typeNavigationField;
@property (weak, nonatomic) IBOutlet UITextField *modalField;
@property (weak, nonatomic) IBOutlet UITextField *typeModalField;

- (IBAction)navigationButtonTapped:(id)sender;
- (IBAction)modalButtonTapped:(id)sender;

@end
