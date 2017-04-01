//
//  XP_BaseViewController.m
//  xiupin
//
//  Created by mac on 17/2/20.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "XP_BaseViewController.h"
#import "IQKeyboardManager.h"
@interface XP_BaseViewController ()

@end

@implementation XP_BaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
  
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setNavigationBar:(NSString *)title
{
    _titleview = [UIView new];
    _titleview.frame = CGRectMake(0, 0, Width, 64);
    _titleview.backgroundColor = UIColorFromRGB(0x31cdaa);
    [self.view addSubview:_titleview];
    [self.view bringSubviewToFront:_titleview];
    if (title)
    {
        UILabel *titleLabel = [UILabel new];
        titleLabel.frame = CGRectMake(Width/2-(Width - 44 - 88)/2, 20, Width - 44 - 88, 44);
        titleLabel.textColor = UIColorFromRGB(0xffffff);
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleview addSubview:titleLabel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBackButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"icon_return_white-1"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, 44, 44);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_titleview addSubview:button];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
