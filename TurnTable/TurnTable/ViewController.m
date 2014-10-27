//
//  ViewController.m
//  TurnTable
//
//  Created by changjian on 13-12-16.
//  Copyright (c) 2013年 changjian. All rights reserved.
//

#import "ViewController.h"
#import "TurntableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    TurntableView *turn = [[TurntableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    turn.center = self.view.center;
    turn.backgroundColor = [UIColor clearColor];
    turn.x1 = 10;
    turn.x2 = 70;
    [self.view addSubview:turn];
    
//    TurntableView *turn1 = [[TurntableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    turn1.center = self.view.center;
//    turn1.backgroundColor = [UIColor clearColor];
//    turn1.x1 = 70;
//    turn1.x2 = 120;
//    [self.view addSubview:turn1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
