//
//  NSUserDefaults+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import "NSUserDefaults+MyCa.h"

NSString *const kKeyFontScale = @"kKeyFontScale";

@implementation NSUserDefaults (MyCa)
- (CGFloat)getFontScale {
    float scale =  [[NSUserDefaults standardUserDefaults] floatForKey:kKeyFontScale];
    return scale > 0 ? scale : 1;
}
@end
