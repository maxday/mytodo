//
//  MenuBarController.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusItemView.h"
#import "TodoListWindowController.h"

@interface MenuBarController : NSObject <AddTaskDelegate>

@property (nonatomic, retain) StatusItemView* statusItemView;

@property (nonatomic, retain) TodoListWindowController* todoListWindowController;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readwrite) BOOL isOpen;

@end
