//
//  EndingViewController.m
//  Adventure
//
//  Created by Iván Mervich on 7/22/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StoryViewController.h"
#import "RootViewController.h"

@interface StoryViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation StoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set the title
    self.navigationItem.title = self.navTitle;

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *newProtagonist = [userDefaults objectForKey:@"protagonist"];

    NSString *textViewContentWithNewProtagonist = [self.textView.text stringByReplacingOccurrencesOfString:@"Ryan" withString:newProtagonist];
    self.textView.text = textViewContentWithNewProtagonist;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    UIButton *senderButton = (UIButton *) sender;

    // send the title (if available) to the next viewController
    if ([segue.destinationViewController respondsToSelector:@selector(setNavTitle:)]) {
        StoryViewController *destinationViewController = (StoryViewController *) segue.destinationViewController;
        destinationViewController.navTitle = senderButton.titleLabel.text;
    }
}


@end
