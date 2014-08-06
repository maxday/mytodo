//
//  CustomBackgroundView.m
//  mytodo
//
//  Created by maxday on 2014-08-06.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "CustomBackgroundView.h"

@implementation CustomBackgroundView
@synthesize background;

- (void)drawRect:(NSRect)rect{
    [background set];
    NSRectFill([self bounds]);
}

- (void)changeColor:(NSColor*) aColor{
    background = aColor;
}

@end
