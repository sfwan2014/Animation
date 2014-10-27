//
//  CustomButton.m
//  ParticleButton
//
//  Created by FYZH on 14-2-22.
//  Copyright (c) 2014年 Liang HaiHu. All rights reserved.
//

#import "CustomButton.h"
#import "EmitterView.h"
#import "ZZEmitterView.h"
@implementation CustomButton
{
    CAEmitterLayer *fireEmitter; //1
    EmitterView *emitterView;
    EmitterView *emitter;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"CustomButton");
        
        self.backgroundColor = [UIColor blackColor];
        [self setTitle:@"Button" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        emitterView = [[EmitterView alloc] initWithFrame:CGRectZero];
        emitterView.color = [UIColor purpleColor];
        
        emitter = [[EmitterView alloc] initWithFrame:CGRectZero];
        emitter.color = [UIColor whiteColor];
        emitter.startPoint = CGPointMake(0, 60);
        
        [self addSubview:emitterView];
        [self addSubview:emitter];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect
{
    //绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.repeatCount = MAXFLOAT;
    animation.path = path;
    [emitterView.layer addAnimation:animation forKey:@"test"];
    
    animation.duration = 6;
    [emitter.layer addAnimation:animation forKey:@"test1"];
}


@end
