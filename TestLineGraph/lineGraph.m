//
//  wormGraph.m
//  Graph
//
//  Created by Vishalsinh Jhala on 5/29/13.
//  Copyright (c) 2013 Infostretch. All rights reserved.
//

#import "lineGraph.h"

@implementation lineGraph
@synthesize desiredLevel;
- (id)initWithFrame:(CGRect)frame  : (int) MaxWormSize
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.frame = frame;
        if(m_Worm)
            free(m_Worm);
        m_MaxWormSize = MaxWormSize;
        m_iCurrWormSize = 0;
        
        m_Worm = malloc(sizeof(int)*m_MaxWormSize);

        m_wormColor = [[UIColor alloc ] initWithRed:255 green:255 blue:0 alpha:1];

    }
    return self;
}
-(void)pushPoint:(int)y
{
    if(y<0)
        y=0;
    if(y>100)
        y=100;
    if(m_iCurrWormSize<m_MaxWormSize)
    {
        //m_Worm[m_iCurrWormSize].x =  pnt.x;
        m_Worm[m_iCurrWormSize] = 100 - y;
        m_iCurrWormSize++;
    }
    else{
        for(int i=1;i<m_MaxWormSize;i++)
        {
            //m_Worm[i-1] = m_Worm[i].x;
            m_Worm[i-1] = m_Worm[i];
            
        }
        //m_Worm[m_MaxWormSize-1].x = pnt.x;
        m_Worm[m_MaxWormSize-1] = 100 - y;
        
        
    }
    [self setNeedsDisplay];
}
-(void)setWormColor:(int)r :(int)g :(int)b
{
    m_wormColor = [[UIColor alloc ] initWithRed:r green:g blue:b alpha:1] ;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
   
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    CGContextSetStrokeColorWithColor(context, [UIColor cyanColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    
    // Y Axis
    CGContextMoveToPoint(context, 1,0); //start at this point
    CGContextAddLineToPoint(context, 1, self.frame.size.height); //draw to this point
    
    // X Axis
    CGContextMoveToPoint(context, 0, self.frame.size.height-1); //start at this point
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height-1); //draw to this point
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor alloc] initWithRed:0 green:255 blue:255 alpha:0.3].CGColor);
    CGContextMoveToPoint(context, 0, 0); 
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 0, self.frame.size.height/4.0);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height/4.0);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 0, self.frame.size.height/2.0);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height/2.0);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 0, self.frame.size.height*3/4.0);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height*3/4.0);
    CGContextStrokePath(context);

    CGContextMoveToPoint(context, self.frame.size.width/4.0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width/4.0, self.frame.size.height);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, self.frame.size.width/2.0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width/2.0, self.frame.size.height);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, self.frame.size.width*3/4.0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width*3/4.0, self.frame.size.height);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, self.frame.size.width, 0);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextStrokePath(context);
    //Draw at desire level
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    
    desiredLevel = 100 - desiredLevel;
    CGContextMoveToPoint(context, 0, (desiredLevel*self.frame.size.height)/100); 
    CGContextAddLineToPoint(context, self.frame.size.width, (desiredLevel*self.frame.size.height)/100); 
    CGContextStrokePath(context);
    
    //Draw the worm
    CGContextSetStrokeColorWithColor(context, m_wormColor.CGColor);
    CGContextSetLineWidth(context, 1.0);

    for(int i=0;i<m_iCurrWormSize-1;i++)
    {
        if(m_Worm)
        {
            CGContextMoveToPoint(context, i*(self.frame.size.width/(m_iCurrWormSize-1)), m_Worm[i]*self.frame.size.height/100.0); //start at this point
            CGContextAddLineToPoint(context, (i+1)*(self.frame.size.width/(m_iCurrWormSize-1)), m_Worm[i+1]*self.frame.size.height/100.0); //draw to this point
        }
    }
    CGContextStrokePath(context);
    
}
-(void) dealloc
{
    if(m_Worm)
        free(m_Worm);
}


@end
