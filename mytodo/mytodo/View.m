//
//  View.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "View.h"
#import "Constants.h"

@implementation View
@synthesize textField;
@synthesize todoTableView;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        textField = [[NSTextField alloc] initWithFrame:CGRectMake(NEW_TASK_PADDING, TABLE_HEIGHT+20, POPUP_WIDTH-2*NEW_TASK_PADDING, 40)];
        [textField.cell setPlaceholderString:@"Enter a new task"];
        
        
       // [textField setFont:[NSFont fontWithName:@"HelveticaNeue-Light" size:13]];
        [textField setAlignment:kCTTextAlignmentCenter];
        
        
        [textField setBezelStyle:NSTextFieldRoundedBezel];
        
        [self addSubview:textField];
        
        
        
        NSTableColumn* column1 = [[NSTableColumn alloc] initWithIdentifier:@"Col1"];
        [column1 setWidth:frame.size.width];
        
        
        
        
        
        NSScrollView* scrollView = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, TABLE_HEIGHT+15, POPUP_WIDTH)];
        
        todoTableView = [[NSTableView alloc] initWithFrame:scrollView.bounds];
        [todoTableView addTableColumn:column1];
        
        
        
        
        [todoTableView setBackgroundColor:[NSColor colorWithCalibratedRed:239./255 green:240./255 blue:242./255 alpha:1]];
        [todoTableView setHeaderView:nil];

        
        [scrollView setDocumentView: todoTableView];
        [scrollView setHasVerticalScroller:NO];
   
        [self addSubview:scrollView];
        
        
        
    }
    return self;
}
- (void) drawRect:(NSRect)dirtyRect {
    [[NSColor colorWithCalibratedRed:239./255 green:240./255 blue:242./255 alpha:1] set];
    NSRectFill(dirtyRect);
}

@end
