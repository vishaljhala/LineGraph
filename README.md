LineGraph
=========

iOS LineGraph - library

Its bit difficult to get a simple library with creates line charts for iOS. So here's one.

Very simple to use (Refer test project).
1) Include LineGraph.h and LineGraph.m in your project.
2) Initialize as below:
    graph = [[lineGraph alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)  :120];
    [self.view addSubview:graph];
    
    First arguement in InitWithFrame determines the size of the view on which graph will be drawn. 
    Second arguement determines the maximum data points along X-axis that would be retained in view.
    
3) To add data points call this function and it will automatically draw your chart. [graph pushPoint:y]; 
Here y is a integer that represents y-axis of the graph.

Thats it. Enjoy!

