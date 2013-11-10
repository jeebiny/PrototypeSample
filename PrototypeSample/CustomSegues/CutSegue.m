//
//  CutSegue.m
//  CHProtoLib
//
//  Created by Lingostar on 13. 9. 30..
//  Copyright (c) 2013년 CodersHigh. All rights reserved.
//

#import "CutSegue.h"

@implementation CutSegue

-(void)perform{
    //next page
    [[self.sourceViewController navigationController] pushViewController:self.destinationViewController animated:NO];
}

@end
