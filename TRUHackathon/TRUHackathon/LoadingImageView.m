//
//  LoadingImageView.m
//  TRUHackathon
//
//  Created by Samat on 18.03.17.
//  Copyright © 2017 Samat. All rights reserved.
//

#import "LoadingImageView.h"

@implementation LoadingImageView

- (instancetype)init {
    if ([super init]) {

    }
    
    return self;
}

- (void)show {
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    
    UIScreen *screen = [UIScreen mainScreen];
    
    int imageSize = 50;
    
    self.frame = CGRectMake(screen.bounds.size.width/2-imageSize/2, screen.bounds.size.height/2-imageSize/2, imageSize, imageSize);
    //image designed today :)
    self.image = [UIImage imageNamed:@"loader"];
    
    [self rotate];
    
    [currentWindow addSubview:self];
}

//got it from here - http://stackoverflow.com/questions/9844925/uiview-infinite-360-degree-rotation-animation
- (void)rotate {
    BOOL repeat = YES;
    CGFloat duration = 15;
    CGFloat rotations = 1;
    
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)hide {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
