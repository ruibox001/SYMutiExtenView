//
//  CircleProgressView.m
//  SmartHome3.0
//
//  Created by 王声远 on 15/7/15.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import "SYMutiExtenView.h"

@interface SYMutiExtenView()

@property (nonatomic,assign) CGFloat circleRadius;

//逐渐扩大的渐变透明度
@property (nonatomic,assign) CGFloat myAlpha;

@property (nonatomic,assign) CGFloat rColor;
@property (nonatomic,assign) CGFloat gColor;
@property (nonatomic,assign) CGFloat bColor;

@property (nonatomic,assign) BOOL start;

@end

@implementation SYMutiExtenView

+ (instancetype)shareMutiExtenViewWithFrame:(CGRect)frame colorRGBArray:(NSArray *)rgbArrays
{
    return [[self alloc] initWithFrame:frame colorRGBArray:rgbArrays];
}

- (id)initWithFrame:(CGRect)frame colorRGBArray:(NSArray *)rgbArrays
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        if (rgbArrays && rgbArrays.count == 3) {
            self.rColor = [rgbArrays[0] floatValue] / 255.0;
            self.gColor = [rgbArrays[1] floatValue] / 255.0;
            self.bColor = [rgbArrays[2] floatValue] / 255.0;
        }
        else{
            self.rColor = 0.2;
            self.gColor = 0.2;
            self.bColor = 0.2;
        }
        
        _percent = 0;
    }
    return self;
}

- (void)startAnimation {
    self.start = YES;
    [self dos];
}

- (void)stopAnimation {
    self.start = NO;
}

- (void)setPercent:(float)percent {
    _percent = percent;
}

- (void)dos {
    
    if (!self.start) {
        return;
    }
    
    self.myAlpha = 1.0 - _percent;
    _circleRadius = self.frame.size.width*0.9 *_percent;
    [self setNeedsDisplay];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _percent += 0.01;
        if (_percent > 1.0) {
            _percent = 0;
        }
        [self dos];
    });
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [self addArcBackColor:contextRef];
}

- (void)addArcBackColor:(CGContextRef)contextRef
{
    CGSize viewSize = self.bounds.size;
    CGPoint center = CGPointMake(viewSize.width / 2, viewSize.height / 2);
    CGFloat radius = _circleRadius / 2;
    CGContextSetRGBFillColor(contextRef, self.rColor, self.gColor, self.bColor, self.myAlpha);
    CGContextAddArc(contextRef, center.x, center.y, radius, 0, 2*M_PI, 0);
    CGContextDrawPath(contextRef, kCGPathFill);
}

@end
