//
//  ViewController.m
//  CircleProgressView
//
//  Created by changjian on 13-12-13.
//  Copyright (c) 2013年 changjian. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CircleProgressView *progress;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    progress = [[CircleProgressView alloc] initWithFrame:CGRectMake(110, 190, 100, 100)];
    [self.view addSubview:progress];
    progress.backgroundColor = [UIColor yellowColor];
    progress.trackColor = [UIColor grayColor];
    progress.progressColor = [UIColor orangeColor];
    progress.progress = 0;
    progress.progressWidth = 10;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(70, 40, 80, 30);
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(buttonAction) userInfo:Nil repeats:YES];
}

-(void)buttonAction
{
    
    
    static float proces = 0;
    [progress setProgress1:proces animated:YES];
    proces += 0.01;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
