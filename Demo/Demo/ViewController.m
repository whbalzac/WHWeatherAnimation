//
//  ViewController.m
//  Demo
//
//  Created by whbalzac on 04/06/2018.
//  Copyright © 2018 whbalzac. All rights reserved.
//

#import "ViewController.h"
#import "WHWeatherView.h"
#import "WHWeatherHeader.h"

@interface ViewController ()
@property (nonatomic, strong) WHWeatherView *weatherView;
@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureView];
}

- (void)configureView
{
    self.weatherView.weatherBackImageView.frame = self.view.bounds;
    [self.view addSubview:self.weatherView.weatherBackImageView];
    
    //content view
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = 24;
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attrs = @{ NSFontAttributeName : [UIFont systemFontOfSize:14],
                             NSForegroundColorAttributeName : [UIColor whiteColor],
                             NSParagraphStyleAttributeName : style};
    
    NSString *text = @"春江花月夜\n[唐] 张若虚\n春江潮水连海平，海上明月共潮生。\n滟滟随波千万里，何处春江无月明！\n江流宛转绕芳甸，月照花林皆似霰。\n空里流霜不觉飞，汀上白沙看不见。\n江天一色无纤尘，皎皎空中孤月轮。\n江畔何人初见月？江月何年初照人？\n人生代代无穷已，江月年年望相似。\n不知江月待何人，但见长江送流水。\n白云一片去悠悠，青枫浦上不胜愁。\n谁家今夜扁舟子？何处相思明月楼？\n可怜楼上月徘徊，应照离人妆镜台。\n玉户帘中卷不去，捣衣砧上拂还来。\n此时相望不相闻，愿逐月华流照君。\n鸿雁长飞光不度，鱼龙潜跃水成文。\n昨夜闲潭梦落花，可怜春半不还家。\n江水流春去欲尽，江潭落月复西斜。\n斜月沉沉藏海雾，碣石潇湘无限路。\n不知乘月几人归，落月摇情满江树。";
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attrs];
    label.center = self.view.center;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    //
    
    self.weatherView.frame = self.view.bounds;
    [self.view addSubview:self.weatherView];
    
    
    //tool views
    UIButton *button0 = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetHeight(self.view.frame)-40, 60, 30)];
    [button0 setTitle:@"Sun" forState:UIControlStateNormal];
    [button0 setTitleColor:UIColorFromRGBA(255, 255, 255, 0.6) forState:UIControlStateNormal];
    button0.titleLabel.font = [UIFont systemFontOfSize:14];
    button0.layer.borderColor = UIColorFromRGBA(255, 255, 255, 0.6).CGColor;
    button0.layer.borderWidth = 0.5;
    [button0 addTarget:self action:@selector(sunAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(20+70, CGRectGetHeight(self.view.frame)-40, 60, 30)];
    [button1 setTitle:@"Cloud" forState:UIControlStateNormal];
    [button1 setTitleColor:UIColorFromRGBA(255, 255, 255, 0.6) forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:14];
    button1.layer.borderColor = UIColorFromRGBA(255, 255, 255, 0.6).CGColor;
    button1.layer.borderWidth = 0.5;
    [button1 addTarget:self action:@selector(cloundAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(20+70+70, CGRectGetHeight(self.view.frame)-40, 60, 30)];
    [button2 setTitle:@"Rain" forState:UIControlStateNormal];
    [button2 setTitleColor:UIColorFromRGBA(255, 255, 255, 0.6) forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:14];
    button2.layer.borderColor = UIColorFromRGBA(255, 255, 255, 0.6).CGColor;
    button2.layer.borderWidth = 0.5;
    [button2 addTarget:self action:@selector(rainAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(20+70+70+70, CGRectGetHeight(self.view.frame)-40, 60, 30)];
    [button3 setTitle:@"Thunder" forState:UIControlStateNormal];
    [button3 setTitleColor:UIColorFromRGBA(255, 255, 255, 0.6) forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:14];
    button3.layer.borderColor = UIColorFromRGBA(255, 255, 255, 0.6).CGColor;
    button3.layer.borderWidth = 0.5;
    [button3 addTarget:self action:@selector(rainlightingAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(20+70+70+70+70, CGRectGetHeight(self.view.frame)-40, 60, 30)];
    [button4 setTitle:@"Snow" forState:UIControlStateNormal];
    [button4 setTitleColor:UIColorFromRGBA(255, 255, 255, 0.6) forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:14];
    button4.layer.borderColor = UIColorFromRGBA(255, 255, 255, 0.6).CGColor;
    button4.layer.borderWidth = 0.5;
    [button4 addTarget:self action:@selector(snowAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
}

#pragma mark -
#pragma mark - Button Action

- (void)sunAnimation
{
    [self.weatherView showWeatherAnimationWithType:WHWeatherTypeSun];
}

- (void)cloundAnimation
{
    [self.weatherView showWeatherAnimationWithType:WHWeatherTypeClound];
}

- (void)rainAnimation
{
    [self.weatherView showWeatherAnimationWithType:WHWeatherTypeRain];
}

- (void)rainlightingAnimation
{
    [self.weatherView showWeatherAnimationWithType:WHWeatherTypeRainLighting];
}

- (void)snowAnimation
{
    [self.weatherView showWeatherAnimationWithType:WHWeatherTypeSnow];
}

#pragma mark -
#pragma mark - Getter

- (WHWeatherView *)weatherView {
    if (!_weatherView) {
        _weatherView = [[WHWeatherView alloc] init];
    }
    return _weatherView;
}

@end
