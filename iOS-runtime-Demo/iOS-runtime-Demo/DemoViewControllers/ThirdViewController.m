//
//  ThirdViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "ThirdViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface ThirdViewController ()

@property (nonatomic, strong) Person *person;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person = [[Person alloc] init];
    NSLog(@"%@", [_person helloiOS]);
    NSLog(@"%@", [_person helloPython]);
    
    Method method1 = class_getInstanceMethod([self.person class], @selector(helloiOS));
    Method method2 = class_getInstanceMethod([self.person class], @selector(helloPython));
    method_exchangeImplementations(method1, method2);
}

- (IBAction)helloiOS:(id)sender {
    self.label.text = [self.person helloiOS];
}

- (IBAction)helloPython:(id)sender {
    self.label.text = [self.person helloPython];
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
