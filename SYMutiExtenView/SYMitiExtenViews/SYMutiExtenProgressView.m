//
//  CircleProgressView.m
//  SmartHome3.0
//
//  Created by 王声远 on 15/7/15.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import "SYMutiExtenProgressView.h"
#import "SYMutiExtenView.h"

@interface SYMutiExtenProgressView()

@property (nonatomic,strong) NSMutableArray *views;

@end

@implementation SYMutiExtenProgressView

+ (instancetype)shareMutiExtenProgressViewWithFrame:(CGRect)frame extenCount:(int)extenCount colorRGBArray:(NSArray *)rgbArrays
{
    return [[self alloc] initWithFrame:frame extenCount:extenCount colorRGBArray:rgbArrays];
}

+ (instancetype)shareMutiExtenProgressViewWithFrame:(CGRect)frame extenCount:(int)extenCount extenColorWithRGB:(uint32_t)rgbValue {
    return [[self alloc] initWithFrame:frame extenCount:extenCount extenColorWithRGB:rgbValue];
}

- (id)initWithFrame:(CGRect)frame extenCount:(int)extenCount extenColorWithRGB:(uint32_t)rgbValue
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *ary = @[@((rgbValue & 0xFF0000) >> 16),@((rgbValue & 0xFF00) >> 8),@(rgbValue & 0xFF)];
        for (int i = 0; i < extenCount; i ++) {
            SYMutiExtenView *extenView = [SYMutiExtenView shareMutiExtenViewWithFrame:self.bounds colorRGBArray:ary];
            [self addSubview:extenView];
            [self.views addObject:extenView];
        }
        [self startWithProgress];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame extenCount:(int)extenCount colorRGBArray:(NSArray *)rgbArrays
{
    self = [super initWithFrame:frame];
    if (self)
    {
        for (int i = 0; i < extenCount; i ++) {
            SYMutiExtenView *vs = [SYMutiExtenView shareMutiExtenViewWithFrame:self.bounds colorRGBArray:rgbArrays];
            [self addSubview:vs];
            [self.views addObject:vs];
        }
        [self startWithProgress];
    }
    return self;
}

- (void)startWithProgress {
    CGFloat p = 1.0/self.views.count;
    for (int i = 0; i < self.views.count; i ++) {
        SYMutiExtenView *vs = self.views[i];
        vs.percent = p*(i+1);
    }
}

- (NSMutableArray *)views {
    if (!_views) {
        _views = [NSMutableArray array];
    }
    return _views;
}

- (void)startAnimation {
    for (SYMutiExtenView *vs in self.views) {
        [vs startAnimation];
    }
}

- (void)stopAnimation {
    for (SYMutiExtenView *vs in self.views) {
        [vs stopAnimation];
    }
}

@end
