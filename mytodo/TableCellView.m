//
//  TableCellView.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "TableCellView.h"

@implementation TableCellView
@synthesize tf;
@synthesize borderLeft;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        tf = [[NSTextField alloc] initWithFrame:CGRectMake(frame.origin.x+7, frame.origin.y, frame.size.width, frame.size.height)];
        [tf setFont:[NSFont fontWithName:@"Verdana" size:15]];
        [tf setBackgroundColor:[NSColor colorWithCalibratedRed:230./255 green:230./255 blue:230./255 alpha:1]];
        [tf setBezeled: NO];
        [tf setEnabled:NO];
        [self addSubview:tf];
        
        borderLeft = [[CustomBackgroundView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 8, frame.size.height)];
        [self addSubview:borderLeft];
    }
    return self;
}

@end
