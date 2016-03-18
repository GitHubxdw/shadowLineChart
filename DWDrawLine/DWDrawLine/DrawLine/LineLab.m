//
//  LineLab.m
//  DWDrawLine
//
//  Created by xdw on 16/3/18.
//  Copyright © 2016年 xdw. All rights reserved.
//

#import "LineLab.h"

@implementation LineLab
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setNumberOfLines:1];
        [self setFont:[UIFont systemFontOfSize:12.0f]];
        [self setTextAlignment:NSTextAlignmentRight];
        self.textColor = [UIColor lightGrayColor];
        
    }
    return self;
}

@end
