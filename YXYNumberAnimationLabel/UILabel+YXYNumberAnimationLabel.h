//
//  UILabel+YXYNumberAnimationLabel.h
//  YXYNumberAnimationLabelDemo
//
//  Created by 杨萧玉 on 14-5-25.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YXYNumberAnimationLabel)
-(void)autochangeFontsize:(double) number;
-(void)changeFromNumber:(double) originalnumber toNumber:(double) newnumber withAnimationTime:(NSTimeInterval)timeSpan;
@end
