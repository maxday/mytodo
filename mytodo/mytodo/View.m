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
        
        textField = [[NSTextField alloc] initWithFrame:CGRectMake(NEW_TASK_PADDING, TABLE_HEIGHT+40, POPUP_WIDTH-2*NEW_TASK_PADDING, 20)];
        [textField.cell setPlaceholderString:@"Enter a new task"];
        [textField setAlignment:kCTTextAlignmentCenter];
        [textField setBezelStyle:NSTextFieldRoundedBezel];
        [textField setFocusRingType:NSFocusRingTypeNone];
        
        [self addSubview:textField];

        NSTableColumn* column1 = [[NSTableColumn alloc] initWithIdentifier:@"Col1"];
        [column1 setWidth:frame.size.width];
         NSScrollView* scrollView = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, POPUP_WIDTH, TABLE_HEIGHT+30)];
        todoTableView = [[NSTableView alloc] initWithFrame:scrollView.bounds];
        [todoTableView addTableColumn:column1];
        [todoTableView setIntercellSpacing:NSMakeSize(0, 1)];
        [todoTableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
        [todoTableView setBackgroundColor:[NSColor colorWithCalibratedRed:205./255 green:205./255 blue:205./255 alpha:1]];
        [todoTableView setHeaderView:nil];
        [scrollView setDocumentView: todoTableView];
        [scrollView setHasVerticalScroller:NO];
        
        [self addSubview:scrollView];
    }
    return self;
}
- (void) drawRect:(NSRect)dirtyRect {
    [[NSColor colorWithCalibratedRed:52./255 green:74./255 blue:94./255 alpha:1] set];
    NSRectFill(dirtyRect);
}


@end
