//
//  TodoListWindowController.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "View.h"
#include "Task.h"

@protocol AddTaskDelegate <NSObject>

@required
- (void) addTask:(NSString *) title;
- (void) removeTask:(Task *) task;

@end

@interface TodoListWindowController : NSWindowController <NSWindowDelegate, NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate>

@property (nonatomic, retain) View* todoView;
@property (nonatomic, retain) NSArray* dataTask;

@property (weak, nonatomic) id delegate;



@property (readwrite) BOOL openPanel;





- (void)openTodoPanel;
- (id)initWithData:(NSArray*) data;

@end
