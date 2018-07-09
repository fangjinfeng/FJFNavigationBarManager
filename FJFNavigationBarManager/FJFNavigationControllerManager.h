//
//  LYNavigationControllerManager.h
//  LeyinIntelligence
//
//  Created by xianjb on 2017/9/22.
//  Copyright © 2017年 Leyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJFNavigationControllerManager : NSObject<UINavigationControllerDelegate>

+ (instancetype)sharedInstance;

+ (UINavigationController *)navigationControllerWithRootViewController:(id)viewController;
+ (UINavigationController *)navigationControllerWithViewControllerName:(NSString *)vcName;

- (void)checkNavigationBarHiddenFlagWhenWillDisapperNavigationController:(UINavigationController *)navigationController;

// 更新 导航栏 状态
- (void)updateNavigationBarStatusWithNavigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end



