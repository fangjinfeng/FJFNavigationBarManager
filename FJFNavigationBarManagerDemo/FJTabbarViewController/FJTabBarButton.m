//
//  TabBarButton.m
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//


#import "FJTabBarBadge.h"
#import "FJTabBarButton.h"
#import "FJTabbarDefine.h"
#import "FJTabbarViewStyle.h"


@interface FJTabBarButton()

/**
 *  TabBar item image ratio  tabbarItem 图片比例
 */
@property (nonatomic, assign) CGFloat itemImageRatio;
@end

@implementation FJTabBarButton

#pragma mark --- init method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupControls];
        [self setupDefaultValue];
    }
    return self;
}

#pragma mark --- private method
// 设置 子控件
- (void)setupControls {
    [self addSubview:self.tabBarBadge];
}

// 设置 默认 值
- (void)setupDefaultValue {
    self.itemImageRatio = kFJTabbarItemImageRatio;
    [self setTitleColor:kFJTabbarButtonNormalTitleColor
               forState:UIControlStateNormal];
    [self setTitleColor:kFJTabbarButtonSelectTitleColor
               forState:UIControlStateSelected];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = kFJTabbarButtonFontSize;
}


//重写，取消高亮做的事情
- (void)setHighlighted:(BOOL)highlighted {
    
}



#pragma mark --- layout subview

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self.tabBarBadge layoutSubviews];
    
    // imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = 49.0f * self.itemImageRatio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = 49.0f - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}


#pragma mark --- setter method

- (void)setItem:(UITabBarItem *)item {
    
    _item = item;
  
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

// tabbarBadge value
- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = badgeValue;
    self.tabBarBadge.badgeValue = badgeValue;
}

// tabbarItem count
- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    
    _tabBarItemCount = tabBarItemCount;
    self.tabBarBadge.tabBarItemCount = tabBarItemCount;
}


- (void)setTabbarViewStyle:(FJTabbarViewStyle *)tabbarViewStyle {
    _tabbarViewStyle = tabbarViewStyle;
    if (tabbarViewStyle) {
        self.titleLabel.font = _tabbarViewStyle.itemTitleFont;
         [self setTitleColor:_tabbarViewStyle.normalItemTitleColor forState:UIControlStateNormal];
        [self setTitleColor:_tabbarViewStyle.selectedItemTitleColor forState:UIControlStateSelected];
        self.tabBarBadge.tabbarViewStyle = _tabbarViewStyle;
    }
}

#pragma mark --- getter method

// 未读 提示 badge
- (FJTabBarBadge *)tabBarBadge {
    
    if(!_tabBarBadge) {
        _tabBarBadge = [[FJTabBarBadge alloc] init];
    }
    return _tabBarBadge;
}
@end
