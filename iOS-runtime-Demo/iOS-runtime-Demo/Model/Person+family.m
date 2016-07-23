//
//  Person+family.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/23.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "Person+family.h"
#import <objc/message.h>

static const char *kFatherNameKey = "kFatherNameKey";
static const char *kFatherAgeKey = "kFatherAgeKey";

@implementation Person (family)

- (void)setFatherName:(NSString *)fatherName {
    objc_setAssociatedObject(self, kFatherNameKey, fatherName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)fatherName {
    return objc_getAssociatedObject(self, kFatherNameKey);
}

- (void)setFatherAge:(int)fatherAge {
    objc_setAssociatedObject(self, kFatherAgeKey, @(fatherAge), OBJC_ASSOCIATION_ASSIGN);
}

- (int)fatherAge {
    return [objc_getAssociatedObject(self, kFatherAgeKey) intValue];
}

/**
 * 下面的两个宏可以替换上面的方法, 让你动态添加属性更简单
 * 注意：
 * YYSYNTH_DYNAMIC_PROPERTY_OBJECT 是用来添加对象属性的,
 * YYSYNTH_DYNAMIC_PROPERTY_CTYPE 是用来添加int等assign类型属性的
 */
YYSYNTH_DYNAMIC_PROPERTY_OBJECT(motherName, setMotherName, RETAIN_NONATOMIC, NSString *)
YYSYNTH_DYNAMIC_PROPERTY_CTYPE(motherAge, setMotherAge, int)

@end
