//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Meera Mehta on 5/14/14.
//  Copyright (c) 2014 cp. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
- (IBAction)valueChanged:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // load the default value of tipControlIndex, if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipControlIndex"];
    self.defaultTipControl.selectedSegmentIndex = intValue; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// on value changed, set the value to NSDefaults
- (IBAction)valueChanged:(id)sender {
    int defaultTipControlIndex = self.defaultTipControl.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipControlIndex forKey:@"defaultTipControlIndex"];
    [defaults synchronize];
}
@end
