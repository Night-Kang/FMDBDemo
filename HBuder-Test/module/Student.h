//
//  Student.h
//  HBuder-Test
//
//  Created by kangwen on 6/17/16.
//  Copyright © 2016 Night. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * age;
@property(nonatomic, copy) NSString * address;

+(Student*)createStudent:(NSString*)name age:(NSString*)age address:(NSString*)address;

@end
