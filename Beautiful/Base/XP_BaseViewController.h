//
//  XP_BaseViewController.h
//  xiupin
//
//  Created by mac on 17/2/20.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDAutoLayout.h"

@interface XP_BaseViewController : UIViewController

@property (strong, nonatomic) UIView *titleview;

- (void)setNavigationBar:(NSString *)title;
- (void)addBackButton;

@end
