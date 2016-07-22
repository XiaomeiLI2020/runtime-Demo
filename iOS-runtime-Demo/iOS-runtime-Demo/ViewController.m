//
//  ViewController.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "ViewController.h"

static NSString *const kFirstVCID = @"kFirstVCID";
static NSString *const kSecondVCID = @"kSecondVCID";
static NSString *const kThirdVCID = @"kThirdVCID";
static NSString *const kFourthVCID = @"kFourthVCID";
static NSString *const kFifthVCID = @"kFifthVCID";
static NSString *const kSixthVCID = @"kSixthVCID";
static NSString *const kSeventhVCID = @"kSeventhVCID";

static NSString *const reUse = @"reUse";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"View Controller";

    self.dataArray = @[@"动态变量控制",
                       @"动态添加方法",
                       @"动态交换两个方法的实现",
                       @"拦截并替换方法",
                       @"在方法上增加额外功能",
                       @"归档和解档 及 字典转模型"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUse];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController;
    if (indexPath.row == 0) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kFirstVCID];
    } else if (indexPath.row == 1) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kSecondVCID];
    } else if (indexPath.row == 2) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kThirdVCID];
    } else if (indexPath.row == 3) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kFourthVCID];
    } else if (indexPath.row == 4) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kFifthVCID];
    } else if (indexPath.row == 5) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kSixthVCID];
    } else if (indexPath.row == 6) {
        viewController = [storyboard instantiateViewControllerWithIdentifier:kSeventhVCID];
    }
    viewController.title = self.dataArray[indexPath.row];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
