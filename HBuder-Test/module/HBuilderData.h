//
//  HBuilderData.h
//  HBuder-Test
//
//  Created by kangwen on 6/17/16.
//  Copyright © 2016 Night. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "FMDB.h"

@interface HBuilderData : NSObject

+(HBuilderData *) instance;

-(void)initDataBase;
-(void)createTable;
- (void)createTableTeacher;
- (void)insterStudent:(Student*)student;
- (NSMutableArray*)getAllStudent;
- (void)deleteStudent:(Student*)student;
- (void)updateStudent:(Student*)student;
- (NSMutableArray*)getStudents:(NSString *)name;
- (Student *)getStudent:(NSString*)name;
@end
