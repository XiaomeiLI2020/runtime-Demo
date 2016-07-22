//
//  Person.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+DicToModel.h"
#import "NSObject+Archive.h"

@interface Person : NSObject <DicToModelDelegate, NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, assign) int age;

- (NSString *)personMethod;
- (NSString *)helloiOS;
- (NSString *)helloPython;

@end
