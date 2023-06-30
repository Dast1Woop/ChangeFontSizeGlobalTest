//
//  NSUserDefaults+MyCa.h
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const kKeyFontScale;

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (MyCa)
- (CGFloat)getFontScale;
@end

NS_ASSUME_NONNULL_END
