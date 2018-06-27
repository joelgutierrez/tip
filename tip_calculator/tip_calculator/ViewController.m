//
//  ViewController.m
//  tip_calculator
//
//  Created by Joel Gutierrez on 6/26/18.
//  Copyright © 2018 Joel Gutierrez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger intValue = [defaults integerForKey:@"default_tip_percentage"];
    
    [self.tipControl setSelectedSegmentIndex:intValue];
    
    [self onEdit:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
    
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray* percentages = @[@(0.10), @(0.175), @(0.25)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
                            
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

















@end
