//
//  NSUserDefaults+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import "NSUserDefaults+MyCa.h"
@import UIKit;

//NSString *const kKeyFontScale = @"kKeyFontScale";

@implementation NSUserDefaults (MyCa)
- (CGFloat)getFontScale {
//    float scale =  [[NSUserDefaults standardUserDefaults] floatForKey:kKeyFontScale];
    int category =  [self getUserFontContentSizeCategory];
    
    //0~1.0,1~1.5,2~2.0:x/2.0 + 1.0
    int temp0 = (category - 1)/4;
    double temp1 = temp0 *1.0/2.0;
    CGFloat scale = temp1 + 1.0;
    return scale;
}

- (int)getUserFontContentSizeCategory{
    UIContentSizeCategory cat = [[UIApplication sharedApplication] preferredContentSizeCategory];
    NSLog(@"preferredContentSizeCategory:%@", cat);
    if ([cat isEqualToString:UIContentSizeCategoryExtraSmall]) {
        NSLog(@"preferredContentSizeCategory1");
        return 1;
    }else if ([cat isEqualToString:UIContentSizeCategorySmall]) {
        NSLog(@"preferredContentSizeCategory2");
        return 2;
    }else if ([cat isEqualToString:UIContentSizeCategoryMedium]) {
        NSLog(@"preferredContentSizeCategory3");
        return 3;
    }else if ([cat isEqualToString:UIContentSizeCategoryLarge]) {
        NSLog(@"preferredContentSizeCategory4");
        return 4;
    }else if ([cat isEqualToString:UIContentSizeCategoryExtraLarge]) {
        NSLog(@"preferredContentSizeCategory5");
        return 5;
    }else if ([cat isEqualToString:UIContentSizeCategoryExtraExtraLarge]) {
        NSLog(@"preferredContentSizeCategory6");
        return 6;
    }else if ([cat isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge]){//+++Large
        NSLog(@"preferredContentSizeCategory7");
        return 7;
    }else if ([cat isEqualToString:UIContentSizeCategoryAccessibilityMedium]){
        NSLog(@"preferredContentSizeCategory8");
        return 8;
    }if ([cat isEqualToString:UIContentSizeCategoryAccessibilityLarge]){
        NSLog(@"preferredContentSizeCategory9");
        return 9;
    }if ([cat isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge]){
        NSLog(@"preferredContentSizeCategory10");
        return 10;
    }if ([cat isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge]){
        NSLog(@"preferredContentSizeCategory11");
        return 11;
    }if ([cat isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]){
        NSLog(@"preferredContentSizeCategory12");
        return 12;
    }else{
        return 12;
    }
}

@end
