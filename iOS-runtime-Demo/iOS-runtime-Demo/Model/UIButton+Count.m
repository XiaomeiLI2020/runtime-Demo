//
//  UIButton+Count.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "UIButton+Count.h"
#import "Tool.h"

@implementation UIButton (Count)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass = [self class];
        /**
         * UIControl 的方法
         * - (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event;
         */

        SEL originSEL = @selector(sendAction:to:forEvent:);
        Method originMethod = class_getInstanceMethod(selfClass, originSEL);
        
        SEL totalSEL = @selector(totalSendAction:to:forEvent:);
        Method totalMethod = class_getInstanceMethod(selfClass, totalSEL);
        // 添加新的方法
        BOOL addMethodResult = class_addMethod(selfClass, originSEL, method_getImplementation(totalMethod), method_getTypeEncoding(totalMethod));
        if (addMethodResult) {
            class_replaceMethod(selfClass, totalSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, totalMethod);
        }
    });
}

- (void)totalSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [Tool shareInstance].count += 1;
    [self totalSendAction:action to:target forEvent:event];
}

@end
