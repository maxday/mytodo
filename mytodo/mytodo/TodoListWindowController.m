//
//  TodoListWindowController.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "TodoListWindowController.h"
#import "Task.h"



#define OPEN_DURATION .15
#define CLOSE_DURATION .1

#define SEARCH_INSET 17

#define POPUP_HEIGHT 122
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
        NSRect frame = NSMakeRect(100, 100, 200, 200);
        NSUInteger styleMask =  NSBorderlessWindowMask;
        NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];
        NSWindow * window =  [[NSWindow alloc] initWithContentRect:rect styleMask:styleMask backing: NSBackingStoreBuffered    defer:false];
        [window setBackgroundColor:[NSColor blueColor]];
        [window makeKeyAndOrderFront: window];
        //
        self.window = window;
        
        todoView = [[View alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
        todoView.textField.delegate = self;
        todoView.todoTableView.delegate = self;
        todoView.todoTableView.dataSource = self;
        
        [self.window.contentView addSubview:todoView];
 
        
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
    return 25.f;
}


- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    

    NSTextField *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
    
   
    if (result == nil) {
        result = [[NSTextField alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
        result.identifier = @"MyView";
    }
    
    result.stringValue = [[dataTask objectAtIndex:row] nameTask];
    
    // Return the result
    return result;
    
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    


}

 

@end
