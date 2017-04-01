//
//  Neck_RollVC.m
//  Beautiful
//
//  Created by mac on 17/3/3.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "Neck_RollVC.h"

@interface Neck_RollVC ()
{
    NSArray *lingjuanarry;
    NSMutableArray *rollarry;
}
@end

@implementation Neck_RollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"领卷"];
    [self addBackButton];
    self.view.backgroundColor  =UIColorFromRGB(0xffffff);
    rollarry = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    lingjuanarry = @[@"通用优惠券",@"2017-03-01到期"];
    
    
    
    
    for (int k = 0; k<rollarry.count; k++) {
        UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(15, 83+k*30+k*80, Width-30, 100)];
        yellowView.backgroundColor =[UIColor whiteColor];
        [self.view addSubview:yellowView];
      
    
    
    UIButton * lingqubtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    lingqubtn.frame =CGRectMake(0, 10, Width-30, 80);
    [lingqubtn setBackgroundImage:[UIImage imageNamed:@"icon_coupon"] forState:UIControlStateNormal];
    
    [yellowView addSubview:lingqubtn];
    
    
    UILabel * numlab= [[UILabel alloc]initWithFrame:CGRectMake(35,20,70, 65)];
    numlab.text =@"10";
    numlab.textColor =UIColorFromRGB(0xff718d);
    numlab.font = [UIFont systemFontOfSize:58];
    [yellowView addSubview:numlab];
    
    
    for (int i = 0; i<2; i++) {
        UILabel * riqilab= [[UILabel alloc]initWithFrame:CGRectMake(100,35+i*20,90, 20)];
        riqilab.text =[lingjuanarry objectAtIndex:i];
        riqilab.textColor =UIColorFromRGB(0x7a7a6f);
        if (i == 0) {
            riqilab.font = [UIFont systemFontOfSize:17];
        }
        else{
            riqilab.font = [UIFont systemFontOfSize:12];
        }
        [yellowView addSubview:riqilab];
       }
    }
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
