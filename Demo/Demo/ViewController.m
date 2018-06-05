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
    NSDictionary *attrs = @{ NSFontAttributeName : [UIFont systemFontOfSize:16],
                             NSForegroundColorAttributeName : [UIColor whiteColor],
                             NSParagraphStyleAttributeName : style};
    
    NSString *text = @"枫桥夜泊\n[唐] 张继\n月落乌啼霜满天，江枫渔火对愁眠。\n姑苏城外寒山寺，夜半钟声到客船。";
    
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
