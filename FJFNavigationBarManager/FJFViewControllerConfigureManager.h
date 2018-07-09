//
//  LYViewControllerConfigureManager.h
//  LeyinIntelligence
//
//  Created by fjf on 2018/6/5.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJFViewControllerConfigureManager : NSObject
// 需要隐藏导航栏的控制器
+ (NSArray<NSString *> *)vcNeedsNavBarHiddenNameArray;
@end
