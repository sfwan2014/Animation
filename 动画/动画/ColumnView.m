//
//  ColumnView.m
//  动画
//
//  Created by 吴闽 on 13-12-16.
//  Copyright (c) 2013年 吴闽. All rights reserved.
//

#import "ColumnView.h"
#import "UIView+ITTAdditions.h"
@implementation ColumnView
{
    UIImageView *imgView1;
    UIImageView *imgView2;
    CGPoint lastPoint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    imgView1 = [[UIImageView alloc]initWithFrame:CGRectZero];
    imgView1.backgroundColor = [UIColor orangeColor];
    [self addSubview:imgView1];
    
    imgView2 = [[UIImageView alloc]initWithFrame:CGRectZero];
    imgView2.image = [UIImage imageNamed:@"edu_point_yellow"];
    [self addSubview:imgView2];
}




static int num = 1;
- (void)setColumnHeight:(NSInteger)columnHeight
{
    if (_columnHeight != columnHeight) {
        _columnHeight = columnHeight;
       
        [self performSelector:@selector(animation) withObject:nil afterDelay:num];
    }
    num ++ ;
}

- (void)animation
{

    [UIView animateWithDuration:0.5 animations:^{
        imgView1.top = 200-_columnHeight;
        imgView2.bottom = imgView1.top;
    } completion:^(BOOL finished) {

    }];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    imgView1.frame = CGRectMake(5, self.superview.height+_columnHeight, 5, _columnHeight);
    imgView2.frame = CGRectMake(0, imgView1.top-16, 16, 16);
    
    
}

@end
