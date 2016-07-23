//
//  RuntimeDefine.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/23.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * * * * * * * * * * * * 序列化、反序列化 * * * * * * * * * * * *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/// 注意：编码操作要遵守<NSCoding>协议
/**
 * 编码
 */
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

/**
 * 解码
 */
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

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * * * * * * * * * * * * 动态添加属性 * * * * * * * * * * * * * *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#ifndef YYSYNTH_DYNAMIC_PROPERTY_OBJECT
#define YYSYNTH_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_)object { \
    [self willChangeValueForKey:@#_getter_]; \
    objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_ ## _association_); \
    [self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
    return objc_getAssociatedObject(self, @selector(_setter_:)); \
}
#endif

#ifndef YYSYNTH_DYNAMIC_PROPERTY_CTYPE
#define YYSYNTH_DYNAMIC_PROPERTY_CTYPE(_getter_, _setter_, _type_) \
- (void)_setter_ : (_type_)object { \
    [self willChangeValueForKey:@#_getter_]; \
    NSValue *value = [NSValue value:&object withObjCType:@encode(_type_)]; \
    objc_setAssociatedObject(self, _cmd, value, OBJC_ASSOCIATION_RETAIN); \
    [self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
    _type_ cValue = { 0 }; \
    NSValue *value = objc_getAssociatedObject(self, @selector(_setter_:)); \
    [value getValue:&cValue]; \
    return cValue; \
}
#endif
