//
//  NSObject+DicToModel.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DicToModelDelegate <NSObject>

@optional

/// 用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (DicToModel)

/// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
