//
//  FirstViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "FirstViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface FirstViewController ()

@property (nonatomic, strong) Person *person;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person = [[Person alloc] init];
    self.person.name = @"史泰龙";
    NSLog(@"person name is (%@)", self.person.name);
    self.nameLabel.text = [NSString stringWithFormat:@"名字: %@", self.person.name];
}

- (IBAction)buttonClickAction:(id)sender {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self.person class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *propertyName = [NSString stringWithUTF8String:ivarName];
        // 这里不要忘了属性加下划线
        if ([propertyName isEqualToString:@"_name"]) {
            object_setIvar(self.person, ivar, @"洛奇");
            break;
        }
    }
    NSLog(@"史泰龙改名叫 (%@)", self.person.name);
    self.nameLabel.text = [NSString stringWithFormat:@"名字: %@", self.person.name];
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
