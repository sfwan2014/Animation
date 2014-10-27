//
//  CircleProgressView.h
//  CircleProgressView
//
//  Created by changjian on 13-12-13.
//  Copyright (c) 2013年 changjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView
{
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}
@property(nonatomic, strong)UIColor *trackColor;
@property(nonatomic, strong)UIColor *progressColor;

@property(nonatomic, assign)float progress; // 大于0 小于1
@property(nonatomic, assign)float progressWidth;

-(void)setProgress1:(float)progress animated:(BOOL)animated;

@end
