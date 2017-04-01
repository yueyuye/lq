//
//  WDYHJViewController.m
//  xiupin
//
//  Created by pro on 17/2/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WDYHJViewController.h"
#import "MY.h"
@interface WDYHJViewController ()

@end

@implementation WDYHJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"我的优惠券"];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    [self WDYHJ];
    [self turnMY];

}

- (void)turnMY{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake( 16, 32, 30/2, 38/2);
    // btn.backgroundColor= [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"icon_return_white-1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)btnturn{
   // MY *my = [[MY alloc]init];
    [self.navigationController popViewControllerAnimated:YES];}

 - (void)WDYHJ{
     
     UIView *viewBJ = [[UIView alloc]init];
     viewBJ.frame = CGRectMake( 0, 64, Width, 615/2);
     viewBJ.backgroundColor = UIColorFromRGB(0xffffff);
     [self.view addSubview:viewBJ];
     
     
     
     for (int i=0; i<3; i++) {
         UIButton *discountBtn=[UIButton buttonWithType:UIButtonTypeCustom];
         discountBtn.frame=CGRectMake(15, 37/2+194/2*i, Width-30, 80);
         discountBtn.backgroundColor=UIColorFromRGB(0xfffee2);
         [viewBJ addSubview:discountBtn];
         
         UILabel *discountLab=[UILabel new];
         discountLab.text=@"￥";
         //discountLab.backgroundColor = [UIColor redColor];
         discountLab.font=[UIFont systemFontOfSize:18];
         discountLab.frame=CGRectMake(20, 45, 20, 18);
         discountLab.textColor=UIColorFromRGB(0xff718d);
         [discountBtn addSubview:discountLab];
         
         UILabel *tenLab=[UILabel new];
         tenLab.text=@"10";
         tenLab.font=[UIFont systemFontOfSize:60];
         tenLab.frame=CGRectMake(35, 18, 70, 45);
         tenLab.textColor=UIColorFromRGB(0xff718d);
         [discountBtn addSubview:tenLab];
         
         UILabel *commonlyLab=[UILabel new];
         commonlyLab.text=@"通用优惠券";
         commonlyLab.font=[UIFont systemFontOfSize:17];
         commonlyLab.frame=CGRectMake(115, 23, 85, 17);
         commonlyLab.textColor=UIColorFromRGB(0x7a7a7a);
         [discountBtn addSubview:commonlyLab];
         
         
         UILabel *dateLab=[UILabel new];
         dateLab.text=@"2017-03-01到期";
         dateLab.font=[UIFont systemFontOfSize:12];
         dateLab.frame=CGRectMake(115, 49, 90, 10);
         dateLab.textColor=UIColorFromRGB(0x909082);
         [discountBtn addSubview:dateLab];
         
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
