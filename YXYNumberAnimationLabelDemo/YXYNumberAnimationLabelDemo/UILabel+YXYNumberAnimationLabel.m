//
//  UILabel+YXYNumberAnimationLabel.m
//  YXYNumberAnimationLabelDemo
//
//  Created by 杨萧玉 on 14-5-25.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//
//#define AnimationSpeed 100
#import "UILabel+YXYNumberAnimationLabel.h"
#import <objc/runtime.h>

@implementation UILabel (YXYNumberAnimationLabel)

-(void)autochangeFontsize:(double) number{
    if (self.numberSizeBlock == NULL) {
        if (number<100000) {
            [self setFont:[UIFont fontWithName:self.font.fontName size:60.0]];
        }
        else if (number<1000000){
            [self setFont:[UIFont fontWithName:self.font.fontName size:50.0]];
        }
        else if (number<10000000){
            [self setFont:[UIFont fontWithName:self.font.fontName size:40.0]];
        }
        else if (number<100000000){
            [self setFont:[UIFont fontWithName:self.font.fontName size:30.0]];
        }
    }
    else {
        self.numberSizeBlock(number);
    }
}
-(void)changeFromNumber:(double) originalnumber toNumber:(double) newnumber withAnimationTime:(NSTimeInterval)timeSpan{
    
    [UIView animateWithDuration:timeSpan delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        NSString *currencyStr = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithDouble: originalnumber]  numberStyle:NSNumberFormatterCurrencyStyle];
        currencyStr = [currencyStr substringWithRange:NSMakeRange(1, currencyStr.length-2)];
        if ([[currencyStr substringFromIndex:currencyStr.length-1] isEqualToString:@"0"]) {
            currencyStr =[currencyStr substringToIndex:currencyStr.length-2];
        }
        [self autochangeFontsize:originalnumber];
        self.text = currencyStr;
        
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeSpan * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (labs((newnumber-originalnumber)/self.animationSpeed)<1) {
                [self changeFromNumber:newnumber toNumber:newnumber withAnimationTime:timeSpan];
            }
            else if(labs((newnumber-originalnumber)/self.animationSpeed)<labs(newnumber-originalnumber)){
                [self changeFromNumber:originalnumber+(newnumber-originalnumber)/self.animationSpeed toNumber:newnumber withAnimationTime:timeSpan];
                
            }
            else if(originalnumber==newnumber){
                //            [self changeFromNumber:newnumber toNumber:newnumber withAnimationTime:timeSpan];
                
            }
        });
        
    }];
    
}

-(double)animationSpeed{
    double speed = ((NSNumber *)objc_getAssociatedObject(self, @selector(animationSpeed))).doubleValue;
    if (!speed) {
        speed = 100;
    }
    return speed;
}

-(void)setAnimationSpeed:(double)speed{
    objc_setAssociatedObject(self, @selector(animationSpeed), [NSNumber numberWithDouble:speed], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NumberSizeBlock)numberSizeBlock{
    return objc_getAssociatedObject(self, @selector(numberSizeBlock));
}

-(void)setNumberSizeBlock:(NumberSizeBlock) numberSizeBlock{
    objc_setAssociatedObject(self, @selector(numberSizeBlock), numberSizeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

@end
