//
//  UIViewController+Dismiss.h
//  StoryBoard
//
//  Created by lingostar on 10/2/12.
//  Copyright (c) 2012 lingostar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController(UIViewController_Storyboard)
- (IBAction)navigationBackToRoot:(id)sender;

- (IBAction)exit:(UIStoryboardSegue *)segue;

- (IBAction)dismissPush:(id)sender;
- (IBAction)modalDismiss:(id)sender;


- (IBAction)testPush:(id)sender;
@end
