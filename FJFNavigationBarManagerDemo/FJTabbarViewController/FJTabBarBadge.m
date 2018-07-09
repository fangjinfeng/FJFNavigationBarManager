//
//  LCTabBarBadge.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015 Leo <leodaxia@gmail.com>
//
//  Copyright (c) 2015-2017 Leo
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "FJTabBarBadge.h"
#import "FJTabbarViewStyle.h"

@implementation FJTabBarBadge

#pragma mark --- init method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
    }
    return self;
}

#pragma mark --- layout method

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.hidden = !(BOOL)self.badgeValue;
    if (self.badgeValue.length > 0) {
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        [self setTitleColor:_tabbarViewStyle.badgeTitleNomalColor forState:UIControlStateNormal];
        CGRect frame = self.frame;
        CGFloat badgeW = _tabbarViewStyle.badgeViewNormalHeight;
        CGFloat badgeH = _tabbarViewStyle.badgeViewNormalHeight;
        CGSize titleSize = [self.badgeValue sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_tabbarViewStyle.badgeTitleFont, NSFontAttributeName, nil]];
        if ([self.badgeValue integerValue] < 10) {
            frame.size.width = badgeW;
        }
        else {
            frame.size.width = titleSize.width + 10;
        }
        frame.size.height = badgeH;
        frame.origin.x = ([UIScreen mainScreen].bounds.size.width / self.tabBarItemCount)/2 + (frame.size.width/2.0) + _tabbarViewStyle.badgeViewToTabbarButtonSpacing;
        frame.origin.y = 2.0f;
        self.frame = frame;
    }
}

#pragma mark --- setter method

- (void)setTabbarViewStyle:(FJTabbarViewStyle *)tabbarViewStyle {
    _tabbarViewStyle = tabbarViewStyle;
    if (tabbarViewStyle) {
        self.layer.cornerRadius = _tabbarViewStyle.badgeViewNormalHeight / 2.0f;
        self.backgroundColor = _tabbarViewStyle.badgeBackgroundColor;
        self.titleLabel.font = _tabbarViewStyle.badgeTitleFont;
        [self layoutSubviews];
    }
}

// 设置 消息 值
- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = [badgeValue copy];
     [self layoutSubviews];
}

@end
