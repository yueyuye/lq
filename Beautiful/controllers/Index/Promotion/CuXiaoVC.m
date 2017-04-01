//
//  CuXiaoVC.m
//  xiupin
//
//  Created by mac on 17/2/27.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "CuXiaoVC.h"

@interface CuXiaoVC ()
{
    UIView *whietvi;
    UIView *businessvi;
    UIView *businessView;
}
@end

@implementation CuXiaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"促销活动"];
    [self addBackButton];
    [self imgvi];
    
    [self wheitview];
    [self lable];
}


-(void)imgvi{
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, Width, 216)];
    img.image = [UIImage imageNamed:@"banner-1"];
    [self.view addSubview:img];
}


-(void)wheitview{
    
    whietvi = [[UIView alloc]initWithFrame:CGRectMake(0, 280, Width, 68)];
    whietvi.backgroundColor =UIColorFromRGB(0xffffff);
    [self.view addSubview:whietvi];
    
    
    businessvi = [[UIView alloc]initWithFrame:CGRectMake(0, 280+68+10, Width, 107)];
    businessvi.backgroundColor =UIColorFromRGB(0xffffff);
    [self.view addSubview:businessvi];
    
    businessView=[UIView new];
    businessView.frame=CGRectMake(0,280+88+107, Width,Height-(280+88+107));
    businessView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:businessView];
}


-(void)lable{
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(15,12, Width-30, 40)];
    lable.text=@"活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称";
    lable.textColor=UIColorFromRGB(0x222222);
    lable.numberOfLines = 0;
    lable.font = [UIFont systemFontOfSize:15];
    [whietvi addSubview:lable];
    
    
    
    UIImageView *timeImg=[UIImageView new];
    timeImg.frame=CGRectMake(15, 18, 18, 18);
    timeImg.image=[UIImage imageNamed:@"icon_time"];
    [businessvi addSubview:timeImg];
    
    UILabel *businessLabel=[UILabel new];
    businessLabel.frame=CGRectMake(39, 15, Width-40, 18);
    businessLabel.text=@"2017年1月11日 -- 2017年2月17日";
    businessLabel.textColor=UIColorFromRGB(0x222222);
    businessLabel.font=[UIFont systemFontOfSize:14];
    [businessvi addSubview:businessLabel];
    

    UILabel *lineLab=[UILabel new];
    lineLab.frame=CGRectMake(15, businessvi.ViewHeight/2-.5, Width-30, 1);
    lineLab.backgroundColor=UIColorFromRGB(0xe9e9e9);
    [businessvi addSubview:lineLab];
    
    UIImageView *GPSImg=[UIImageView new];
    GPSImg.frame=CGRectMake(15,businessvi.ViewHeight-38, 18, 18);
    GPSImg.image=[UIImage imageNamed:@"icon_site"];
    [businessvi addSubview:GPSImg];
    
    UILabel *GPSLabel=[UILabel new];
    GPSLabel.frame=CGRectMake(40,businessvi.ViewHeight-35,Width-80, 15);
    GPSLabel.text=@"成都市益州大道南段888号益州国际广场";
    GPSLabel.textColor=UIColorFromRGB(0x222222);
    GPSLabel.font=[UIFont systemFontOfSize:13];
    [businessvi addSubview:GPSLabel];
    
    UIButton *distanceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    distanceBtn.frame=CGRectMake(Width-50,businessvi.ViewHeight-38, 40, 40);
    [distanceBtn addTarget:self action:@selector(distanceButton:) forControlEvents:UIControlEventTouchUpInside];
    [businessvi addSubview:distanceBtn];
    
    UILabel *distanceLab=[UILabel new];
    distanceLab.text=@"2.6KM";
    distanceLab.textColor=UIColorFromRGB(0x31cdaa);
    distanceLab.frame=CGRectMake(Width-52,businessvi.ViewHeight-45, 37, 24);
    distanceLab.textAlignment = NSTextAlignmentRight;
    distanceLab.font=[UIFont systemFontOfSize:11];
    [businessvi addSubview:distanceLab];
    
    UIImageView *distanceImg=[UIImageView new];
    distanceImg.image=[UIImage imageNamed:@"icon_position"];
    distanceImg.frame=CGRectMake(Width-40,businessvi.ViewHeight-25, 10, 10);
    [businessvi addSubview:distanceImg];
    

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 18, 3, 21)];
    lab.backgroundColor = UIColorFromRGB(0xf5a81f);
    [businessView addSubview:lab];
    
    UILabel *Eventlab = [[UILabel alloc]initWithFrame:CGRectMake(25, 18, 100, 20)];
    Eventlab.text = @"活动详情";
    Eventlab.font = [UIFont systemFontOfSize:14];
    Eventlab.textAlignment = NSTextAlignmentLeft;
    Eventlab.textColor = UIColorFromRGB(0x222222);
    
    [businessView addSubview:Eventlab];
    
    
    UILabel *detailslab = [[UILabel alloc]initWithFrame:CGRectMake(15, 40,Width-30, 20)];
    detailslab.text = @"        活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情\n        活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动\n        详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详\n        情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情";
    detailslab.font = [UIFont systemFontOfSize:13];
    detailslab.textAlignment = NSTextAlignmentLeft;
    detailslab.textColor = UIColorFromRGB(0x7a7a7a);
    detailslab.numberOfLines = 0;
    [detailslab sizeToFit];
    [businessView addSubview:detailslab];
    
}
-(void)distanceButton:(UIButton *)bttn{
   
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
