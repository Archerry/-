//
//  ViewController.m
//  WMHScrollView
//
//  Created by Archer on 2017/3/21.
//  Copyright © 2017年 jiuji. All rights reserved.
//

#import "ViewController.h"
#import "WMHCustomScroll.h"
#import "WMHCustom.h"

@interface ViewController ()<WMHCustomScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imgArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"图片%d.jpg",i + 1];
        [imgArr addObject:imageName];
    }
    
    //type为1传入图片网址数组，为0传入图片名字
    WMHCustomScroll *scrollView = [WMHCustomScroll scrollViewWithImageArray:imgArr pageCtrIsHiden:NO ImgType:@"0"];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

-(void)viewWillAppear:(BOOL)animated{
    //发送通知停止定时器，用于页面销毁
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"stopTimer" object:nil];
}

#pragma mark - scrollViewDelegate
-(void)scrollViewImageClick:(WMHCustomScroll *)WMHView{
    NSLog(@"%.f",WMHView.WMHScroll.contentOffset.x / allScreen.width - 1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
