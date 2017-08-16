//
//  KFMWelcomeView.m
//  WBWelcome
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "KFMWelcomeView.h"

@interface KFMWelcomeView ()
@property (nonatomic, weak)UIImageView *backImageView;
@property (nonatomic, weak)UILabel *tipLabel;

@property (nonatomic, weak)NSLayoutConstraint *bottomCons;
@property (nonatomic, weak)NSLayoutConstraint *iconWidthCons;

@end

@implementation KFMWelcomeView

+ (instancetype)welcomeView {
    return [[self alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        [self setupUI];
    }
    return self;
}
- (void)didMoveToWindow {
    [super didMoveToWindow];
    [self layoutIfNeeded];
    CGFloat margin = UIScreen.mainScreen.bounds.size.height * 0.75;
    _bottomCons.constant = - margin;
    [UIView animateWithDuration:1.0
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:0
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.0 animations:^{
                             self.tipLabel.alpha = 1;
                         } completion:^(BOOL finished) {
                            // [self removeFromSuperview];
                         }];
                     }];
}
#pragma mark -  UI
- (void)layoutSubviews {
    NSLayoutConstraint *backTopC = [NSLayoutConstraint constraintWithItem:_backImageView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0 constant:0];
    NSLayoutConstraint *backLeftC = [NSLayoutConstraint constraintWithItem:_backImageView
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0 constant:0];
    NSLayoutConstraint *backRightC = [NSLayoutConstraint constraintWithItem:_backImageView
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0 constant:0];
    NSLayoutConstraint *backBottomC = [NSLayoutConstraint constraintWithItem:_backImageView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0 constant:0];
    [self addConstraints:@[backTopC,backLeftC,backRightC,backBottomC]];
    
    NSLayoutConstraint *tipTopC = [NSLayoutConstraint constraintWithItem:_tipLabel
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_iconView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0 constant:16];
    NSLayoutConstraint *tipCenterC = [NSLayoutConstraint constraintWithItem:_tipLabel
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:_iconView
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0 constant:0];
    [self addConstraints:@[tipTopC,tipCenterC]];
    
    
}
- (void)setupUI {
    UIImageView *backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ad_background"]];
    backImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat iconViewWidth = 85;
    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_default_big"]];
    iconView.translatesAutoresizingMaskIntoConstraints = NO;
    iconView.layer.cornerRadius = iconViewWidth * 0.5;
    iconView.layer.masksToBounds = YES;
  
    UILabel *tipLabel = [[UILabel alloc]init];
    tipLabel.font = [UIFont systemFontOfSize:17];
    tipLabel.text = @"欢迎回来";
    tipLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:backImageView];
    [self addSubview:iconView];
    [self addSubview:tipLabel];
    
    
    self.iconView = iconView;
    self.tipLabel = tipLabel;
    self.backImageView = backImageView;
    
    // icon的约束
    CGFloat margin = UIScreen.mainScreen.bounds.size.height * 0.25;
    NSLayoutConstraint *iconViewWidthC = [NSLayoutConstraint constraintWithItem:iconView
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1.0
                                                                       constant:iconViewWidth];
    NSLayoutConstraint *iconViewHightC = [NSLayoutConstraint constraintWithItem:iconView
                                                                      attribute:NSLayoutAttributeHeight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:iconView
                                                                      attribute:NSLayoutAttributeWidth
                                                                     multiplier:1.0
                                                                       constant:0];
    NSLayoutConstraint *iconCenterC = [NSLayoutConstraint constraintWithItem:_iconView
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0];
    NSLayoutConstraint *iconBottomC = [NSLayoutConstraint constraintWithItem:_iconView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:-margin];
    [iconView addConstraints:@[iconViewWidthC,iconViewHightC]];
    [self addConstraints:@[iconCenterC,iconBottomC]];
    self.iconWidthCons = iconViewWidthC;
    self.bottomCons = iconBottomC;
}

@end
