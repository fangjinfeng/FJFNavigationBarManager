# FJFNavigationBarManager

# 一. 前言
我们`产品需求`中很经常会碰到`某个界面`是需要`隐藏导航栏`或者`自定义导航栏`，但是跳转到`下个界面`又需要`显示导航栏`，更有甚者，比如说`当前界面`是需要`隐藏导航栏`的，`这个界面`可以跳转到`其他十来个界面`，其中有`一半的界面`是需要`隐藏导航栏`，`一半`是需要`显示导航栏`的，这样`导航栏处理`起来就很麻烦，尤其是`手势滑动`返回的`动画`可能会出现问题。

**举个🌰 :**
- 当前`发现界面`是`隐藏导航栏`，
- 同时`发现界面`可以跳转到`店铺界面`和`我的界面`
- `店铺界面`是显示`导航栏`，而`我的界面`是`隐藏导航栏`

**代码展示:**
```
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
[secondBtn setTitle:@"进入我的界面" forState:UIControlStateNormal];
[secondBtn addTarget:self action:@selector(secondButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
secondBtn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0f green:arc4random_uniform(256)/256.0f blue:arc4random_uniform(256)/256.0f alpha:1.0f];
[self.view addSubview:secondBtn];
}

- (void)viewWillAppear:(BOOL)animated {
[self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
[self.navigationController setNavigationBarHidden:NO animated:animated];
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
```
**效果展示:**
![FJFNavigationBarManager-NoManager.gif](https://upload-images.jianshu.io/upload_images/2252551-a182d535a4b265e6.gif?imageMogr2/auto-orient/strip)

**我们可以看到:尽管我们在`发现界面`的`viewWillAppear`和`viewWillDisappear`做了如下处理**
```
- (void)viewWillAppear:(BOOL)animated {
[self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
[self.navigationController setNavigationBarHidden:NO animated:animated];
}
```
但是跳转到`我的界面`这时`导航栏`显示还是有问题，尤其是`手势滑动返回`的时候，还是显得不协调。
这种情况处理起来就相对比较麻烦，因为`我的界面`在`viewWillAppear`和`viewWillDisappear`也做了处理，这就需要`发现界面`和`我的界面`的两者`配合`起来处理才能达到`协调`的目的。

但是通过`FJFNavigationBarManager`，只需要简单的设置需要`隐藏的界面`，其他的都不需要管，同时如果在`debug模式`下，如果你在某个界面通过函数`[self.navigationController setNavigationBarHidden:YES animated:animated];`来`隐藏导航栏`，会通过`崩溃`来提醒你要去`导航栏管理器`里面设置才可以。

```
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
```

# 二.使用介绍

- **使用方法**
A. 首先让`navigationController`设置代理为`[FJFNavigationControllerManager sharedInstance]`
```
/**
设置 navigationController 的UINavigationControllerDelegate代理 为FJFNavigationControllerManager 单例

@param navigationController 遵循UINavigationControllerDelegate代理的 navigationController
*/
+ (void)setNavigationDelegateWithNavigationController:(UINavigationController *)navigationController;

/**
生成 navigationController 并 设置 UINavigationControllerDelegate代理 为FJFNavigationControllerManager 单例

@param viewControllerName 根界面名称
@return 生成 navigationController
*/
+ (UINavigationController *)navigationControllerWithViewControllerName:(NSString *)viewControllerName;
/**
生成 navigationController 并 设置 UINavigationControllerDelegate代理 为FJFNavigationControllerManager 单例

@param viewController 根界面
@return 生成 navigationController
*/
+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController;
```

B. 在`FJFViewControllerConfigureManager`中的`vcNeedsNavBarHiddenNameArray`设置需要`隐藏导航栏`的`控制器名称`。
```
/*************    ⚡️⚡️⚡️ 此处为需要隐藏导航栏的控制器 ⚡️⚡️⚡️      *************/
+ (NSArray<NSString *> *)vcNeedsNavBarHiddenNameArray {
return @[
@"FJDiscoverViewController",
@"FJProfileViewController",
];
}

```
- **集成方法:**
```
静态：手动将FJFNavigationBarManager文件夹拖入到工程中。
```

- **`github 链接`**

> **Demo地址: https://github.com/fangjinfeng/FJFNavigationBarManager**

- **效果展示:**
![FJFNavigationBarManager-Manager.gif](https://upload-images.jianshu.io/upload_images/2252551-f9a9af5455478f66.gif?imageMogr2/auto-orient/strip)


# 三. 原理分析

### 1. 原理简介

- `导航栏管理器(FJFNavigationControllerManager)`主要是通过设置`navigationController`的`UINavigationControllerDelegate`代理为`[FJFNavigationControllerManager sharedInstance]单例`

- 然后在代理方法`- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated `内去判断`当前viewController`是否在`需要隐藏的控制器数组(vcNeedsNavBarHiddenNameArray)`中，如果在就`隐藏`，如果不在就`显示`。

- 同时通过`UINavigationController`的类别在`load`函数里面进行`导航栏隐藏`的`方法交换`，
如果设置了`隐藏导航栏`，就将`导航栏隐藏标志位`置为`YES`，否则置为`NO`，通过这个`标志位`来判断如果该`navigationController`上的`viewController`不是通过`需要隐藏的控制器数组(vcNeedsNavBarHiddenNameArray)`而是通过自己的方法来`隐藏导航栏`，就会崩溃输出`提示log`。

### 2. 代码分析:
- **`FJFNavigationControllerManager`的`3`个类方法:**

```
+ (UINavigationController *)navigationControllerWithViewControllerName:(NSString *)viewControllerName {
UIViewController *vc = [[NSClassFromString(viewControllerName) alloc] init];
NSAssert([vc isKindOfClass:[UIViewController class]], @"viewControllerName 必现是 UIViewController");
UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
navController.delegate = (id)[FJFNavigationControllerManager sharedInstance];
return navController;
}

+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController {
NSAssert([viewController isKindOfClass:[UIViewController class]], @"viewController 必现是 UIViewController");
UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:viewController];
navVc.delegate = (id)[FJFNavigationControllerManager sharedInstance];
return navVc;
}


+ (void)setNavigationDelegateWithNavigationController:(UINavigationController *)navigationController {
NSAssert([navigationController isKindOfClass:[UINavigationController class]], @"navigationController 必现是 UINavigationController");
navigationController.delegate = (id)[FJFNavigationControllerManager sharedInstance];
}
```
主要用来生成`navigationController`，并设置`UINavigationControllerDelegate`代理为`[FJFNavigationControllerManager sharedInstance]`。

- **`UINavigationControllerDelegate`的代理方法`- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated `主要用来判断`当前viewController`是否在`需要隐藏的控制器数组(vcNeedsNavBarHiddenNameArray)`中，如果在就`隐藏`，如果不在就`显示`。**

```
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
[navigationController fjf_resetHasCalledSetNavigationBarHiddenFlag]; //重置hidden flag
#endif
}
```

这里的`shouldNavigationController`函数是用来判断`当前viewController`是否在`需要隐藏的控制器数组(vcNeedsNavBarHiddenNameArray)`中.
```

- (BOOL)shouldNavigationController:(UINavigationController *)navigationController hideNavigationBarOfViewController:(UIViewController *)viewController {
    for (NSString *vcName in [FJFViewControllerConfigureManager vcNeedsNavBarHiddenNameArray]) {
        if ([vcName isEqualToString:NSStringFromClass([viewController class])]) {
            return YES;
        }
    }
return NO;
}
```

而`checkAndThrowExceptionWithNavigationController:navigationController`函数则是通过`navigationController`的`fjf_hasCalledSetNavigationBarHidden`来获取`导航栏是否隐藏标志位`来，判断`使用者`是否通过`其他方式`隐藏导航栏，如果是，则给出`提示`。
```
- (void)checkAndThrowExceptionWithNavigationController:(UINavigationController *)navigationController topViewController:(UIViewController *)viewController {

#ifdef DEBUG
    if ([navigationController fjf_hasCalledSetNavigationBarHidden]) {
        NSString *tips = [NSString stringWithFormat:@"\n\n\n\n************************************************************\n  统一在此处实现导航栏的隐藏，禁止在该系列的navigationController的\n\n  *** %@ ***\n\n  控制器中设置setNavigationBarHidden\n************************************************************\n\n\n\n", viewController];
        NSLog(@"%@", tips);
        NSAssert(NO, tips);
    }
#endif
}
```
之后则调用`navigationController` 的`fjf_resetHasCalledSetNavigationBarHiddenFlag`，重置`标志位`。

这里判断`使用者`是否通过`其他方式`隐藏导航栏，主要是通过`runtime`的`方法交换`，交换了系统的设置导航栏显示与隐藏的函数`setNavigationBarHidden:animated:`，来设置`导航栏隐藏标志位`。
```
static void *hasSetNavigationBarHiddenKey = &hasSetNavigationBarHiddenKey;

@implementation UINavigationController (HasCalledTheMethod)


#pragma mark -------------------------- Life  Circle
+ (void)load {

#ifdef DEBUG
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{

    Class selfClass = [self class];
    SEL originalSelector = @selector(setNavigationBarHidden:animated:);
    SEL swizzledSelector = @selector(fjf_hasCalledTheMethod_setNavigationBarHidden:animated:);
    Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    BOOL didAddMethod = class_addMethod(selfClass,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod)
                                        );
   if (didAddMethod) {
    class_replaceMethod(selfClass,
                        swizzledSelector,
                        method_getImplementation(originalMethod),
                        method_getTypeEncoding(originalMethod));
                        } else {
                        method_exchangeImplementations(originalMethod, swizzledMethod);
                    }

    });
#endif
}


#pragma mark -------------------------- Public  Methods
- (void)fjf_hasCalledTheMethod_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    objc_setAssociatedObject(self, &hasSetNavigationBarHiddenKey, @(YES), OBJC_ASSOCIATION_ASSIGN);
    [self fjf_hasCalledTheMethod_setNavigationBarHidden:hidden animated:animated];
}

- (void)fjf_resetHasCalledSetNavigationBarHiddenFlag {
    objc_setAssociatedObject(self, &hasSetNavigationBarHiddenKey, @(NO), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)fjf_hasCalledSetNavigationBarHidden {
    return [objc_getAssociatedObject(self, hasSetNavigationBarHiddenKey) boolValue];
}

```

# 四. 总结
综上所述就是`FJFNavigationBarManager`这个`导航栏管理器`的一个`设计思路`，`核心代码量`也就`一百来行`，只需配置下需要隐藏的界面名称，简单易用

![image.png](https://upload-images.jianshu.io/upload_images/2252551-320ab4a4c8d5b5cc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



**如果你觉得你觉得这思路或是代码有什么问题，欢迎留言大家讨论下！如果觉得不错，麻烦给个喜欢或star,谢谢！**
