//
//  FJTabbarViewController.m
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJTabBarView.h"
#import "FJTabbarDefine.h"
#import "FJTabbarViewStyle.h"
#import "FJTabbarViewController.h"
#import "MOANavigationControllerManager.h"

@interface FJTabbarViewController ()<FJTabBarViewDelegate>
// itmes array
@property (nonatomic, strong) NSMutableArray *itemArray;
// tabbar
@property (nonatomic, strong) FJTabBarView *tabBarView;
@end

@implementation FJTabbarViewController

#pragma mark --------------- Life Circle

- (instancetype)initWithViewControllerArray:(NSArray<NSString *> *)viewControllerArray
                             imageNameArray:(NSArray<NSString *> *)imageNameArray
                     selectedImageNameArray:(NSArray<NSString *> *)selectedImageNameArray
                                 titleArray:(NSArray<NSString *> *)titleArray {
    
    if (self = [self init]) {
        for (int i = 0; i < viewControllerArray.count; i++) {
            [self setUpOneChildViewController:viewControllerArray[i]
                                    imageName:imageNameArray[i]
                            selectedImageName:selectedImageNameArray[i]
                                        title:titleArray[i]];
        }
        
        [self setUpTabBar];
    
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDefualutValue];
}

- (void)viewDidLayoutSubviews {
    self.tabBarView.frame = CGRectMake(0, self.tabBar.bounds.origin.y, self.tabBar.bounds.size.width, 49.0f);
    [self.tabBarView layoutSubviews];
}


#pragma mark --------------- Public Methods
// 依据 按键 索引 获取 tabbar button
- (FJTabBarButton *)tabbarButtonWithButtonIndex:(NSUInteger)buttonIndex {
   return [self.tabBarView tabbarButtonWithButtonIndex:buttonIndex];
}

// 设置 选中 item
- (void)setSelectedTabbarButtonIndex:(NSUInteger)buttonIndex  {
    [self.tabBarView setSelectedTabbarButtonIndex:buttonIndex];
}

#pragma mark --------------- Custom Delegate

- (void)tabBarView:(FJTabBarView *)tabBarView
    didClickButton:(NSInteger)index {
    
    self.selectedIndex = index;
}


#pragma mark --------------- Private Methods
// 设置 相关 属性
- (void)setUpOneChildViewController:(NSString *)viewControllerStr
                          imageName:(NSString *)imageName
                  selectedImageName:(NSString *)selectedNameImage
                              title:(NSString *)title {
    UIViewController *vc = [[NSClassFromString(viewControllerStr) alloc] init];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedNameImage];
    [self.itemArray addObject:vc.tabBarItem];
    
    //添加导航控制器
    UINavigationController *nav = [MOANavigationControllerManager navigationControllerWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

// 设置 默认 值
- (void)setupDefualutValue {
    self.tabbarViewStyle = [[FJTabbarViewStyle alloc] init];
}

// 设置 tabbr
- (void)setUpTabBar {
    //添加自定义tabBar
    self.tabBarView.itemArray = self.itemArray;
    [self.tabBar addSubview:self.tabBarView];
    // 移除 原先 子控件
    [self removeTabbarOriginalView];
}

// 移除 tabbar 原先 子控件
- (void)removeTabbarOriginalView {
    // 移除 UITabBarButton
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull tabBarButton, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            tabBarButton.alpha = 0;
            tabBarButton.hidden = YES;
        }
    }];
    
    //去掉分割线
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    self.tabBar.shadowImage = [[UIImage alloc] init];
}


#pragma mark --- setter method

- (void)setTabbarViewStyle:(FJTabbarViewStyle *)tabbarViewStyle {
    _tabbarViewStyle = tabbarViewStyle;
    if (tabbarViewStyle) {
        self.tabBarView.tabbarViewStyle = tabbarViewStyle;
    }
}


#pragma mark --- getter method

// item 数组
- (NSMutableArray *)itemArray {
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

// 自定义 tabbarView
- (FJTabBarView *)tabBarView {
    if (_tabBarView == nil) {
        _tabBarView = [[FJTabBarView alloc] init];
        _tabBarView.frame = self.tabBar.bounds;
        _tabBarView.delegate = self;
    }
    return _tabBarView;
}

@end
