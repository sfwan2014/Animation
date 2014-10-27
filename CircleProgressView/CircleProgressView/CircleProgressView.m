//
//  CircleProgressView.m
//  CircleProgressView
//
//  Created by changjian on 13-12-13.
//  Copyright (c) 2013年 changjian. All rights reserved.
//

#import "CircleProgressView.h"

@implementation CircleProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _trackLayer = [CAShapeLayer new];
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = nil;
        _trackLayer.frame = self.layer.bounds;
        
        _progressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.frame = self.layer.bounds;
        
        self.progressWidth = 5;
    }
    return self;
}

-(void)setTrack
{
    _trackPath = [UIBezierPath bezierPathWithArcCenter:self.layCenter radius:(self.bounds.size.width-_progressWidth)/2 startAngle:0 endAngle:M_PI *2 clockwise:YES];
    _trackLayer.path = _trackPath.CGPath;
    
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    act.center = [self layCenter];
    [self addSubview:act];
    
    [act startAnimating];
}

-(CGPoint)layCenter
{
    CGPoint center = _trackLayer.frame.origin;
    center.x += _trackLayer.frame.size.width/2;
    center.y += _trackLayer.frame.size.height/2;
    
    return center;
}

-(void)setProgress
{
    _progressPath = [UIBezierPath bezierPathWithArcCenter:self.layCenter radius:(self.bounds.size.width-_progressWidth)/2 startAngle:-M_PI_2 endAngle:(M_PI * 2)*_progress-M_PI_2 clockwise:YES];
    _progressLayer.path = _progressPath.CGPath;
}

-(void)setProgressWidth:(float)progressWidth
{
    _progressWidth = progressWidth;
    _trackLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
    [self setTrack];
    [self setProgress];
}

-(void)setTrackColor:(UIColor *)trackColor
{
    _trackLayer.strokeColor = trackColor.CGColor;
}

-(void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
}

-(void)setProgress:(float)progress
{
    _progress = progress;
    [self setProgress];
}

-(void)setProgress1:(float)progress animated:(BOOL)animated
{
    _progress = progress;
    [self setProgress];
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=4;
    bas.speed = .1;
    bas.delegate=self;
//    bas.fromValue=[NSNumber numberWithInteger:0];
//    bas.toValue=[NSNumber numberWithInteger:1];
    [_progressLayer addAnimation:bas forKey:@"key"];
}

@end
