//
//  LSPickerViewController.m
//  DevOnPrototype
//
//  Created by Lingostar on 2013. 11. 8..
//  Copyright (c) 2013년 CodersHigh. All rights reserved.
//

#import "LSPickerViewController.h"

@interface LSPickerViewController (){
    id pickerFileCollection;
}

- (NSArray *)pickerView:(UIPickerView *)pickerView arrayForComponent:(NSInteger)component;
@end

@implementation LSPickerViewController

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

    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.nameOfPlistFile ofType:@"plist"];

    
    Class CollectionClass;
    if (self.numberOfColumn > 1){
        CollectionClass = [NSDictionary class];
    } else {
        CollectionClass = [NSArray class];
    }
    
    pickerFileCollection = [[CollectionClass alloc] initWithContentsOfFile:filePath];
    NSLog(@"Collection = %@", pickerFileCollection);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerView Protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.numberOfColumn;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *columnArray = [self pickerView:pickerView arrayForComponent:component];
    NSInteger rowCount = [columnArray count];
    return rowCount;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString *titleString;
    
    NSArray *columnArray = [self pickerView:pickerView arrayForComponent:component];
    if ([columnArray count] > row)
        titleString = [columnArray objectAtIndex:row];
    
    return titleString;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [pickerView reloadAllComponents];
}


- (NSArray *)pickerView:(UIPickerView *)pickerView arrayForComponent:(NSInteger)component
{
    BOOL isLast;
    
    NSDictionary *prevDictionary;
    NSArray *prevKeyArray;
    NSInteger prevSelected = 0;
    NSString *prevKey;
    
    NSArray *columnArray;
    if (component == 0){
        isLast = (self.numberOfColumn == component +1)? YES:NO;
        if (isLast){
            columnArray = pickerFileCollection;
        } else {
            columnArray = [pickerFileCollection allKeys];
        }
    } else {
        prevDictionary = pickerFileCollection;
    }
    
    for (int i = 0; i < component; i++) {
        isLast = (self.numberOfColumn == i +2)? YES:NO;
        
        prevKeyArray = [prevDictionary allKeys];
        prevSelected = [pickerView selectedRowInComponent:i];
        prevKey = [prevKeyArray objectAtIndex:prevSelected];
        
    
        if (isLast){
            columnArray = [prevDictionary valueForKey:prevKey];
        } else {
            NSDictionary *dictionary = [prevDictionary valueForKey:prevKey];
            prevDictionary = dictionary;
            columnArray = [dictionary allKeys];
        }
        
    }
    return columnArray;
}

/*
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
}
 
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
 
 }
 

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
 
}
 
 
 - (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
 {
 
 }
 
 
 - (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
 {
 
 
 }

 */
@end
