//
//  SecVcOcXib.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/6/28.
//
#import "ChangeFontSizeTest-Swift.h"
#import "SecVcOcXib.h"

@interface SecVcOcXib ()

@end

@implementation SecVcOcXib

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"secVC";
}

- (IBAction)xibBtnDC:(UIButton *)sender {
    ThirdVcSwiftXib *thirdVC = [[ThirdVcSwiftXib alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}


@end
