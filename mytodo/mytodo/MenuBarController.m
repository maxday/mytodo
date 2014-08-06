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
@synthesize isOpen;

- (id)init
{
    self = [super init];
    if (self) {
        
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
        [statusItemView setImageDefault:[NSImage imageNamed:@"icon"]];
        
        statusItemView.action = @selector(openTodoListPanel:);
        statusItemView.target = self;
        
        isOpen = NO;
   
        
    }
    return self;
}

- (void) openTodoListPanel:(id) sender {
    
    if(isOpen) {
        todoListWindowController = nil;
        isOpen = NO;
        return;
    }
    
    isOpen = YES;
    
   // [self clearTask];
    
    CGRect eventFrame = [[[NSApp currentEvent] window] frame];
    CGPoint eventOrigin = eventFrame.origin;
    CGPoint windowTopLeftPosition = CGPointMake(eventOrigin.x, eventOrigin.y);
    todoListWindowController = [[TodoListWindowController alloc] initWithData:[self fetchAll]];
    todoListWindowController.delegate = self;
    [todoListWindowController.window setFrameTopLeftPoint:windowTopLeftPosition];
   
    
    [todoListWindowController.window makeKeyAndOrderFront:self];
    

    [todoListWindowController.window performSelector:@selector(makeFirstResponder:) withObject:todoListWindowController.todoView.textField];
    
    
    
    [NSApp activateIgnoringOtherApps:YES];
    
    

}

-(NSArray*) fetchAll {
    

    NSLog(@"FETCH IT");
    
    NSFetchRequest * fetchRequestGroup = [[NSFetchRequest alloc] init];
    [fetchRequestGroup setEntity:[NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedObjectContext]];
    
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"dateTask" ascending:NO];
    [fetchRequestGroup setSortDescriptors:[NSArray arrayWithObject:sortByName]];
    
    NSError *error = nil;
    NSArray * group = [managedObjectContext executeFetchRequest:fetchRequestGroup error:&error];

    //NSLog(@"%@", [group debugDescription]);
    
    return group;
}


- (void)mouseDown:(NSEvent *)theEvent {
    NSLog(@"mdddd");
}

- (void) addTask:(NSString *)title {
    Task* task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:managedObjectContext];
    
    if(title.length > 25)
        title = [title substringToIndex:25];
    

    
    [task setNameTask:[NSString stringWithFormat:@" %@", title]];
    [task setDateTask:[NSDate date]];
    [task setIdTask:[NSNumber numberWithInt:arc4random()]];
    
    NSError *error = nil;
    [managedObjectContext save:&error];
    if (error != nil) {
        NSLog(@"Core data error");
    }
    else {
        NSLog(@"ok j'ai saved");
        [todoListWindowController setDataTask:[self fetchAll]];
        [todoListWindowController.todoView.todoTableView reloadData];
        [todoListWindowController.todoView.todoTableView scrollRowToVisible:0];
    }
    

}


- (void) clearTask {
    
    NSFetchRequest * fetchRequestGroup = [[NSFetchRequest alloc] init];
    [fetchRequestGroup setEntity:[NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedObjectContext]];
    [fetchRequestGroup setIncludesPropertyValues:NO];
    NSError * error = nil;
    NSArray * group = [managedObjectContext executeFetchRequest:fetchRequestGroup error:&error];
    
    [group enumerateObjectsUsingBlock:^(id singleGroup, NSUInteger idx, BOOL *stop) {
        [managedObjectContext deleteObject:singleGroup];
    }];
    
}


- (void) removeTask:(Task *)task {
    
    NSFetchRequest * fetchRequestGroup = [[NSFetchRequest alloc] init];
    [fetchRequestGroup setEntity:[NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedObjectContext]];
    [fetchRequestGroup setIncludesPropertyValues:NO];
    NSError * error = nil;
    NSArray * group = [managedObjectContext executeFetchRequest:fetchRequestGroup error:&error];
    
    [group enumerateObjectsUsingBlock:^(id singleGroup, NSUInteger idx, BOOL *stop) {
        Task* taskCast = (Task*) singleGroup;
        if([taskCast.idTask isEqualTo:task.idTask])
            [managedObjectContext deleteObject:singleGroup];
    }];
    
    [todoListWindowController setDataTask:[self fetchAll]];
    [todoListWindowController.todoView.todoTableView reloadData];
    
}

@end
