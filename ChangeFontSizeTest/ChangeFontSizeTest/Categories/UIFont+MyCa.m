//
//  UIFont+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import "UIFont+MyCa.h"
#import <objc/runtime.h>
#import "NSObject+MyCa.h"
#import "NSUserDefaults+MyCa.h"

@implementation UIFont (MyCa)

+(void)load {
    [UIFont runtimeReplaceFunctionWithSelector:@selector(systemFontOfSize:) swizzleSelector:@selector(my_systemFontOfSize:) isClassMethod:YES];
    
    [UIFont runtimeReplaceFunctionWithSelector:@selector(boldSystemFontOfSize:) swizzleSelector:@selector(my_boldSystemFontOfSize:) isClassMethod:YES];
}


+ (void)my_systemFontOfSize:(CGFloat)size {
    CGFloat newSize = [self getScaledSize:size];
    return [self my_systemFontOfSize:newSize];
}

+ (void)my_boldSystemFontOfSize:(CGFloat)size {
    CGFloat newSize = [self getScaledSize:size];
    return [self my_boldSystemFontOfSize:newSize];
}

+ (CGFloat)getScaledSize:(CGFloat)size {
    return size * [[NSUserDefaults standardUserDefaults] getFontScale];
}
@end
