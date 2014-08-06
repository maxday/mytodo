//
//  TableCellView.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CustomBackgroundView.h"

@interface TableCellView : NSTableRowView

@property(nonatomic, retain) NSTextField* tf;
@property(nonatomic, retain) CustomBackgroundView* borderLeft;

@end
