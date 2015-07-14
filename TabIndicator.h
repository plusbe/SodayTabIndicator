//
//  TabIndicator.h
//  ChengXing
//
//  Created by qishui on 15/7/8.
//  Copyright (c) 2015年 QiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabIndicatorItem;
@class TabIndicator;

@protocol TabIndicatorDelegate
-(int) getTabCount;
-(TabIndicatorItem *)getIndicatorItemWithIndex:(int) index;
-(UIView *)getContentViewWithIndex:(int) index;
@end

@interface TabIndicator : UIView
@property (nonatomic, weak) id<TabIndicatorDelegate> tabIndicatorDelegate;
-(void)setItemSelected:(int) index;
@end
