//
//  FJDiscoverViewController.m
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJShopViewController.h"
#import "FJProfileViewController.h"
#import "FJDiscoverViewController.h"

@interface FJDiscoverViewController ()

@end

@implementation FJDiscoverViewController

#pragma mark -------------------------- Life  Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    UIButton *firstBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    [firstBtn setTitle:@"进入店铺界面" forState:UIControlStateNormal];
    [firstBtn addTarget:self action:@selector(firstButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    firstBtn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0f green:arc4random_uniform(256)/256.0f blue:arc4random_uniform(256)/256.0f alpha:1.0f];
    [self.view addSubview:firstBtn];
    
    
    UIButton *secondBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 200, 100)];
    [secondBtn setTitle:@"我的界面" forState:UIControlStateNormal];
    [secondBtn addTarget:self action:@selector(secondButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    secondBtn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0f green:arc4random_uniform(256)/256.0f blue:arc4random_uniform(256)/256.0f alpha:1.0f];
    [self.view addSubview:secondBtn];
}


#pragma mark -------------------------- Response  Event
- (void)firstButtonClicked:(UIButton *)sender {
    FJShopViewController *tmpVc = [[FJShopViewController alloc] init];
    tmpVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tmpVc animated:YES];
}

- (void)secondButtonClicked:(UIButton *)sender {
    FJProfileViewController *tmpVc = [[FJProfileViewController alloc] init];
    tmpVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tmpVc animated:YES];
}

@end
