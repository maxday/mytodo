//
//  CustomTextField.m
//  mytodo
//
//  Created by maxday on 2014-08-06.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

-(void)drawBorder:(NSRect)rect{
    //  NSRect rect = [self bounds];
    NSRect frameRect = [self bounds];
    if(rect.size.height < frameRect.size.height)
        return;
    NSRect newRect = NSMakeRect(rect.origin.x+2, rect.origin.y+2, rect.size.width-3, rect.size.height-3);
    
    NSBezierPath *textViewSurround = [NSBezierPath bezierPathWithRoundedRect:newRect xRadius:10 yRadius:10];
    [textViewSurround setLineWidth:2];
  
    [textViewSurround stroke];
}

@end
