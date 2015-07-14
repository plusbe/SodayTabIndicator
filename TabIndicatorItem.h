//
// Created by qishui on 15/7/14.
// Copyright (c) 2015 QiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabIndicator.h"

@interface TabIndicatorItem : UIView
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) int index;
@property (nonatomic, weak) TabIndicator* indicator;

-(void)setMSelected:(Boolean) flag;

@end