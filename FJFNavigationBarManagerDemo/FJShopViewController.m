//
//  FJShopViewController.m
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

// vc
#import "FJShopViewController.h"
#import "FJProfileViewController.h"


@interface FJShopViewController ()

@end

@implementation FJShopViewController

#pragma mark -------------------------- Life  Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"店铺";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0f green:arc4random_uniform(256)/256.0f blue:arc4random_uniform(256)/256.0f alpha:1.0f];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


#pragma mark -------------------------- Response  Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FJProfileViewController *tmpVc = [[FJProfileViewController alloc] init];
    tmpVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tmpVc animated:YES];
}

@end
