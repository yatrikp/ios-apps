//
//  TipViewController.m
//  tipcalculator
//
//  Created by Yatrik Mehta on 5/7/14.
//  Copyright (c) 2014 cp. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (IBAction)resetButtonTapped:(id)sender;
@end

@implementation TipViewController   

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

// view load
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

// if memory warning received
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// on tap gesture on any part of the screen
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

// update values of tip and total based on the values - bill and tip option
- (void) updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount ];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

// reset the entire ui view
- (IBAction)resetButtonTapped:(id)sender {
    self.billTextField.text = nil;
    self.tipControl.selectedSegmentIndex = 0;
    [self updateValues];
}
@end
