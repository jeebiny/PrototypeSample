//
//  LSScrollViewController.m
//  StoryboardTest
//
//  Created by Lingostar on 13. 1. 22..
//  Copyright (c) 2013년 Lingostar. All rights reserved.
//

#import "LSScrollViewController.h"

@interface LSScrollViewController ()

@end

@implementation LSScrollViewController

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
	// Do any additional setup after loading the view.
    UIScrollView *storyboardScrollView = (UIScrollView *)[self.view.subviews lastObject];
    CGSize scrollSize = CGSizeMake(self.scrollWidth, self.scrollHeight);
    storyboardScrollView.contentSize = scrollSize;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
