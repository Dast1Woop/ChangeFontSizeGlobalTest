//
//  ViewController.m
//  ChangeFontSizeTest
//
//  Created by LongMa on 2023/5/29.
//

@import Masonry;
#import "ViewController.h"
#import "SecVcOcXib.h"
#import "NSUserDefaults+MyCa.h"

@interface ViewController ()
@property (nonatomic,assign) float fontSizeScale;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页-OC-code";
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //code lbl
    UILabel *lbl = [[UILabel alloc] init];
    [self.view addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.height.lessThanOrEqualTo(@100);
        make.leading.equalTo(@10);
        make.centerX.equalTo(self.view.mas_centerX);
    }];

    lbl.font = [UIFont systemFontOfSize:16];
    lbl.text = @"code lbl-code lbl-code lbl-code lbl-code lbl-code lbl-code lbl-code lbl-code lbl-code lbl";
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.numberOfLines = 0;
    lbl.backgroundColor = [UIColor cyanColor];
    
    //code button
    UIButton *jumpBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:jumpBtn];
    [jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(100 + 50 + 230));
        make.height.lessThanOrEqualTo(jumpBtn.titleLabel.mas_height);
        make.leading.equalTo(@10);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [jumpBtn setTitle:@"code button,点击跳转-test-test-test-test-test-test" forState:UIControlStateNormal];
    jumpBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    jumpBtn.titleLabel.numberOfLines = 0;
    [jumpBtn addTarget:self action:@selector(jumpBtnDC:) forControlEvents:UIControlEventTouchUpInside];
    [jumpBtn setBackgroundColor:[UIColor greenColor]];
    
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jumpBtn.mas_bottom).offset(30.0);
        make.width.equalTo(@100);
        make.height.equalTo(@44);
        make.centerX.equalTo(jumpBtn.mas_centerX);
    }];
    
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:(UIControlEventValueChanged)];
    
    slider.value = [[NSUserDefaults standardUserDefaults] getFontScale] - 1;
    self.fontSizeScale = slider.value * 1 + 1;
    slider.hidden = YES;
    
    //save btn
    UIButton *saveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(slider.mas_bottom).offset(20);
        
        //高度约束使用具体数值时，多行时背景色会有问题，背景色和响应区域不会自动扩大！！！因此，根据场景，可以使用文本标签真实高度
        make.height.lessThanOrEqualTo(saveBtn.titleLabel.mas_height);
        make.leading.equalTo(@10);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    [saveBtn setTitle:@"save button,点击切换app内字体比例到滑块的值（1~2倍范围）" forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    saveBtn.titleLabel.numberOfLines = 0;
    [saveBtn addTarget:self action:@selector(saveBtnDC:) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn setBackgroundColor:[UIColor blueColor]];
}

- (void)jumpBtnDC:(UIButton *)btn {
    SecVcOcXib *secVc = [[SecVcOcXib alloc] init];
    [self.navigationController pushViewController:secVc animated:YES];
}

- (void)sliderValueChanged:(UISlider *)slider {
     self.fontSizeScale = slider.value * 1 + 1;
}

- (void)saveBtnDC:(UIButton *)btn {
//    [[NSUserDefaults standardUserDefaults] setFloat:self.fontSizeScale forKey:kKeyFontScale];
    
    ViewController *newHomeVC = [[ViewController alloc] init];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:newHomeVC];
    
    __block UIWindow *keyWindow;
    [[UIApplication sharedApplication].windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj.isKeyWindow) {
            keyWindow = obj;
            *stop = YES;
        }
    }];
    
    NSLog(@"keyWindow:%@", keyWindow);
    keyWindow.rootViewController = navVc;
}



@end
