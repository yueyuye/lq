//
//  UIView+Place.m
//  xiupin
//
//  Created by mac on 17/3/1.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "UIView+Place.h"

@implementation UIView (Place)

- (CGFloat)marginY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)marginX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)ViewWidth
{
    return self.frame.size.width;
}

- (CGFloat)ViewHeight
{
    return self.frame.size.height;
}

- (CGFloat)orginX
{
    return self.frame.origin.x;
}

- (CGFloat)orginY
{
    return self.frame.origin.y;
}

@end