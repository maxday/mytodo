//
//  TodoListWindowController.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "TodoListWindowController.h"
#import "CustomWindow.h"
#import "Task.h"
#import "Constants.h"
#import "TableCellView.h"


#define OPEN_DURATION .15
#define CLOSE_DURATION .1

#define SEARCH_INSET 17


#define PANEL_WIDTH 280
#define MENU_ANIMATION_DURATION .1

@interface TodoListWindowController () <NSTextFieldDelegate>

@end

@implementation TodoListWindowController
@synthesize todoView;
@synthesize dataTask;


- (id)initWithData:(NSArray*) data
{
    self = [super init];
    if (self) {
        self.dataTask = data;
        NSRect frame = NSMakeRect(100, 100, POPUP_WIDTH, POPUP_HEIGHT);
        NSUInteger styleMask =  NSBorderlessWindowMask;
        NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];
        CustomWindow * window =  [[CustomWindow alloc] initWithContentRect:rect styleMask:styleMask backing: NSBackingStoreBuffered    defer:false];
        [window setBackgroundColor:[NSColor blueColor]];
        [window makeKeyAndOrderFront: window];
        //
        self.window = window;
        
        todoView = [[View alloc] initWithFrame:CGRectMake(0, 0, POPUP_WIDTH, POPUP_HEIGHT)];
        todoView.textField.delegate = self;
        todoView.todoTableView.delegate = self;
        todoView.todoTableView.dataSource = self;
        
        [todoView.textField setEnabled:YES];
        [todoView.textField setEditable:YES];
        
        
        
        
        [self.window setOpaque:NO];
        [self.window setBackgroundColor:[NSColor colorWithCalibratedWhite:WHITE_CALIBRATE alpha:ALPHA]];
        
        
        
    
        
        self.window.contentView = todoView;
 
        
        self.window.delegate = self;

        
    }
    return self;
}

- (void)setHasActivePanel:(BOOL)flag
{
    [self openTodoPanel];
}

- (NSRect)statusRectForWindow:(NSWindow *)window
{
    return NSRectFromCGRect(CGRectMake(857, 756, 24, 22));
}


- (void)openTodoPanel {
    NSLog(@"jouvre le panel ici");
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataTask count];
}

- (CGFloat) tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return TASK_BOX_HEIGHT;
}


- (TableCellView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    

    TableCellView *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
    
    if (result == nil) {
        
        result = [[TableCellView alloc] initWithFrame:CGRectMake(TASK_PADDING_LEFT, (TASK_BOX_HEIGHT-TASK_HEIGHT)/2, 0.98*TASK_WIDTH, TASK_HEIGHT)];
        result.identifier = @"MyView";
    }
    
    result.tf.stringValue = [[dataTask objectAtIndex:row] nameTask];
    
    if(row%5 == 0)
        [result.borderLeft changeColor:[NSColor colorWithCalibratedRed:26./255 green:188./255 blue:156./255 alpha:1]];
    if(row%5 == 1)
        [result.borderLeft changeColor:[NSColor colorWithCalibratedRed:231./255 green:76./255 blue:60./255 alpha:1]];
    if(row%5 == 2)
        [result.borderLeft changeColor:[NSColor colorWithCalibratedRed:52./255 green:74./255 blue:94./255 alpha:1]];
    if(row%5 == 3)
        [result.borderLeft changeColor:[NSColor colorWithCalibratedRed:52./255 green:152./255 blue:219./255 alpha:1]];

    if(row%5 == 4)
        [result.borderLeft changeColor:[NSColor colorWithCalibratedRed:241./255 green:196./255 blue:15./255 alpha:1]];
    
    
    // Return the result
    
   
    
    return result;
    
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    

    


}



-(void)controlTextDidEndEditing:(NSNotification *)notification
{
    // See if it was due to a return
    if ( [[[notification userInfo] objectForKey:@"NSTextMovement"] intValue] == NSReturnTextMovement && ![todoView.textField.stringValue isEqualTo:@""])
    {
        [self.delegate addTask:todoView.textField.stringValue];
        [todoView.textField setStringValue:@""];
    }
}



- (void)mouseDown:(NSEvent *)theEvent {
    NSLog(@"md");
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    NSLog(@"CHANGE");
    NSLog(@"%@", [todoView.textField.delegate debugDescription]);
}



@end
