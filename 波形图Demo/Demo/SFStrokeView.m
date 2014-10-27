//
//  SFStrokeView.m
//  Demo
//
//  Created by shaofa on 14-3-25.
//  Copyright (c) 2014年 CNTV. All rights reserved.
//

#import "SFStrokeView.h"
#define k  1.6
#define originalY self.frame.size.height/2
#define kWidth      self.frame.size.width
#define kHeight     30

@implementation SFStrokeView
{
    float _x;
    float _y;
    
    float _xx;
    float _yy;
    
    NSMutableArray *_pointArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _pointArray = [[NSMutableArray alloc] init];
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
    CGContextSetLineWidth(context, 1.5);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);

    CGPoint startPoint = [self startPoint];
    CGPoint endPoint = CGPointZero;
    
    _x = _x +1;
    if (_x == 200) {
        _x = 00;
    }
    for (int i = [self index]; i <= _x + [self top]; i++) {
        float x = i;
        float y = (originalY - sinf(k * i / M_PI) * kHeight);
        endPoint = CGPointMake(x, y);
        [_pointArray addObject:[NSValue valueWithCGPoint:endPoint]];
    }
    
    CGPoint point[_pointArray.count];
    for (int i = 0; i < _pointArray.count; i++) {
        
        NSValue *pointValue = _pointArray[i];
        point[i].x = [pointValue CGPointValue].x;
        point[i].y = [pointValue CGPointValue].y;
        
    }
    
    CGContextMoveToPoint(context, 0, startPoint.y);
    CGContextAddLineToPoint(context, point[0].x, startPoint.y);
    CGContextAddLineToPoint(context, point[0].x, point[0].y);
    CGContextStrokePath(context);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context , kCGLineCapRound);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextBeginPath(context);
    CGContextAddLines(context, point, _pointArray.count);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, endPoint.x, endPoint.y);
    CGContextAddLineToPoint(context, endPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, kWidth, startPoint.y);
    CGContextStrokePath(context);
    
    [_pointArray removeAllObjects];
}

-(void)test
{
//    CGContextStrokePath(context);
//    CGContextRestoreGState(context);
//
//    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
//    for (int i = _xx; i <= kWidth; i++) {
//        float x = i;
//
//        float y = (originalY - sinf(k * i / M_PI) * kHeight);
//
//        endPoint = CGPointMake(x, y);
//        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
//        startPoint = endPoint;
//    }
}

-(CGPoint)startPoint
{
    return CGPointMake(_xx, originalY);
}

-(int)top
{
    int m = rand()%2;
    if (m == 1) {
        return 150;
    } else {
        return 150;
    }
}

-(float)index
{
    _xx++;
    
    if (_xx == 200) {
        _xx = 0;
    }
    
    return _xx;
}

@end
