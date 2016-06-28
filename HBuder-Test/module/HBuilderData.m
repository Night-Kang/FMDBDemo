//
//  HBuilderData.m
//  HBuder-Test
//
//  Created by kangwen on 6/17/16.
//  Copyright © 2016 Night. All rights reserved.
//

#import "HBuilderData.h"



@implementation HBuilderData {
    FMDatabase * dataBase;
    FMDatabaseQueue * fmdbQueue;
}

static HBuilderData * hbuilderData = nil;

+ (HBuilderData*) instance {
    if (!hbuilderData) {
        hbuilderData = [[HBuilderData alloc]init];
    }
    return hbuilderData;
}

/*
 *  新建一个数据库
 */
- (void)initDataBase{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingString:@"/HbuilderTest.db"];
    NSLog(@"--dbPaht:%@", dbPath);
    dataBase = [FMDatabase databaseWithPath:dbPath];
    fmdbQueue = [[FMDatabaseQueue alloc] initWithPath:dbPath];
}

/**
 * 创建库中的表
 */
- (void)createTable{
    if (![dataBase open]) {
        NSLog(@"数据库打开失败！");
    } else{
        [dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS HbuilderTest (rowid INTEGER PRIMARY KEY AUTOINCREMENT, name text, age test, address test)"];
    }
    [dataBase close];
}

/**
 * 创建库中的表
 */
- (void)createTableTeacher{
    if (![dataBase open]) {
        NSLog(@"数据库打开失败！");
    } else{
        [dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS Teacher (rowid INTEGER PRIMARY KEY AUTOINCREMENT, name text, age test, address test)"];
    }
    [dataBase close];
}

/**
 * 插入数据，分多线程
 */
- (void)insterStudent:(Student*)student {
    [dataBase open];
    [dataBase executeUpdate:@"INSERT INTO HbuilderTest (name, age, address) VALUES (?,?,?)", student.name, student.age, student.address];
    [dataBase close];
}

/**
 * 多线程插入数据
 */
- (void)insterStudentMultithreading:(Student *)student {
    [fmdbQueue inDatabase:^(FMDatabase *db) {
        [db open];
        [db executeUpdate:@"UPDATE HbuilderTest SET age= ? WHERE name = ?",student.age, student.name];
        [db close];
    }];
}

/**
 * 删除数据
 */
- (void)deleteStudent:(Student*)student {
    [dataBase open];
    [dataBase executeUpdate:@"DELETE FROM HbuilderTest WHERE name = ?", student.name];
    [dataBase close];
}

/**
 *  修改数据
 */
- (void)updateStudent:(Student*)student {
    [dataBase open];
    [dataBase executeUpdate:@"UPDATE HbuilderTest SET age = ? WHERE name = ?", student.age, student.name];
    [dataBase close];
}

/**
 * 查全部数据
 */
- (NSMutableArray*)getAllStudent {
    [dataBase open];
    FMResultSet *result = [dataBase executeQuery:@"SELECT * FROM HbuilderTest"];
    NSMutableArray * studentArray = [[NSMutableArray alloc]init];
    while ([result next]) {
        Student *model = [Student createStudent:[result stringForColumn:@"name"] age:[result stringForColumn:@"age"] address:[result stringForColumn:@"address"]];
        [studentArray addObject:model];
    }
    [dataBase close];
    return studentArray;
}

/**
 * 查询同类型的数据
 */

- (NSMutableArray*)getStudents:(NSString *)name {

    [dataBase open];
    FMResultSet *result = [dataBase executeQuery:@"SELECT * FROM HbuilderTest WHERE name = ?", name];
    NSMutableArray * studentArray = [[NSMutableArray alloc]init];
    while ([result next]) {
        Student * model = [Student createStudent:[result stringForColumn:@"name"] age:[result stringForColumn:@"age"] address:[result stringForColumn:@"address"]];
        [studentArray addObject:model];
    }
    [dataBase close];
    return studentArray;
}

/**
 *  查询单个数据
 *  不知道是查到的第一个还是最后啊 233333333
 */
- (Student *)getStudent:(NSString*)name {
    [dataBase open];
    FMResultSet *result = [dataBase executeQuery:@"SELECT * FROM HbuilderTest WHERE name = ?", name];
    Student *student;
    while ([result next]) {
        student = [Student createStudent:[result stringForColumn:@"name"] age:[result stringForColumn:@"age"] address:[result stringForColumn:@"address"]];
    }
    [dataBase close];
    return student;
}
@end
