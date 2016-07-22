//
//  ForthViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "FourthViewController.h"
#import <objc/message.h>
#import "Person.h"
#import "Tool.h"

@interface FourthViewController ()

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) Tool *tool;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person = [[Person alloc] init];
    self.tool = [[Tool alloc] init];
    
    Method method1 = class_getInstanceMethod([Person class], @selector(personMethod));
    Method method2 = class_getInstanceMethod([Tool class], @selector(toolMethod));
    
    method_exchangeImplementations(method1, method2);
}

- (IBAction)personMethodAction:(id)sender {
    self.label.text = [self.person personMethod];
}

- (IBAction)toolMethodAction:(id)sender {
    self.label.text = [self.tool toolMethod];
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
