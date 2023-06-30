//
//  UILabel+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/29.
//

#import "UILabel+MyCa.h"
#import "Aspects.h"
#import "NSObject+MyCa.h"
#import "UIFont+MyCa.h"
#import "NSUserDefaults+MyCa.h"

@implementation UILabel (MyCa)
+(void)load {
    [[self class] aspect_hookSelector:@selector(initWithCoder:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        UILabel *lbl = [aspectInfo instance];
        UIFont *crtFont = lbl.font;
        UIFont *newFont = [UIFont fontWithName:crtFont.fontName size: crtFont.pointSize * [[NSUserDefaults standardUserDefaults] getFontScale]];
        lbl.font = newFont;
        
    } error:nil];

}



@end
