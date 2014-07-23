//
//  RootViewController.m
//  Adventure
//
//  Created by Iván Mervich on 7/22/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "RootViewController.h"
#import "StoryViewController.h"

@interface RootViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *endingLabel;
@property (weak, nonatomic) IBOutlet UITextField *protagonistTextField;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set delegate for textfield
    self.protagonistTextField.delegate = self;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    StoryViewController *destinationViewController = (StoryViewController *) segue.destinationViewController;
    UIButton *senderButton = (UIButton *) sender;

    // send the title to the next viewController
    destinationViewController.navTitle = senderButton.titleLabel.text;

    // save the protagonist name in the user defaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.protagonistTextField.text forKey:@"protagonist"];
}

- (IBAction)unwindAndRestartAdventure:(UIStoryboardSegue *)segue {

    StoryViewController *sourceViewController = (StoryViewController *) segue.sourceViewController;
    // set root view controller's label
    self.endingLabel.text = [NSString stringWithFormat:@"Last ending: %@", sourceViewController.navigationItem.title];
}

// remove keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end