//
//  TableCellView.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "TableCellView.h"
#import "CustomTextField.h"

@implementation TableCellView
@synthesize tf;
@synthesize borderLeft;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        tf = [[NSTextField alloc] initWithFrame:CGRectMake(frame.origin.x+7, frame.origin.y, frame.size.width, frame.size.height)];
        borderLeft = [[CustomBackgroundView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 8, frame.size.height)];
        [tf setFont:[NSFont fontWithName:@"Verdana" size:15]];
        [tf setBackgroundColor:[NSColor colorWithCalibratedRed:239./255 green:240./255 blue:242./255 alpha:1]];
        [tf setBezeled: NO];
        [tf setBackgroundColor:[NSColor colorWithCalibratedRed:189./255 green:195./255 blue:199./255 alpha:1]];
        

        [self addSubview:tf];
        [self addSubview:borderLeft];
        
        
        
        
    }
    return self;
}



@end
