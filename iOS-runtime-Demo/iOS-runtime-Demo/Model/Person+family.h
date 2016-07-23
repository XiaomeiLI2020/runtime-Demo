//
//  Person+family.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/23.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "Person.h"

@interface Person (family)

@property (nonatomic, strong) NSString *fatherName;
@property (nonatomic, strong) NSString *motherName;
@property (nonatomic, assign) int fatherAge;
@property (nonatomic, assign) int motherAge;

@end
