//
//  LYViewControllerConfigureManager.m
//  LeyinIntelligence
//
//  Created by fjf on 2018/6/5.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "FJFViewControllerConfigureManager.h"

@implementation FJFViewControllerConfigureManager

/*************    ⚡️⚡️⚡️ 此处为需要隐藏导航栏的控制器 ⚡️⚡️⚡️      *************/
+ (NSArray<NSString *> *)vcNeedsNavBarHiddenNameArray {
    return @[
             @"FJDiscoverViewController",
             @"FJProfileViewController",
            ];
}

@end
