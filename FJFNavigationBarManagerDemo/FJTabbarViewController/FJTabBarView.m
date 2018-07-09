//
//  LETabBarView.m
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//

#import "FJTabBarView.h"
#import "FJTabBarButton.h"
#import "FJTabbarDefine.h"
#import "FJTabbarViewStyle.h"

@interface FJTabBarView ()

// selected button
@property (nonatomic, weak) UIButton *selectedButton;

// horizontal view
@property (nonatomic, strong) UIView *horizontalLineView;

// buttons array
@property (nonatomic, strong) NSMutableArray <FJTabBarButton *>*buttonArray;

@end

@implementation FJTabBarView

#pragma mark --- init method

- (instancetype)init {
    
    if(self = [super init]) {
        [self addSubview:self.horizontalLineView];
    }
    return self;
}

#pragma mark --- public method

// 设置 选中 item
- (void)setSelectedTabbarButtonIndex:(NSUInteger)buttonIndex {
     if (buttonIndex < self.buttonArray.count) {
         [self itemButtonClicked:self.buttonArray[buttonIndex]];
     }
}

// 依据 按键 索引 获取 tabbar button
- (FJTabBarButton *)tabbarButtonWithButtonIndex:(NSUInteger)buttonIndex {
    if (buttonIndex < self.buttonArray.count) {
        return  self.buttonArray[buttonIndex];
    }
    return nil;
}
#pragma mark --- private method

// 设置 LETabbarButton 属性
- (void)setupButtonAttrWithTabbarButton:(FJTabBarButton *)button {
    
    button.tabBarItemCount = _itemArray.count;
    button.tabbarViewStyle = _tabbarViewStyle;
}

#pragma mark --- response event

- (void)itemButtonClicked:(UIButton *)button {
    
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarView:didClickButton:)]) {
        [self.delegate tabBarView:self didClickButton:button.tag];
    }
}

#pragma mark --- layout method
// 布局
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / self.itemArray.count;
    CGFloat btnH = h;
    
    int i = 0;
    for (UIView *tabBarButton in self.buttonArray) {
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
    
    self.horizontalLineView.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
}

#pragma mark --- setter method

// 设置 item 数组
- (void)setItemArray:(NSArray *)itemArray {
    
    _itemArray = itemArray;
    if (_itemArray.count > 0) {
        //遍历模型数组，创建对应的tabBarButton
        [_itemArray enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL * _Nonnull stop) {
            FJTabBarButton *tabbarButton = [FJTabBarButton buttonWithType:UIButtonTypeCustom];
            [tabbarButton addTarget:self action:@selector(itemButtonClicked:)forControlEvents:UIControlEventTouchDown];
            tabbarButton.item = item;
            tabbarButton.tag = idx;
            [self setupButtonAttrWithTabbarButton:tabbarButton];
            //默认选择
            if (tabbarButton.tag == 0) {
                [self itemButtonClicked:tabbarButton];
            }
            [self addSubview:tabbarButton];
            [self.buttonArray addObject:tabbarButton];
        }];
    }
}

- (void)setTabbarViewStyle:(FJTabbarViewStyle *)tabbarViewStyle {
    _tabbarViewStyle = tabbarViewStyle;
    if (tabbarViewStyle) {
        
        self.horizontalLineView.backgroundColor = _tabbarViewStyle.lineViewBackgroundColor;
        
        [self.buttonArray enumerateObjectsUsingBlock:^(FJTabBarButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.tabbarViewStyle = tabbarViewStyle;
        }];
    }
}


#pragma mark --- getter method

// LETabbarButton arry
- (NSMutableArray *)buttonArray {
    
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

// horizontal view
- (UIView *)horizontalLineView {
    if (!_horizontalLineView) {
        _horizontalLineView = [[UIView alloc] init];
        _horizontalLineView.backgroundColor = kFJTabbarSplitLineBackgroundColor;
    }
    return _horizontalLineView;
}
@end
