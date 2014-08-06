//
//  MenuBarController.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "MenuBarController.h"
#define STATUS_ITEM_VIEW_WIDTH 24.0


@implementation MenuBarController
@synthesize statusItemView;
@synthesize todoListWindowController;

- (id)init
{
    self = [super init];
    if (self) {

        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
        [statusItemView setImageDefault:[NSImage imageNamed:@"icon"]];
        
        statusItemView.action = @selector(openTodoListPanel:);
        statusItemView.target = self;
        
        todoListWindowController = [[TodoListWindowController alloc] init];
        
    }
    return self;
}

- (void) openTodoListPanel:(id) sender {
    NSLog(@"coucou");
   //[self.todoListWindowController openTodoPanel];
    
    
    // Get the frame and origin of the control of the current event
    // (= our NSStatusItem)
    CGRect eventFrame = [[[NSApp currentEvent] window] frame];
    CGPoint eventOrigin = eventFrame.origin;
    CGSize eventSize = eventFrame.size;
    
    // Create a window controller from your xib file
    // and get the window reference
    ;
   
    
    // Calculate the position of the window to
    // place it centered below of the status item
    CGRect windowFrame = todoListWindowController.window.frame;
    CGSize windowSize = windowFrame.size;
    CGPoint windowTopLeftPosition = CGPointMake(eventOrigin.x + eventSize.width/2.f - windowSize.width/2.f, eventOrigin.y - 20);
    
    // Set position of the window and display it
    [todoListWindowController.window setFrameTopLeftPoint:windowTopLeftPosition];
    [todoListWindowController.window makeKeyAndOrderFront:self];
    
    // Show your window in front of all other apps
    [NSApp activateIgnoringOtherApps:YES];
}


@end
