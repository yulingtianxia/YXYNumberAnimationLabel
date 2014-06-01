//
//  UILabel+YXYNumberAnimationLabel.h
//  YXYNumberAnimationLabelDemo
//
//  Created by 杨萧玉 on 14-5-25.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^NumberSizeBlock)(double number);

@interface UILabel (YXYNumberAnimationLabel)


-(void)changeFromNumber:(double) originalnumber toNumber:(double) newnumber withAnimationTime:(NSTimeInterval)timeSpan;
-(double)animationSpeed;
-(void)setAnimationSpeed:(double)speed;
-(NumberSizeBlock)numberSizeBlock;
-(void)setNumberSizeBlock:(NumberSizeBlock) numberSizeBlock;
@end
