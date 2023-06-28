//
//  ViewController.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/5/29.
//

#import "ViewController.h"
#import "SecVcOcXib.h"
@import Masonry;

@interface ViewController ()
@property (nonatomic,assign) double fontSizeMulti;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //code lbl
    UILabel *lbl = [[UILabel alloc] init];
    [self.view addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
        make.centerX.equalTo(self.view.mas_centerX);
    }];

    lbl.font = [UIFont systemFontOfSize:16];
    lbl.text = @"code lbl";
    
    //code button
    UIButton *jumpBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:jumpBtn];
    [jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(100 + 50 + 30));
        make.height.equalTo(@50);
        make.width.equalTo(@100);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [jumpBtn setTitle:@"code button,点击跳转" forState:UIControlStateNormal];
    jumpBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    jumpBtn.titleLabel.numberOfLines = 0;
    [jumpBtn addTarget:self action:@selector(jumpBtnDC:) forControlEvents:UIControlEventTouchUpInside];
    
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jumpBtn.mas_bottom).offset(30.0);
        make.width.equalTo(@100);
        make.height.equalTo(@44);
        make.centerX.equalTo(jumpBtn.mas_centerX);
    }];
    
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:(UIControlEventValueChanged)];
    
    //save btn
    UIButton *saveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(slider.mas_bottom).offset(20);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [saveBtn setTitle:@"save button,点击切换app内字体比例" forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    saveBtn.titleLabel.numberOfLines = 0;
    [saveBtn addTarget:self action:@selector(saveBtnDC:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)jumpBtnDC:(UIButton *)btn {
    SecVcOcXib *secVc = [[SecVcOcXib alloc] init];
    [self.navigationController pushViewController:secVc animated:YES];
}

- (void)sliderValueChanged:(UISlider *)slider {
     self.fontSizeMulti = slider.value + 0.5;
}

- (void)saveBtnDC:(UIButton *)btn {
    ViewController *newHomeVC = [[ViewController alloc] init];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:newHomeVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = navVc;
}



@end
