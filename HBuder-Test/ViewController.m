//
//  ViewController.m
//  HBuder-Test
//
//  Created by kangwen on 6/16/16.
//  Copyright © 2016 Night. All rights reserved.
//

#import "ViewController.h"
#import "HBuilderData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSUserDefaults
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
//    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    if (userDefaults) {
        [userDefaults setObject:@"hello world" forKey:@"test"];
//        NSLog(@"---Night---%@", [userDefaults objectForKey:@"test"]);
//        NSLog(@"-----defaults---:%@", defaults);
    }
    
//    NSMutableArray * student =  [[HBuilderData instance] getAllStudent];
//    NSLog(@"--all-student:%@", student);
//    [[HBuilderData instance] insterStudent:[self setStudent]];
//    NSMutableArray * student1 =  [[HBuilderData instance]getStudents:@"zhangsan3"];
//    NSMutableArray * student2 =  [[HBuilderData instance]getStudents:@"zhangsan"];
//    NSLog(@"--find-student:%@\%@", student1, student2);
//    [[HBuilderData instance]updateStudent:[self setStudent1]];
//    [[HBuilderData instance]insterStudent:[self setStudent3]];
    Student *singleStudent = [[HBuilderData instance]getStudent:@"zhangsan3"];
    NSLog(@"--find-single :%@", singleStudent);
//    [[HBuilderData instance]deleteStudent:[self setStudent1]];
//    NSMutableArray * student4 =  [[HBuilderData instance] getAllStudent];
//    NSLog(@"---all-- :%@", student4);
//
}

- (Student*)setStudent{
    Student * student = [Student createStudent:@"zhangsan" age:@"18" address:@"good street"];
    return student;
}
- (Student*)setStudent1{
    Student * student = [Student createStudent:@"zhangsan" age:@"183" address:@"good street"];
    return student;
}
- (Student*)setStudent3{
    Student * student = [Student createStudent:@"zhangsan3" age:@"183" address:@"good street"];
    return student;
}



@end
