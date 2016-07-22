//
//  NSObject+Archive.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

#ifndef PIN_ENCODE_WITH_CODER
#define PIN_ENCODE_WITH_CODER() \
\
- (void)encodeWithCoder:(NSCoder *)encoder { \
    unsigned int count = 0; \
    Ivar *ivars = class_copyIvarList([self class], &count); \
    for (int i = 0; i < count; i ++) { \
        Ivar ivar = ivars[i]; \
        const char *name = ivar_getName(ivar); \
        NSString *key = [NSString stringWithUTF8String:name]; \
        id value = [self valueForKey:key]; \
        [encoder encodeObject:value forKey:key]; \
    } \
    free(ivars); \
} 
#endif

#ifndef PIN_INIT_WITH_CODER
#define PIN_INIT_WITH_CODER() \
\
- (id)initWithCoder:(NSCoder *)decoder { \
    if (self = [super init]) { \
        unsigned int count = 0; \
        Ivar *ivars = class_copyIvarList([self class], &count); \
        for (int i = 0; i<count; i++) { \
            Ivar ivar = ivars[i]; \
            const char *name = ivar_getName(ivar); \
            NSString *key = [NSString stringWithUTF8String:name]; \
            id value = [decoder decodeObjectForKey:key]; \
            [self setValue:value forKey:key]; \
        } \
        free(ivars); \
    } \
    return self; \
}
#endif

@interface NSObject (Archive)

@end
