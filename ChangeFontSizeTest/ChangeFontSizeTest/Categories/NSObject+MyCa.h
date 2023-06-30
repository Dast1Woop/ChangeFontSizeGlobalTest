//
//  NSObject+MyCa.h
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MyCa)
+ (void)runtimeReplaceFunctionWithSelector:(SEL)originSelector
                           swizzleSelector:(SEL)swizzleSelector
                             isClassMethod:(BOOL)isClassMethod;
@end

NS_ASSUME_NONNULL_END
