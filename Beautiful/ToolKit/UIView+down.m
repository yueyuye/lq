//
//  UIView+down.m
//  24kala
//
//  Created by mac on 16/11/28.
//
//

#import "UIView+down.h"

@implementation UIView (down)
-(void)down{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}
-(void)tap :(UITapGestureRecognizer *)tap1{
    [self endEditing:YES];
}
@end
