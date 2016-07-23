//
//  SeventhViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/23.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "SeventhViewController.h"
#import "Person+family.h"

@interface SeventhViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) Person *person;

@end

@implementation SeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.person = [[Person alloc] init];
}

- (IBAction)buttonClickAction:(id)sender {
    self.person.fatherName = @"LiLei"; // 父亲的名字
    self.person.motherName = @"HanMeimei"; // 母亲的名字
    self.person.fatherAge = 46; // 父亲的年龄
    self.person.motherAge = 45; // 母亲的年龄
    
    self.label.text = [NSString stringWithFormat:@"父亲的名字: %@\n母亲的名字: %@\n父亲的年龄: %d\n母亲的年龄: %d", self.person.fatherName, self.person.motherName, self.person.fatherAge, self.person.motherAge];
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
