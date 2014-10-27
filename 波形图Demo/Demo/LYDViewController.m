//
//  LYDViewController.m
//  Demo
//
//  Created by Dong on 14-3-17.
//  Copyright (c) 2014年 CNTV. All rights reserved.
//

#import "LYDViewController.h"
#import "LYDwaveform.h"
#import "SFCurveView.h"
#import "SFStrokeView.h"

@interface LYDViewController ()
{
    LYDwaveform *view;

    NSTimer *timer;

    UIButton *open;

    BOOL  on_off;
    
    SFCurveView *curveView;
    SFStrokeView *strokeView;
}

@end

@implementation LYDViewController

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

//    view = [[LYDwaveform alloc] initWithFrame:CGRectMake(50, 200, 220, 80)];
//    view.backgroundColor = [UIColor redColor];
//    view.clipsToBounds = YES;
//    [self.view addSubview:view];
    
//    curveView = [[SFCurveView alloc] initWithFrame:CGRectMake(10, 170, 300, 70)];
//    curveView.backgroundColor = [UIColor greenColor];
//    curveView.clipsToBounds = YES;
//    [self.view addSubview:curveView];

    strokeView = [[SFStrokeView alloc] initWithFrame:CGRectMake(10, 170, 247, 70)];
    strokeView.backgroundColor = [UIColor grayColor];
    strokeView.clipsToBounds = YES;
    [self.view addSubview:strokeView];
    

    //设置定时检测
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(detectionVoice) userInfo:nil repeats:YES];
    open = [UIButton buttonWithType:UIButtonTypeCustom];
    open.frame = CGRectMake(140, 350, 40, 20);
    [open setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [open setTitle:@"暂停" forState:UIControlStateNormal];
    [open addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:open];
}

- (void)backButton
{
    if (on_off) {

        [open setTitle:@"暂停" forState:UIControlStateNormal];
        //开启定时器
        [timer setFireDate:[NSDate distantPast]];
    }else {

        [open setTitle:@"开始" forState:UIControlStateNormal];
        //关闭定时器
        [timer setFireDate:[NSDate distantFuture]];
    }

    on_off = !on_off;

}

- (void)detectionVoice
{

//    [view callDraw:1];
    
//    curveView.start = YES;
    
    strokeView.start = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
