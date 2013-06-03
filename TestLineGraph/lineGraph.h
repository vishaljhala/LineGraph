//
//  wormGraph.h
//  Graph
//
//  Created by Vishalsinh Jhala on 5/29/13.
//  Copyright (c) 2013 Infostretch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lineGraph : UIView
{
    int *m_Worm;
    int m_MaxWormSize;
    int m_iCurrWormSize;
    UIColor *m_wormColor;
    NSString *graphName;
    int desiredLevel;
}

-(void)pushPoint:(int)y;
-(void)setWormColor:(int)r :(int)g :(int)b;
- (id)initWithFrame:(CGRect)frame  : (int) MaxWormSize;
@property(readwrite,nonatomic) int desiredLevel;
@end
