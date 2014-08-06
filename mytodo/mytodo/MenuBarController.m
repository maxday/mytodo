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
    NSLog(@"coucou");
}


@end
