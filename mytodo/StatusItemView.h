//
//  StatusItemView.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusItemView : NSView

@property (nonatomic, retain) NSStatusItem *statusItem;
@property (nonatomic, retain) NSImage *imageDefault;

@property (nonatomic, unsafe_unretained) id target;
@property (nonatomic) SEL action;

- (id)initWithStatusItem:(NSStatusItem *)statusItemParam;

@end
