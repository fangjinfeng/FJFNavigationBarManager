//
//  LYNavigationControllerManager.m
//  LeyinIntelligence
//
//  Created by xianjb on 2017/9/22.
//  Copyright © 2017年 Leyin. All rights reserved.
//

// tool
#import "FJFNavigationControllerManager.h"
#import "MOAViewControllerConfigureManager.h"
// category®
#import "UINavigationController+HasCalledTheMethod.h"


@implementation FJFNavigationControllerManager

#pragma mark -------------------------- Life  Circle

+ (void)load {
    [super load];
    
    [FJFNavigationControllerManager sharedInstance];
}


#pragma mark -------------------------- Private  Methods

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static FJFNavigationControllerManager *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FJFNavigationControllerManager alloc] init];
    });
    return sharedInstance;
}

+ (UINavigationController *)navigationControllerWithRootViewController:(id)viewController {
    
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:viewController];
    navVc.delegate = (id)[FJFNavigationControllerManager sharedInstance];
    return navVc;
}

+ (UINavigationController *)navigationControllerWithViewControllerName:(NSString *)vcName {
    UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    navController.delegate = (id)[FJFNavigationControllerManager sharedInstance];
    return navController;
}

- (void)checkNavigationBarHiddenFlagWhenWillDisapperNavigationController:(UINavigationController *)navigationController {
    
    [self checkAndThrowExceptionWithNavigationController:navigationController topViewController:navigationController.topViewController];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [self updateNavigationBarStatusWithNavigationController:navigationController willShowViewController:viewController animated:animated];
}


- (void)updateNavigationBarStatusWithNavigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
#ifdef DEBUG
    [self checkAndThrowExceptionWithNavigationController:navigationController topViewController:viewController];
#endif
    [navigationController setNavigationBarHidden:[self shouldNavigationController:navigationController hideNavigationBarOfViewController:viewController]
                                        animated:animated];
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:(UIBarButtonItemStylePlain) target:nil action:nil];
    
#ifdef DEBUG
    [navigationController resetHasCalledSetNavigationBarHiddenFlag]; //重置hidden flag
#endif
}

#pragma mark - Private Methods

- (BOOL)shouldNavigationController:(UINavigationController *)navigationController hideNavigationBarOfViewController:(UIViewController *)viewController {
    for (NSString *vcName in [MOAViewControllerConfigureManager vcNeedsNavBarHiddenNameArray]) {
        if ([vcName isEqualToString:NSStringFromClass([viewController class])]) {
            return YES;
        }
    }
    return NO;
}


- (void)checkAndThrowExceptionWithNavigationController:(UINavigationController *)navigationController topViewController:(UIViewController *)viewController {
    
#ifdef DEBUG
    if ([navigationController hasCalledSetNavigationBarHidden]) {
        NSString *tips = [NSString stringWithFormat:@"\n\n\n\n************************************************************\n  统一在此处实现导航栏的隐藏，禁止在该系列的navigationController的\n\n  *** %@ ***\n\n  控制器中设置setNavigationBarHidden\n************************************************************\n\n\n\n", viewController];
        NSLog(@"%@", tips);
        NSAssert(NO, tips);
    }
#endif
}





@end
