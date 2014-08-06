//
//  Task.h
//  mytodo
//
//  Created by maxday on 2014-08-05.
//  Copyright (c) 2014 MaximeDavid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * idTask;
@property (nonatomic, retain) NSString * nameTask;
@property (nonatomic, retain) NSDate * dateTask;

@end
