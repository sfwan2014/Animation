//
//  SFCurveView.m
//  Demo
//
//  Created by shaofa on 14-3-24.
//  Copyright (c) 2014年 CNTV. All rights reserved.
//

#import "SFCurveView.h"
#define kLineHight1  100
#define kLineHight2  100
#define kLineWidth  22

@implementation SFCurveView
{
    float _x;
    float _xx;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _x = 0;
        _xx = 0;
    }
    return self;
}

-(void)setStart:(BOOL)start
{
    _start = start;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    
//    CGContextSaveGState(context);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextSetLineWidth(context, 2.0);
    CGPoint endPoint = CGPointZero;
    CGPoint startPoint = [self startPoint1];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    for (int i = 0; i < 4; i++) {
        CGPoint curvePoint1 = [self curvePoint:startPoint];
        CGPoint curvePoint2 = [self curvePoint:curvePoint1];
        endPoint = [self endPoint1:i+1];
        startPoint = endPoint;
        CGContextAddCurveToPoint(context, curvePoint1.x, curvePoint1.y, curvePoint2.x, curvePoint2.y, endPoint.x, endPoint.y);
    }
//    CGContextStrokePath(context);
//    CGContextRestoreGState(context);
    
    startPoint = [self startPoint:endPoint.x];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    for (int i = 0; i < 4; i++) {
        CGPoint curvePoint1 = [self curvePoint:startPoint];
        CGPoint curvePoint2 = [self curvePoint:curvePoint1];
        endPoint = [self endPoint:i+1];
        startPoint = endPoint;
        CGContextAddCurveToPoint(context, curvePoint1.x, curvePoint1.y, curvePoint2.x, curvePoint2.y, endPoint.x, endPoint.y);
    }
    CGContextStrokePath(context);
}

-(CGPoint)startPoint:(float)x
{
    CGPoint point = CGPointZero;

    if (x < self.frame.size.width/2) {
        _x = x;
    }
    if (_x > self.frame.size.width) {
        _x = 0;
    }
    
    point = CGPointMake(_x, self.frame.size.height/2);
    _x++;
    return point;
}

-(CGPoint)endPoint:(int)index
{
    CGPoint point = CGPointZero;
    
    point = CGPointMake(_x + index * self.frame.size.width/3, self.frame.size.height/2);
    return point;
}

-(CGPoint)startPoint1
{
    CGPoint point = CGPointZero;
    
    if (_xx > 0) {
        _xx = -self.frame.size.width;
    }
    
    point = CGPointMake(_xx, self.frame.size.height/2);
    _xx++;
    return point;
}

-(CGPoint)endPoint1:(int)index
{
    CGPoint point = CGPointZero;
    
    point = CGPointMake(_xx + index * self.frame.size.width/3, self.frame.size.height/2);
    return point;
}

-(CGPoint)curvePoint:(CGPoint)p
{
    static int byt = 1;
    
    CGPoint point = CGPointZero;
    
    point.x = p.x + kLineWidth;
    
    float height = [self lineHeight];
    if (byt == 1) {
        point.y = self.frame.size.height/2 + height;
    } else {
        point.y = self.frame.size.height/2 - height;
    }
    
    byt ^= 1;
    
    return point;
}

-(CGFloat)lineHeight
{
    CGFloat height = 0;
    
    static int bt = 1;
    if (bt == 1) {
        height = kLineHight1;
    } else {
        height = kLineHight2;
    }
    
    bt ^= 1;
    
    return height;
}


@end
