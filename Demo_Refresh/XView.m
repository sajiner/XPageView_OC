//
//  XView.m
//  Demo_Refresh
//
//  Created by sajiner on 2017/3/28.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "XView.h"

@interface XView () {
    UILabel *_label1;
    UILabel *_label2;
    UILabel *_label3;
    BOOL _isShow;
}

@end

@implementation XView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initElement];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initElement];
    }
    return self;
}

- (void)initElement {
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"12334";
    label1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label1];
    label1.backgroundColor = [UIColor redColor];
    _label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"12334";
    label2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label2];
    label2.backgroundColor = [UIColor blueColor];
    _label2 = label2;
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"12334";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.backgroundColor = [UIColor orangeColor];
    [self addSubview:label3];
    _label3 = label3;
}

- (void)layoutSubviews {
    _label1.frame = CGRectMake(10, 10, self.bounds.size.width - 20, 40);
    if (_isShow) {
        _label2.frame = CGRectMake(10, CGRectGetMaxY(_label1.frame), self.bounds.size.width - 20, 40);
        _label3.frame = CGRectMake(10, CGRectGetMaxY(_label2.frame), self.bounds.size.width - 20, 40);
    } else {
        _label3.frame = CGRectMake(10, CGRectGetMaxY(_label1.frame), self.bounds.size.width - 20, 40);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    _isShow = !_isShow;
    [self layoutIfNeeded];
    [self setNeedsLayout];
}

@end
