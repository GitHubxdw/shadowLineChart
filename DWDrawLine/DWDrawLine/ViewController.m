//
//  ViewController.m
//  DWDrawLine
//
//  Created by xdw on 16/3/18.
//  Copyright © 2016年 xdw. All rights reserved.
//

#import "ViewController.h"
#import "DWDrawLine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DWDrawLine *drawLine = [[DWDrawLine alloc] init];
    drawLine.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    for (NSInteger index = 0; index < 10; index ++) {
        [drawLine.sourceDataArray addObject:[NSString stringWithFormat:@"%ldK ",index * 2]];
    }
    [self.view addSubview:drawLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
