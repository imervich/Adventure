//
//  RiddleViewController.m
//  Adventure
//
//  Created by Iván Mervich on 7/22/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "RiddleViewController.h"
#import "StoryViewController.h"

@interface RiddleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *clearBoxesButton;
@property (weak, nonatomic) IBOutlet UIButton *spaguettiMonsterButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UILabel *continueLabel;

@end

@implementation RiddleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.clearBoxesButton.enabled = NO;
    self.spaguettiMonsterButton.enabled = NO;

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *newProtagonist = [userDefaults objectForKey:@"protagonist"];

    NSString *textViewContentWithNewProtagonist = [self.questionLabel.text stringByReplacingOccurrencesOfString:@"Ryan" withString:newProtagonist];
    self.questionLabel.text = textViewContentWithNewProtagonist;

}
- (IBAction)OnYesButtonPressed:(id)sender {
    [self showStoryButtons];
    [self showContinueLabel];
    self.clearBoxesButton.enabled = YES;
    [self disableAnswerButtons];

}
- (IBAction)onNoButtonPressed:(id)sender {
    [self showStoryButtons];
    [self showContinueLabel];
    self.spaguettiMonsterButton.enabled = YES;
    [self disableAnswerButtons];
}

- (void)showStoryButtons {
    self.clearBoxesButton.alpha = 1;
    self.spaguettiMonsterButton.alpha = 1;
}

- (void)showContinueLabel {
    self.continueLabel.alpha = 1;
}

- (void)disableAnswerButtons {
    self.yesButton.enabled = NO;
    self.noButton.enabled = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    StoryViewController *destinationViewController = (StoryViewController *) segue.destinationViewController;
    UIButton *senderButton = (UIButton *)sender;

    destinationViewController.navTitle = senderButton.titleLabel.text;
}

@end
