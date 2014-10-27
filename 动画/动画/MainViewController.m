//
//  MainViewController.m
//  动画
//
//  Created by 吴闽 on 13-12-16.
//  Copyright (c) 2013年 吴闽. All rights reserved.
//

#import "MainViewController.h"
#import "ColumnView.h"
@interface MainViewController ()
{
    UIView *bgView;
    NSArray *array;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    array = @[@50,@70,@60,@40,@90];
    [self initViews];
    [self performSelector:@selector(intiUIOfView) withObject:nil afterDelay:3];
    
}

- (void)initViews

{
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, 400, 200)];
    bgView.clipsToBounds = YES;
    [self.view addSubview:bgView];

    bgView.backgroundColor = [UIColor grayColor];
    for (int i=0; i<5; i++) {
        ColumnView *column = [[ColumnView alloc]initWithFrame:CGRectMake(100+i*(5+20), 0, 16, 0)];
        column.columnHeight = [array[i] integerValue];
        [bgView addSubview:column];
    }
    
}

-(void)intiUIOfView
{
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    CGPoint point;
    CGPoint nextPoint;
    for (int i=0; i<array.count+1; i++) {
        if (i<4) {
            
            point = CGPointMake(100+i*(5+20)+5, 200-[array[i] integerValue]-8);
            nextPoint = CGPointMake(100+(i+1)*(5+20)+5, 200-[array[i+1] integerValue]-8);
            
            [path moveToPoint:point];   //设置起点

            [path addLineToPoint:nextPoint];   //添加线条
        }
    }
   CAShapeLayer *arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.fillColor=[UIColor colorWithRed:46.0/255.0 green:169.0/255.0 blue:230.0/255.0 alpha:1].CGColor;
    arcLayer.strokeColor=[UIColor colorWithWhite:1 alpha:0.7].CGColor;
    arcLayer.lineWidth=2;
    arcLayer.lineDashPattern = @[@4, @2];  //先画4个再空2个
    arcLayer.frame=self.view.frame;
    [bgView.layer addSublayer:arcLayer];
    [self drawLineAnimation:arcLayer];
}

-(void)drawLineAnimation:(CALayer*)layer
{
    
    
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=3.5;
    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer addAnimation:bas forKey:@"key"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
