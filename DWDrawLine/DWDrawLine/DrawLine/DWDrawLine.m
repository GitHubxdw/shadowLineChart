//
//  DWDrawLine.m
//  DWDrawLine
//
//  Created by xdw on 16/3/18.
//  Copyright © 2016年 xdw. All rights reserved.
//

#import "DWDrawLine.h"
#import "LineLab.h"
#define numYLabWidth  22
#define numYLabHeight 12
#define nunXLabWidth  60
#define nunXLabHeight 20
#define LINEWidth      1

@implementation DWDrawLine
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.sourceDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.sourceDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if (self.sourceDataArray.count > 1) {
        [self drawTrianglePath];
        [self drawLineAndText];
    }
    // Drawing code
}

-(void)drawLineAndText{
    UIColor *color = [UIColor lightGrayColor];
    [color set];  //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = LINEWidth;
    path.lineCapStyle = kCGLineCapRound;  //线条拐角
    path.lineJoinStyle = kCGLineCapRound;  //终点处理
    
    //画横线
    [path moveToPoint:CGPointMake(0 , path.lineWidth/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width - 5 , path.lineWidth/2)];
    [path stroke];
    
    
    [path moveToPoint:CGPointMake(numYLabWidth , self.bounds.size.height - path.lineWidth/2 - nunXLabHeight)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width - 5 , self.bounds.size.height - path.lineWidth/2 - nunXLabHeight)];
    [path stroke];
    
    //画竖线
    [path moveToPoint:CGPointMake(numYLabWidth , 0)];
    [path addLineToPoint:CGPointMake(numYLabWidth, self.bounds.size.height - path.lineWidth/2  - nunXLabHeight)];
    [path stroke];
    
    NSInteger numCount = self.sourceDataArray.count;
    CGFloat space = (self.bounds.size.height- nunXLabHeight - numYLabHeight * numCount) / (numCount - 1);

    for (NSInteger index = 0; index < numCount; index ++) {
        LineLab *numLab = [[LineLab alloc] init];
        numLab.frame = CGRectMake(0, index * space + index * numYLabHeight, numYLabWidth, numYLabHeight);
        numLab.text = [self.sourceDataArray objectAtIndex:numCount - index - 1];
        [self addSubview:numLab];
    }
    
    LineLab *beginLab = [[LineLab alloc] init];
    beginLab.frame = CGRectMake(numYLabWidth, self.bounds.size.height - nunXLabHeight, nunXLabWidth, nunXLabHeight);
    beginLab.text = @"13:00:15";
    beginLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:beginLab];
    
    LineLab *endLab = [[LineLab alloc] init];
    endLab.frame = CGRectMake(self.bounds.size.width - nunXLabWidth-5, self.bounds.size.height - nunXLabHeight, nunXLabWidth, nunXLabHeight);
    endLab.text = @"14:00:25";
    [self addSubview:endLab];
    
}
- (void)drawTrianglePath {
    //绘制渐变色层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) ;// self.view.frame;
    gradientLayer.colors = @[(__bridge id)[UIColor greenColor].CGColor ,
                             (__bridge id)[UIColor whiteColor].CGColor];
    [self.layer addSublayer:gradientLayer];//加上渐变层
    
    
    UIBezierPath * path=[[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(numYLabWidth + LINEWidth, self.bounds.size.height - nunXLabHeight - LINEWidth)];
    for (NSInteger index =numYLabWidth + LINEWidth; index < self.bounds.size.width - numYLabWidth + LINEWidth - 5; index ++) {
        [path addLineToPoint:CGPointMake(index, arc4random()%200 + 10)];
    }
    [path addLineToPoint:CGPointMake(self.bounds.size.width - numYLabWidth + LINEWidth-5, self.bounds.size.height - nunXLabHeight - LINEWidth)];
    //曲线封闭
    //[path closePath];
    path.lineWidth = 2.0;
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor greenColor];
    [strokeColor set];
    // 根据我们设置的各个点连线
    [path stroke];
    
    
    CAShapeLayer *arc = [CAShapeLayer layer];
    arc.path =path.CGPath;
    gradientLayer.mask=arc;
    
}


@end
