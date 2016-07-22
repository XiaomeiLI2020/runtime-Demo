//
//  SecondViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface SecondViewController ()

@property (nonatomic, strong) Person *person;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person = [[Person alloc] init];
}

- (IBAction)buttonClickAction:(id)sender {
    class_addMethod([self.person class], @selector(sayHello), (IMP)hello, "v@:");
    if ([self.person respondsToSelector:@selector(sayHello)]) {
        [self.person performSelector:@selector(sayHello)];
        self.label.text = @"hello";
        NSLog(@"为Person类添加sayHello方法成功, Person类创建的其它对象也可以调用sayHello方法");
        
//        Person *person = [[Person alloc] init];
//        if ([person respondsToSelector:@selector(sayHello)]) {
//            NSLog(@"balabala.....");
//            [person performSelector:@selector(sayHello)];
//        }
    }
}

void hello(id self, SEL _cmd) {
    NSLog(@"hello");
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
