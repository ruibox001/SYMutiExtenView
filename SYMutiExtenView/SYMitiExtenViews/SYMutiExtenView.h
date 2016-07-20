//
//  CircleProgressView.h
//  SmartHome3.0
//
//  Created by 王声远 on 15/7/15.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SYMutiExtenView : UIView

//百分比数值（0-1）
@property (assign, nonatomic) float percent;
+ (instancetype)shareMutiExtenViewWithFrame:(CGRect)frame colorRGBArray:(NSArray *)rgbArrays;
- (void)startAnimation;
- (void)stopAnimation;

@end
