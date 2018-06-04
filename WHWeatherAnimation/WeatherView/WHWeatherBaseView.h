//
//  WHWeatherBaseView.h
//  SiShi
//
//  Created by whbalzac on 13/10/2017.
//  Copyright © 2017 whbalzac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define widthPix kScreenWidth/320
#define heightPix kScreenHeight/568

//sun
#define kMaxWhiteCloudCount  11
#define kRotationAnimationTimes  80
#define kOffsetXAnimationTimes  100
#define kOffsetXScreenCount  3

@interface WHWeatherBaseView : UIView

@property (nonatomic, strong) NSMutableArray <UIView *> *cloudArray;

-(void)startAnimation;
-(void)stopAnimation;

//云
-(void)addCloud:(BOOL)isRain rainCount:(NSInteger)rainCount onView:(UIView *)view;
//云 动画
- (CAAnimationGroup *)cloudAnimationWithFromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue duration:(NSInteger)duration;
//动画横向移动方法
- (CABasicAnimation *)birdFlyAnimationWithToValue:(NSNumber *)toValue duration:(NSInteger)duration autoreverses:(BOOL)autoreverses;
//动画旋转方法
- (CABasicAnimation *)sunshineAnimationWithDuration:(NSInteger)duration;
//下雨动画方法
- (CABasicAnimation *)rainAnimationWithDuration:(NSInteger)duration;
//透明度动画
- (CABasicAnimation *)rainAlphaWithDuration:(NSInteger)duration;
@end
