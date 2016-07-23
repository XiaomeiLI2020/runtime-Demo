//
//  Person.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

PIN_INIT_WITH_CODER()

PIN_ENCODE_WITH_CODER()

- (NSString *)personMethod {
    return @"person Method";
}

- (NSString *)helloiOS {
    return @"hello iOS";
}

- (NSString *)helloPython {
    return @"hello Python";
}

@end
