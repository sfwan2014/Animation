//
//  ZZEmitterView.m
//  ParticleButton
//
//  Created by shaofa on 14-4-5.
//  Copyright (c) 2014年 HaiHu Liang. All rights reserved.
//

#import "ZZEmitterView.h"

@implementation ZZEmitterView
{
    CAEmitterLayer *_emitterLayer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self _init];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self _init];
}

-(void)_init
{
    _emitterLayer = (CAEmitterLayer *)self.layer;
    // 渲染模式
//    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    // 发射模式
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    // 发射源形状
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.birthRate = 1.0;
    emitterCell.lifetime = 1.0;    //粒子生命时间
    emitterCell.lifetimeRange = 2;   //生命时间变化范围
    
    emitterCell.color = [[UIColor grayColor] CGColor];  //粒子颜色
    //fire.contents = (id)[[UIImage imageNamed:@"Particles_fire.png"] CGImage];
    emitterCell.contents = (id)[[UIImage imageNamed:@"snow1.png"] CGImage]; //cell内容，一般是一个CGImage
    emitterCell.velocity = 40;     //速度
    emitterCell.velocityRange = 1; //速度范围
    emitterCell.emissionRange = 2; //发射角度
    emitterCell.scaleSpeed = 0.2;  //变大速度
    emitterCell.spin = 3;        //旋转
    [emitterCell setName:@"fire"];  //cell名字，方便根据名字以后查找修改
    
    //add the cell to the layer and we're done
    _emitterLayer.emitterCells = [NSArray arrayWithObject:emitterCell];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
