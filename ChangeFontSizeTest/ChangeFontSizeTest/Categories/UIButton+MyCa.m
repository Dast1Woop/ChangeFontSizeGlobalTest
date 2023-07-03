//
//  UIButton+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/7/3.
//

#import "UIButton+MyCa.h"
#import "Aspects.h"
#import "UIFont+MyCa.h"
#import "NSUserDefaults+MyCa.h"

@implementation UIButton (MyCa)
+(void)load {
    NSError *err = nil;
    
    /**
     注意：
     1.xib上的按钮不能使用style：plain类型，必须使用default 类型。
     2.title选项必须用plain！
     否则下面方法不生效。
     不建议hook awakeFromNib,因测试发现对 uitextfield 无效！
     */
    [[self class] aspect_hookSelector:@selector(initWithCoder:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {

        UIButton *btn = [aspectInfo instance];
        UIFont *crtFont = btn.titleLabel.font;
        UIFont *newFont = [UIFont fontWithName:crtFont.fontName size: [[NSUserDefaults standardUserDefaults] getFontScale] * crtFont.pointSize];
//        NSLog(@"btn hook: old Font:%@", crtFont);

        btn.titleLabel.font = newFont;
//        NSLog(@"btn hook: new font:%@", newFont);
    } error:&err];
    
    if(err) {
           NSLog(@"hook error:%@", err.localizedDescription);
       }
}
@end

