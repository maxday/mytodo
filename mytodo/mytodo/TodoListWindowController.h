//
//  TodoListWindowController.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "View.h"

@interface TodoListWindowController : NSWindowController <NSWindowDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, retain) View* todoView;
@property (nonatomic, retain) NSArray* dataTask;




@property (readwrite) BOOL openPanel;




- (void)openTodoPanel;
- (id)initWithData:(NSArray*) data;

@end
