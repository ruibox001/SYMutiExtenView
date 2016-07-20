//
//  CircleProgressView.h
//  SmartHome3.0
//
//  Created by 王声远 on 15/7/15.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYMutiExtenProgressView : UIView

+ (instancetype)shareMutiExtenProgressViewWithFrame:(CGRect)frame extenCount:(int)extenCount colorRGBArray:(NSArray *)rgbArrays;
+ (instancetype)shareMutiExtenProgressViewWithFrame:(CGRect)frame extenCount:(int)extenCount extenColorWithRGB:(uint32_t)rgbValue;

- (void)startAnimation;
- (void)stopAnimation;

@end
