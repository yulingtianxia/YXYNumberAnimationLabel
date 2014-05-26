//
//  UILabel+YXYNumberAnimationLabel.m
//  YXYNumberAnimationLabelDemo
//
//  Created by 杨萧玉 on 14-5-25.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//
#define AnimationSpeed 100
#import "UILabel+YXYNumberAnimationLabel.h"

@implementation UILabel (YXYNumberAnimationLabel)

-(void)autochangeFontsize:(double) number{
    if (number<100000) {
        [self setFont:[UIFont fontWithName:self.font.fontName size:60.0]];
    }
    else if (number<1000000){
        [self setFont:[UIFont fontWithName:self.font.fontName size:50.0]];
    }
    else if (number<10000000){
        [self setFont:[UIFont fontWithName:self.font.fontName size:40.0]];
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
            if (labs((newnumber-originalnumber)/AnimationSpeed)<1) {
                [self changeFromNumber:newnumber toNumber:newnumber withAnimationTime:timeSpan];
            }
            //        else if (originalnumber+(newnumber-originalnumber)/IncreaseSpeed<=newnumber) {
            else if(labs((newnumber-originalnumber)/AnimationSpeed)<labs(newnumber-originalnumber)){
                [self changeFromNumber:originalnumber+(newnumber-originalnumber)/AnimationSpeed toNumber:newnumber withAnimationTime:timeSpan];
                
            }
            else if(originalnumber==newnumber){
                //            [self changeFromNumber:newnumber toNumber:newnumber withAnimationTime:timeSpan];
                
            }
        });
        
    }];
    
}
@end
