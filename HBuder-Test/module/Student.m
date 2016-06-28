//
//  Student.m
//  HBuder-Test
//
//  Created by kangwen on 6/17/16.
//  Copyright © 2016 Night. All rights reserved.
//

#import "Student.h"

@implementation Student

+(Student*)createStudent:(NSString*)name age:(NSString *)age address:(NSString *)address{
    Student * model = [[Student alloc]init];
    model.name = name;
    model.age = age;
    model.address = address;
    return model;
}
@end
