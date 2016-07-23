//
//  NSObject+Json.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/23.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JsonDelegate <NSObject>

@optional
/// 用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (Json)

/// 字典转模型
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end
