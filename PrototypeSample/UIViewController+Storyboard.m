//
//  UIViewController+Dismiss.m
//  StoryBoard
//
//  Created by lingostar on 10/2/12.
//  Copyright (c) 2012 lingostar. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController(UIViewController_Storyboard)

- (IBAction)navigationBackToRoot:(id)sender
{
    UINavigationController *navController = self.navigationController;
    [navController popToRootViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *view in self.view.subviews) {
        [view resignFirstResponder];
    }
    
}


- (IBAction)exit:(UIStoryboardSegue *)segue
{
    
}

- (IBAction)dismissPush:(id)sender
{
    //UIViewController *destVC = self.presentingViewController;
   // UIViewController *destVC2 = self.presentedViewController;
    //[destVC performSegueWithIdentifier:@"ModalDismissPush" sender:nil];
    
    /*dispatch_async(dispatch_get_main_queue(),
                   ^{[destVC performSegueWithIdentifier:@"ModalDismissPush" sender:nil];}
                   );*/
    
    //탭이 있는 경우 presentingViewController가 UITabBarCongtroller로 나오므로
    UIViewController *destVC;
    UIViewController *presentingVC = self.presentingViewController;
    UIViewController *tempVC;
    if ([presentingVC isKindOfClass:[UITabBarController class]]){
        tempVC = [(UITabBarController *)presentingVC selectedViewController];
        if ([tempVC isKindOfClass:[UINavigationController class]]){
            destVC = [(UINavigationController *)tempVC topViewController];
        } else {
            destVC = tempVC;
        }
    } else {
        destVC = presentingVC;
    }
    
    [destVC performSegueWithIdentifier:@"ModalDismissPush" sender:nil];
    
    NSLog(@"VC1 = %@ \r\n VC2 = %@", destVC, presentingVC);
    [self dismissViewControllerAnimated:YES completion:^{}];
}


- (IBAction)modalDismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
