//
//  NSObject+Json.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/23.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "NSObject+Json.h"
#import <objc/message.h>

@implementation NSObject (Json)

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    /// 创建对应模型对象
    id objc = [[self alloc] init];
    unsigned int count = 0;
    /// 1. 获取成员属性数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    /// 2. 遍历所有的成员属性名, 一个一个去字典中取出对应的value给模型属性赋值
    for (int i = 0; i < count; i ++) {
        // 2.1 获取成员属性
        Ivar ivar = ivarList[i];
        // 2.2 获取成员属性名 C -> OC 字符串
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 2.3 _成员属性名 => 字典key（去掉下划线_）
        NSString *key = [ivarName substringFromIndex:1];
        // 2.4 去字典中取出对应value给模型属性赋值
        id value = dictionary[key];
        // 获取成员属性类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        // 二级转换, 字典中还有字典, 也需要把对应字典转换成模型
        // 判断下value, 是不是字典(是字典对象, 并且属性名对应类型是自定义类型)
        if ([value isKindOfClass:[NSDictionary class]]/* && ![ivarType containsString:@"NS"]*/) {
            // 处理类型字符串 @\"User\" -> User
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            // 自定义对象, 并且值是字典
            // value: user字典 -> User模型
            // 后去模型(user)类对象
            Class modelClass = NSClassFromString(ivarType);
            // 字典转模型
            if (modelClass) {
                // 字典转模型 user
                value = [modelClass modelWithDictionary:value];
            }
        }
        
        // 三级转换: NSArray中也是字典, 把数组中的字典转换成模型.
        // 判断值是否是数组
        if ([value isKindOfClass:[NSArray class]]) {
            // 判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
                // 转换成id类型, 就能调用任何对象的方法
                id idSelf = self;
                // 获取数组中字典对应的模型
                NSString *type = [idSelf arrayContainModelClass][key];
                // 生成模型
                Class classModel = NSClassFromString(type);
                NSMutableArray *array = [NSMutableArray array];
                // 遍历字典数组, 生成模型数组
                for (NSDictionary *dict in value) {
                    id model = [classModel modelWithDictionary:dict];
                    [array addObject:model];
                }
                // 把模型数组赋值给value
                value = array;
            }
        }
        
        // 2.5 KVC 字典转模型
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
