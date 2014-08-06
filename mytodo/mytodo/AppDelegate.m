//
//  AppDelegate.m
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize menuBarController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
       self.menuBarController = [[MenuBarController alloc] init];
}

@end
