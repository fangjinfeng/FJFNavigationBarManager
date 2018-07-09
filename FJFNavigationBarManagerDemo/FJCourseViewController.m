//
//  FJCourseViewController.m
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

// vc
#import "FJCourseViewController.h"
#import "FJDiscoverViewController.h"

@interface FJCourseViewController ()

@end

@implementation FJCourseViewController

#pragma mark -------------------------- Life  Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"精选";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0f green:arc4random_uniform(256)/256.0f blue:arc4random_uniform(256)/256.0f alpha:1.0f];
}

#pragma mark -------------------------- Response  Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FJDiscoverViewController *tmpVc = [[FJDiscoverViewController alloc] init];
    tmpVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tmpVc animated:YES];
}
@end
