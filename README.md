YXYNumberAnimationLabel
=======================

一个数字动画Label  

![](demo.gif)

设置AnimationSpeed属性的值可以调节动画变化速度，getter/setter方法如下：  

``` 
-(double)AnimationSpeed;
-(void)setAnimationSpeed:(double)speed;
``` 

字体会根据数字位数来自动调节字体大小，你也可以通过实现numberSizeBlock来自定义字体大小，例如：

``` 
[self.numberLabel setNumberSizeBlock:^(double number) {
        self.numberLabel.font = [UIFont fontWithName:self.numberLabel.font.fontName size:30.0];
}];
``` 
