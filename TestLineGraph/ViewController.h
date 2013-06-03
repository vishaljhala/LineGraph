//
//  ViewController.h
//  
//
//  Created by Vishalsinh Jhala on 6/3/13.
//  Copyright (c) 2013 Infostretch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lineGraph.h"

@interface ViewController : UIViewController
{
    lineGraph *graph;
    NSTimer* timer;
    int iWormHgt;
}

@end
