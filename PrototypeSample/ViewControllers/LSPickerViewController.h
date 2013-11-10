//
//  LSPickerViewController.h
//  DevOnPrototype
//
//  Created by Lingostar on 2013. 11. 8..
//  Copyright (c) 2013년 CodersHigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property int numberOfColumn;
@property NSString *nameOfPlistFile;

@end
