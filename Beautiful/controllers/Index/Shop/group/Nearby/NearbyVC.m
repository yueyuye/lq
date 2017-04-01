//
//  NearbyVC.m
//  Beautiful
//
//  Created by mac on 17/3/14.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "NearbyVC.h"
#import "sousuoOneVC.h"
@interface NearbyVC ()<UITextFieldDelegate>
{
    UIView *ssview;
    UIButton *ssbtn;
}
@end

@implementation NearbyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@""];
    [self addBackButton];
    [self titiview];
    
    [self nearby];
    
    
    
    
}
-(void)titiview{
    ssview = [[UIView alloc]initWithFrame:CGRectMake(40, 27, Width- 60, 29)];
    ssview.backgroundColor = [UIColor whiteColor];
    ssview.layer.cornerRadius = 29/2;
    [self.titleview addSubview:ssview];
    
    ssbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ssbtn.frame = CGRectMake(15,7, 15, 15);
    [ssbtn setImage:[UIImage imageNamed:@"icon_serach"] forState:UIControlStateNormal];
    [ssbtn addTarget:self action:@selector(ssbtn:) forControlEvents:UIControlEventTouchUpInside];
    [ssview addSubview:ssbtn];
    
    UITextField * titifield = [[UITextField alloc]initWithFrame:CGRectMake(37, 7, ssview.frame.size.width-40,14)];
    titifield.placeholder = @"请输入关键字";
    titifield.delegate = self;
    titifield.clearButtonMode = UITextFieldViewModeAlways;
    [ssview addSubview:titifield];
}
-(void)nearby{
    UIView *whietvi = [[UIView alloc]initWithFrame:CGRectMake(0, 218+64, Width,48)];
    whietvi.backgroundColor  =UIColorFromRGB(0xffffff);
    [self.view addSubview:whietvi];
    
    
    for (int i = 0; i <2; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =CGRectMake(15+66*i, whietvi.ViewHeight/2-10, 66, 20);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [whietvi addSubview:button];
        
        if (i == 0) {
            [button setTitle:@"店铺" forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
           
        }
        else{
            [button setTitle:@"商品" forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        }
    }
    
}
-(void)ssbtn:(UIButton*)ssbtnn{
    sousuoOneVC *ssVC = [[sousuoOneVC alloc]init];
    ssVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ssVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
