//
//  UITextField+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import "UITextField+MyCa.h"
#import "Aspects.h"
#import "UIFont+MyCa.h"
#import "NSUserDefaults+MyCa.h"

@implementation UITextField (MyCa)

+(void)load {
    NSError *err = nil;
    [[self class] aspect_hookSelector:@selector(initWithCoder:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        
        UITextField *tf = [aspectInfo instance];

        UIFont *crtFont = tf.font;
        UIFont *newFont = [UIFont fontWithName:crtFont.fontName size: crtFont.pointSize * [[NSUserDefaults standardUserDefaults] getFontScale]];
//        NSLog(@"tf hook: old Font:%@", crtFont);

        tf.font = newFont;
//        NSLog(@"tf hook: new font:%@", newFont);
    } error:&err];
    
    if(err) {
           NSLog(@"hook error:%@", err.localizedDescription);
       }
}
@end
