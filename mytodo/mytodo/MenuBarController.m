//
//  MenuBarController.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "MenuBarController.h"
#import "Task.h"

#define STATUS_ITEM_VIEW_WIDTH 24.0


@implementation MenuBarController
@synthesize statusItemView;
@synthesize todoListWindowController;
@synthesize managedObjectContext;

- (id)init
{
    self = [super init];
    if (self) {

        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
        [statusItemView setImageDefault:[NSImage imageNamed:@"icon"]];
        
        statusItemView.action = @selector(openTodoListPanel:);
        statusItemView.target = self;
        
    }
    return self;
}

- (void) openTodoListPanel:(id) sender {
    
    
    CGRect eventFrame = [[[NSApp currentEvent] window] frame];
    CGPoint eventOrigin = eventFrame.origin;
    CGSize eventSize = eventFrame.size;
    CGRect windowFrame = todoListWindowController.window.frame;
    CGSize windowSize = windowFrame.size;
    CGPoint windowTopLeftPosition = CGPointMake(eventOrigin.x + eventSize.width/2.f - windowSize.width/2.f, eventOrigin.y - 20);
    todoListWindowController = [[TodoListWindowController alloc] initWithData:[self fetchAll]];

    [todoListWindowController.window setFrameTopLeftPoint:windowTopLeftPosition];
    [todoListWindowController.window makeKeyAndOrderFront:self];
    
    [NSApp activateIgnoringOtherApps:YES];

}

-(NSArray*) fetchAll {
    
    Task* task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:managedObjectContext];
    
    [task setNameTask:@"task1"];
    
    
    NSError *error = nil;
    [managedObjectContext save:&error];
    if (error != nil) {
        NSLog(@"Core data error");
    }
    else {
        NSLog(@"ok j'ai saved");
    }
    
    NSLog(@"FETCH IT");
    
    NSFetchRequest * fetchRequestGroup = [[NSFetchRequest alloc] init];
    [fetchRequestGroup setEntity:[NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedObjectContext]];
    
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"nameTask" ascending:YES];
    [fetchRequestGroup setSortDescriptors:[NSArray arrayWithObject:sortByName]];
    
    error = nil;
    NSArray * group = [managedObjectContext executeFetchRequest:fetchRequestGroup error:&error];

    //NSLog(@"%@", [group debugDescription]);
    
    return group;
}


@end
