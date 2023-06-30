//
//  SecVcOcXib.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/28.
//
#import "ChangeFontSizeTest-Swift.h"
#import "SecVcOcXib.h"
@import Masonry;

@interface SecVcOcXib ()
@property (weak, nonatomic) IBOutlet UIButton *btnDefault;

@end

@implementation SecVcOcXib

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"secVC-OC-xib";

    self.btnDefault.titleLabel.numberOfLines = 0;
    
    //更新高度：使用 titleLabel.mas_height 可行！！！不更新则背景色和相应区域不会随着文字放大而自动扩大。
    [self.btnDefault mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.btnDefault.titleLabel.mas_height);
    }];
}

- (IBAction)xibBtnDC:(UIButton *)sender {
    ThirdVcSwiftXib *thirdVC = [[ThirdVcSwiftXib alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}


@end
