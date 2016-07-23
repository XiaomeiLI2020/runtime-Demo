//
//  SixthViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "SixthViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface SixthViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.editable = NO;
}

// 字典转model
- (IBAction)dictToModel:(id)sender {
    self.dataArray = [NSMutableArray array];
    
    NSArray *array = @[@{@"name": @"leaon",
                         @"sex": @"man",
                         @"age": @(23)},
                       @{@"name": @"liang",
                         @"sex": @"nan",
                         @"age": @(24)}];
    
    for (NSDictionary *dict in array) {
        Person *person = [Person modelWithDictionary:dict];
        NSLog(@"\n{name: %@, sex: %@, age: %zd}", person.name, person.sex, person.age);
        [self.dataArray addObject:person];
    }
    NSLog(@"dataArray : (%@)", self.dataArray);
    
    self.textView.text = @"由json转model: \n\
                            Json 如下: \n\
                            [ \n\
                                { \n\
                                    \"name\": \"leaon\", \n\
                                    \"sex\": \"man\", \n\
                                    \"age\": 23 \n\
                                }, \n\
                                { \n\
                                    \"name\": \"liang\", \n\
                                    \"sex\": \"nan\", \n\
                                    \"age\": 24 \n\
                                } \n\
                            ] \n\
                            转换成功";
}

// 归档
- (IBAction)archiveAction:(id)sender {
    Person *person = [[Person alloc] init];
    person.name = @"Leo";
    person.sex = @"男";
    person.age = 24;
    
    // model写入文件
    BOOL result = [NSKeyedArchiver archiveRootObject:person toFile:filePath()];
    if (result) {
        NSLog(@"写入成功");
        self.textView.text = @"归档成功, 数据如下: \nperson.name = \"Leo\"\nperson.sex = \"男\"\nperson.age = 24";
    }
}

// 解档
- (IBAction)unarchiveAction:(id)sender {
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath()];
    NSLog(@"\n{name: %@, sex: %@, age: %zd}", person.name, person.sex, person.age);
    
    if (person) {
        self.textView.text = [NSString stringWithFormat:@"解档成功\nPerson: \n{name: %@, sex: %@, age: %zd}", person.name, person.sex, person.age];
    } else {
        self.textView.text = @"本地没有数据, 请先归档存入数据";
    }
}

NSString *filePath() {
    NSString *document  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [document stringByAppendingString:@"/person.txt"];
    return filePath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
