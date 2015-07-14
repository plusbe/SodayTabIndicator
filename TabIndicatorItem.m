//
// Created by qishui on 15/7/14.
// Copyright (c) 2015 QiCheng. All rights reserved.
//

#import "TabIndicatorItem.h"
#import "TabIndicator.h"


@implementation TabIndicatorItem {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }

    return self;
}


-(void)setupViews{
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];

    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleClick:)];
    [self addGestureRecognizer:recognizer];
    [self changeToUnSelected];
}

- (void)setMSelected:(Boolean)flag {
    if(flag){
        [self changeToSelected];
    }else{
        [self changeToUnSelected];
    }
}

-(void)changeToSelected{
    self.backgroundColor = [UIColor redColor];
}

-(void)changeToUnSelected{
    self.backgroundColor = [UIColor grayColor];
}

-(void)handleClick:(UITapGestureRecognizer *)recognizer{
    [self.indicator setItemSelected:self.index];
}


@end