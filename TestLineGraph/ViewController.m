//
//  ViewController.m
//  
//
//  Created by Vishalsinh Jhala on 6/3/13.
//  Copyright (c) 2013 Infostretch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    iWormHgt = 0;
    // graph related
    graph = [[lineGraph alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)  :120];
    [self.view addSubview:graph];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(increaseTimerCount) userInfo:nil repeats:YES];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)increaseTimerCount
{
    [graph pushPoint:iWormHgt];
    
    //NSLog(@"%d",iWormHgt);
    iWormHgt++;
    if(iWormHgt>=100)
        iWormHgt=0;
}

@end
