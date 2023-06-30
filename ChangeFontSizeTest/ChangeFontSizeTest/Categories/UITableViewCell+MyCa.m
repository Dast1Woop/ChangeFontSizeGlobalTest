//
//  UITableViewCell+MyCa.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/30.
//

#import "UITableViewCell+MyCa.h"
#import "Aspects.h"
#import "UIFont+MyCa.h"
#import "NSUserDefaults+MyCa.h"

@implementation UITableViewCell (MyCa)
+(void)load {
 
    //修改自带 textLabel 文字大小
    [[self class] aspect_hookSelector:@selector(initWithStyle:reuseIdentifier:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        
        UITableViewCell *cell = [aspectInfo instance];

        UIFont *crtFont = cell.textLabel.font;
        UIFont *newFont = [UIFont fontWithName:crtFont.fontName size: crtFont.pointSize * [[NSUserDefaults standardUserDefaults] getFontScale]];
//        NSLog(@"cell hook: ----------------");
//        NSLog(@"cell hook: old Font:%@", crtFont);

        cell.textLabel.font = newFont;
//        NSLog(@"cell hook: new font:%@", newFont);
    } error:nil];
    
    //修改xib自定义文本大小：todo
}
@end
