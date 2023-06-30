//
//  NSObject+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import "NSObject+MyCa.h"
#import <objc/runtime.h>

@implementation NSObject (MyCa)
/**
 @brief 方法替换
 @param originSelector 替换的原方法
 @param swizzleSelector 替换后的方法
 @param isClassMethod 是否为类方法，YES为类方法，NO为对象方法
 */
+ (void)runtimeReplaceFunctionWithSelector:(SEL)originSelector
                           swizzleSelector:(SEL)swizzleSelector
                             isClassMethod:(BOOL)isClassMethod
{
    Method originMethod;
    Method swizzleMethod;
    if (isClassMethod == YES) {
        originMethod = class_getClassMethod([self class], originSelector);
        swizzleMethod = class_getClassMethod([self class], swizzleSelector);
    }else{
        originMethod = class_getInstanceMethod([self class], originSelector);
        swizzleMethod = class_getInstanceMethod([self class], swizzleSelector);
    }
    method_exchangeImplementations(originMethod, swizzleMethod);
}
@end
