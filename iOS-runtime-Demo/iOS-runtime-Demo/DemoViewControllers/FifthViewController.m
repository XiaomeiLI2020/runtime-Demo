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
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.editable = NO;
    
    [self.button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClickAction:(id)sender {
    NSLog(@"tool count : %zd", [Tool shareInstance].count);
    
    self.textView.text = [NSString stringWithFormat:@"[Tool shareInstance].count=%zd\n\n\n这个方法里面并没有对[Tool shareInstance].count进行改动, 但是可以看到count的值一直在改变, 是因为在UIButton+Count这个文件中对方法进行了处理, 请查看UIButton+Count文件", [Tool shareInstance].count];
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
