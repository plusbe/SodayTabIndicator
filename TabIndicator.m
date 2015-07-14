//
//  TabIndicator.m
//  ChengXing
//
//  Created by qishui on 15/7/8.
//  Copyright (c) 2015年 QiCheng. All rights reserved.
//

#import "TabIndicator.h"
#import "TabIndicatorItem.h"

@implementation TabIndicator{
    NSMutableArray *itemArray;
    int currentIndex;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        itemArray = [[NSMutableArray alloc] init];
        currentIndex = 0;
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if(self.tabIndicatorDelegate == nil){
        return;
    }

    [self initTabItems];
}

-(void)initTabItems{
    int count = [self.tabIndicatorDelegate getTabCount];
    for(int i = 0 ;i < count;i++){
        TabIndicatorItem *item = [self.tabIndicatorDelegate getIndicatorItemWithIndex:i];
        item.index = i;
        [itemArray addObject:item];

        [self addSubview:item];
        [self layoutItems];
    }
}

-(void)layoutItems{
    for(NSUInteger i  = 0 ; i < itemArray.count; i++){
        if(i == 0){//第一个
            [itemArray[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.width.equalTo(self.mas_width).multipliedBy((CGFloat) (1/4.0));
            }];
        }else{
            [itemArray[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(((UIView *)itemArray[i-1]).mas_right);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.width.equalTo(self.mas_width).multipliedBy((CGFloat) (1/4.0));
            }];
        }
    }
    [self setItemSelected:0];
}

- (void)setItemSelected:(int)index {
    [itemArray[currentIndex] setMSelected:NO];
    [itemArray[index] setMSelected:YES];

    UIView *contentView = [self.tabIndicatorDelegate getContentViewWithIndex:index];
    UIView *contentSuperView = contentView.superview;
    [contentSuperView bringSubviewToFront:contentView];
    currentIndex = index;
}

@end
