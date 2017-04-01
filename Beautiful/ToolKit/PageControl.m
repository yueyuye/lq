//
//  PageControl.m
//  xiupin
//
//  Created by mac on 17/2/17.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "PageControl.h"
#define dotW 7
#define activeDotW 6
#define magrin 5
@implementation PageControl

//- (void) setCurrentPage:(NSInteger)page {
//    [super setCurrentPage:page];
//    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
//        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
//        CGSize size;
//        size.height = 20;
//        size.width = 12;
//        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
//                                     size.width,size.height)];
////        if (subviewIndex == page) [subview setImage:[UIImage imageNamed:@"BluePoint.png"]];
////        else [subview setImage:[UIImage imageNamed:@"BlackPoint.png"]];
//    }
//}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = 10;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    
    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        if (i == self.currentPage) {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, 7,7)];
        }else {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
        }
    }
}
@end
