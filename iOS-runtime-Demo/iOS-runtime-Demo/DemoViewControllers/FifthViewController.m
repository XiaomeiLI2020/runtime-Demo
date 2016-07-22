//
//  FifthViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "FifthViewController.h"
#import <objc/message.h>
#import "UIButton+Count.h"
#import "Tool.h"

@interface FifthViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClickAction:(id)sender {
    NSLog(@"tool count : %zd", [[Tool shareInstance] count]);
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
