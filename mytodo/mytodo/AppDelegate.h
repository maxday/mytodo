//
//  AppDelegate.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "MenuBarController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) MenuBarController *menuBarController;

@end
