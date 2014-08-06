//
//  View.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "View.h"

@implementation View
@synthesize textField;
@synthesize todoTableView;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        textField = [[NSTextField alloc] initWithFrame:frame];
        [textField setBackgroundColor:[NSColor redColor]];
        [textField setStringValue:@"COUCOU"];
        //[self addSubview:textField];
        
        todoTableView = [[NSTableView alloc] initWithFrame:frame];
        
        NSTableColumn* column1 = [[NSTableColumn alloc] initWithIdentifier:@"Col1"];
        [column1 setWidth:0.95*frame.size.width];
        [todoTableView addTableColumn:column1];
        
       // [self addSubview:todoTableView];
        [todoTableView setBackgroundColor:[NSColor greenColor]];
        [todoTableView setHeaderView:nil];
        
        
        
        
        NSScrollView* scrollView = [[NSScrollView alloc] initWithFrame:frame];
        
        [scrollView setDocumentView: todoTableView];
        [scrollView setHasVerticalScroller:YES];
   
        [self addSubview:scrollView];
        
        
        
    }
    return self;
}

- (void) drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // This next line sets the the current fill color parameter of the Graphics Context
    [[NSColor whiteColor] setFill];
    // This next function fills a rect the same as dirtyRect with the current fill color of the Graphics Context.
    NSRectFill(dirtyRect);
    // You might want to use _bounds or self.bounds if you want to be sure to fill the entire bounds rect of the view.
}
@end
