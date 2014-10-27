//
//  TurntableView.m
//  TurnTable
//
//  Created by changjian on 13-12-16.
//  Copyright (c) 2013年 changjian. All rights reserved.
//

#import "TurntableView.h"

#define kRadius (self.frame.size.height > self.frame.size.width ? self.bounds.size.width/2 : self.bounds.size.height/2)

#define DISTANCE_POINT(p1,p2) sqrtf((p1.x - p2.x)*(p1.x - p2.x) + (p1.y-p2.y)*(p1.y-p2.y))

@implementation TurntableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self _initViews];
        self.x1 = 0;
        self.x2 = 100;
    }
    return self;
}

-(void)_initViews
{
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setNeedsDisplay) userInfo:Nil repeats:YES];
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    
    [self drawSectorFromX:100 x:180 context:context];
    
    [self drawSectorFromX:0 x:100 context:context];
    
    CGContextStrokePath(context);
}

-(void)drawSectorFromX:(float)x1 x:(float)x2 context:(CGContextRef)context
{
    
    CGPoint center = CGPointMake(self.bounds.origin.x+kRadius, self.bounds.origin.y+kRadius);
    CGPoint p = [self pointInCircle:x1];
    CGPoint p1 = [self pointInCircle:x2];
    CGPoint p0 = [self pointOncircle:center point1:p point2:p1];
    
    CGContextMoveToPoint(context, p.x, p.y);
    CGContextAddArcToPoint(context, p0.x, p0.y, p1.x, p1.y, 100);
    CGContextAddLineToPoint(context, center.x, center.y);
    CGContextAddLineToPoint(context, p.x, p.y);
    CGContextFillPath(context);
    CGContextEOFillPath(context);
//    CGContextClosePath(context);
}

// 两切线的直线方程式
// 两切线的焦点 即为点坐标
/*
 
 y = k1x + b1;   k2y = k1k2x + k2b1;
 y = k2x + b2;   k1y = k1k2x + k1b2;
 
 x = b1;
 y = b1k2+b2;
 
 y = b1;
 x = (b1-b2)/k2
 
 (k1-k2)x = b2-b1;
 x = -(b2-b1)/(k1-k2);
 
 (k2-k1)y=(k2b1-k1b2);
 y = (k2b1-k1b2)/(k2-k1);
 
 */

-(CGPoint)pointOncircle:(CGPoint)center point1:(CGPoint)point1 point2:(CGPoint)point2
{

    float x = 0;
    float y = 0;
    
    float k1 = (center.x - point1.x)/(center.y-point1.y);
    float b1 = (point1.y + point1.x * k1);
    
    float k2 = (center.x - point2.x)/(center.y-point2.y);
    float b2 = (point2.y + point2.x * k2);;
    
    x = -(b2-b1)/(k1-k2);
    y = (k2*b1-k1*b2)/(k2-k1);
    
    if (k1 == 0) {
        b1 = point1.y;
        y = b1;
        x = -(b1-b2)/k2;
    } else{
        
        if (point1.y - center.y == 0) {
            b1 = point1.x;
            x = b1;
            y = b1*k2+b2;
        }
    }
    
    if (k2 == 0) {
        b2 = point2.y;
        y = b2;
        x = -(b2-b1)/k1;
    } else{
        if (point2.y - center.y == 0) {
            b2 = point2.x;
            x = b2;
            y = b2*k1+b1;
        }
    }
    
//    NSLog(@"%f ,%f", b1, b2);
    
    CGPoint p = CGPointMake(x, y);

    return p;
}

-(CGPoint)pointInCircle:(float)x
{
//    (x - a)^2 + (y-b)^2 = kRadius * kRadius;
    
    CGPoint center = CGPointMake(self.bounds.origin.x+kRadius, self.bounds.origin.y+kRadius);
    float s = kRadius * kRadius - (x-center.x) * (x-center.x);
    
    if (x > 2*kRadius) {
        x = x - 2*kRadius;
    }
    
    float y = sqrtf(s)+center.y;
    
    CGPoint point = CGPointMake(x, y);

    return point;
}


@end




