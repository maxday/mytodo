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

@interface TodoListWindowController () <NSTextFieldDelegate>

@end

@implementation TodoListWindowController
@synthesize todoView;
@synthesize dataTask;


- (id)initWithData:(NSArray*) data {
    self = [super init];
    if (self) {
        
        //register for lost focus notification
        [self setupWindowForEvents];
        
        //setup the data
        self.dataTask = data;
        
        //main window
        NSRect frame = NSMakeRect(0, 0, POPUP_WIDTH, POPUP_HEIGHT);
        NSUInteger styleMask =  NSBorderlessWindowMask;
        NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];
        CustomWindow * window =  [[CustomWindow alloc] initWithContentRect:rect styleMask:styleMask backing: NSBackingStoreBuffered defer:false];
        [window setBackgroundColor:[NSColor whiteColor]];
        self.window = window;
        [self.window setOpaque:NO];
        [self.window setBackgroundColor:[NSColor colorWithCalibratedWhite:WHITE_CALIBRATE alpha:ALPHA]];
        
        //main view
        todoView = [[View alloc] initWithFrame:CGRectMake(0, 0, POPUP_WIDTH, POPUP_HEIGHT)];
        
        //set the delegates
        todoView.textField.delegate = self;
        todoView.todoTableView.delegate = self;
        todoView.todoTableView.dataSource = self;
        self.window.delegate = self;
        
        //instanciate and store colors (for borders)
        self.colorArray = [NSArray arrayWithObjects:
            [NSColor colorWithCalibratedRed:26./255 green:188./255 blue:156./255 alpha:1],
            [NSColor colorWithCalibratedRed:231./255 green:76./255 blue:60./255 alpha:1],
            [NSColor colorWithCalibratedRed:52./255 green:74./255 blue:94./255 alpha:1],
            [NSColor colorWithCalibratedRed:52./255 green:152./255 blue:219./255 alpha:1],
            [NSColor colorWithCalibratedRed:241./255 green:196./255 blue:15./255 alpha:1],
            nil];

        self.window.contentView = todoView;
    }
    return self;
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataTask count];
}

- (CGFloat) tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return TASK_BOX_HEIGHT;
}

- (TableCellView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    TableCellView *result = [tableView makeViewWithIdentifier:@"MyView" owner:self];
    
    if (result == nil) {
        result = [[TableCellView alloc] initWithFrame:CGRectMake(0, (TASK_BOX_HEIGHT-TASK_HEIGHT)/2, POPUP_WIDTH, TASK_HEIGHT)];
        result.identifier = @"MyView";
    }
    
    result.tf.stringValue = [[dataTask objectAtIndex:row] nameTask];
    [result.borderLeft changeColor:[self.colorArray objectAtIndex:row%5]];
    
    return result;
}


- (void)windowDidLoad {
    [super windowDidLoad];
}



- (void)setupWindowForEvents{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResignKey:) name:NSWindowDidResignMainNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResignKey:) name:NSWindowDidResignKeyNotification object:self];
}

-(void)windowDidResignKey:(NSNotification *)note {
    [self close];
}




-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    [self.delegate removeTask:[dataTask objectAtIndex:row]];
    return NO;
}


-(void)controlTextDidEndEditing:(NSNotification *)notification{
    if ( [[[notification userInfo] objectForKey:@"NSTextMovement"] intValue] == NSReturnTextMovement && ![todoView.textField.stringValue isEqualTo:@""]) {
        [self.delegate addTask:todoView.textField.stringValue];
        [todoView.textField setStringValue:@""];
    }
}

@end
