//
//  WithdrawMoney.m
//  Beautiful
//
//  Created by pro on 17/3/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WithdrawMoney.h"
#import "SDAutoLayout.h"
//#import "Record.h"
#import "ChooseBank.h"
@interface WithdrawMoney ()

@end

@implementation WithdrawMoney

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"提现"];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self turnPageUp];
    [self explain];
    [self bringMoney];
}
#pragma mark - 返回上一页 -

-(void)turnPageUp{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake( 16, 32, 30/2, 38/2);
    // btn.backgroundColor= [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"icon_return_white-1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnturn{
    // MY * myturn = [[MY alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 跳到说明页 - 
- (void)explain{
    UIButton *btnexplain = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnexplain setTitle:@"提现说明" forState:UIControlStateNormal];
    btnexplain.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnexplain addTarget:self action:@selector(btnState) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnexplain];
    btnexplain.sd_layout
    .rightSpaceToView(self.view,15)
    .topSpaceToView(self.view,36)
    .widthIs(Width/6.25)
    .heightIs(14);
}

- (void)btnState{
//    Record *record = [[Record alloc]init];
//    [self.navigationController pushViewController:record animated:YES];
}

- (void)bringMoney{
    UIView *viewBG = [[UIView alloc]init];
    viewBG.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:viewBG];
    viewBG.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,74.5)
    .widthIs(Width)
    .heightIs(163/2);
    
    //创建手势对象
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self     action:@selector(turnbank)];
    //配置属性
    //轻拍次数
    tap.numberOfTapsRequired =1;
    //轻拍手指个数
    tap.numberOfTouchesRequired =1;
    //讲手势添加到指定的视图上
    [viewBG addGestureRecognizer:tap];

    
    UIImageView *imgIco = [[UIImageView alloc]init];
    imgIco.image = [UIImage imageNamed:@"header"];
    [self.view addSubview:imgIco];
    imgIco.sd_layout
    .leftSpaceToView(self.view,15)
    .bottomSpaceToView(viewBG,-24-Width/10.7143)
    .widthIs(Width/10.7143)
    .heightIs(Width/10.7143);
    
    UILabel *labBank = [[UILabel alloc]init];
    labBank.text = @"中国建设银行";
    labBank.font = [UIFont systemFontOfSize:16];
    labBank.textAlignment = NSTextAlignmentLeft;
    labBank.textColor = UIColorFromRGB(0x222222);
    [self.view addSubview:labBank];
    labBank.sd_layout
    .leftSpaceToView(imgIco,Width/22.0588)
    .bottomSpaceToView(viewBG,-39)
    .widthIs(Width/3.75)
    .heightIs(16);
    
    UILabel *labID = [[UILabel alloc]init];
    labID.text = @"510 **** **** **** 133";
    labID.font = [UIFont systemFontOfSize:11];
    labID.textAlignment = NSTextAlignmentLeft;
    labID.textColor = UIColorFromRGB(0x222222);
    [self.view addSubview:labID];
    labID.sd_layout
    .leftSpaceToView(imgIco,Width/22.0588)
    .topSpaceToView(labBank,9)
    .widthIs(Width/2.14285)
    .heightIs(11);
    
    UIImageView *imgTurn = [[UIImageView alloc]init];
    imgTurn.image = [UIImage imageNamed:@"icon_next_right"];
    [self.view addSubview:imgTurn];
    imgTurn.sd_layout
    .rightSpaceToView(self.view,15)
    .bottomSpaceToView(viewBG,-50)
    .widthIs(10)
    .heightIs(15);
    
    
#pragma mark - 提现金额 - 
    UIView *viewBGTwo = [[UIView alloc]init];
    viewBGTwo.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:viewBGTwo];
    viewBGTwo.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(viewBG,1)
    .widthIs(Width)
    .heightIs(297/2);
    
    UILabel *lableMoney = [[UILabel alloc]init];
    lableMoney.text = @"提现金额";
    lableMoney.font = [UIFont systemFontOfSize:14];
    lableMoney.textColor = UIColorFromRGB(0x222222);
    [self.view addSubview:lableMoney];
    lableMoney.sd_layout
    .leftSpaceToView(self.view,15)
    .bottomSpaceToView(viewBGTwo,-35)
    .widthIs(Width/1.25)
    .heightIs(14);
    
    UIView *viewStriping = [[UIView alloc]init];
    viewStriping.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self.view addSubview:viewStriping];
    viewStriping.sd_layout
    .leftSpaceToView(self.view,15)
    .topSpaceToView(viewBGTwo,-46)
    .widthIs(Width-30)
    .heightIs(1);
    
    UILabel *labIco = [[UILabel alloc]init];
    labIco.text = @"￥";
    labIco.textColor = UIColorFromRGB(0xf5a81f);
    labIco.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:labIco];
    labIco.sd_layout
    .leftSpaceToView(self.view,15)
    .bottomSpaceToView(viewStriping,19)
    .widthIs(20)
    .heightIs(20);
    
    UITextField *textMoney = [[UITextField alloc]init];
    textMoney.text = @"500";
    //textMoney.backgroundColor = [UIColor redColor];
    textMoney.font = [UIFont systemFontOfSize:37];
    textMoney.textAlignment = NSTextAlignmentLeft;
    textMoney.textColor = UIColorFromRGB(0xf5a81f);
    [self.view addSubview:textMoney];
    textMoney.sd_layout
    .leftSpaceToView(labIco,5)
    .bottomSpaceToView(viewStriping,19/2)
    .widthIs(100)
    .heightIs(40);
    
    UILabel *labBalance = [[UILabel alloc]init];
    labBalance.text = @"可提现余额355.00元,";
    labBalance.textColor = UIColorFromRGB(0x999999);
    labBalance.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:labBalance];
    labBalance.sd_layout
    .topSpaceToView(viewStriping,12)
    .leftSpaceToView(self.view,15)
    .widthIs(120)
    .heightIs(12);
    
    UIButton *btnfull = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnfull setTitle:@"全部提现" forState:UIControlStateNormal];
    [btnfull setTitleColor:UIColorFromRGB(0xf5a81f) forState:UIControlStateNormal];
    btnfull.titleLabel.font = [UIFont systemFontOfSize:12.5];
    [self.view addSubview:btnfull];
    btnfull.sd_layout
    .topSpaceToView(viewStriping,12)
    .leftSpaceToView(labBalance,-10)
    .widthIs(65)
    .heightIs(12.5);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //2.设置文字和文字颜色
    [button setTitle:@"确定提现" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    
    //3.设置圆角幅度
        button.layer.cornerRadius = 10.0;
       // button.layer.borderWidth = 1.0;
    //5.设置背景色
    button.backgroundColor =UIColorFromRGB(0x31cdaa);
    
    [self.view addSubview:button];
    button.sd_layout
    .topSpaceToView(viewBGTwo,90/2)
    .leftSpaceToView(self.view,31/2)
    .rightSpaceToView(self.view,29/2)
    .heightIs(44);
    
    UILabel *labTime = [[UILabel alloc]init];
    labTime.text = @"五个工作日内到账";
    labTime.textColor = UIColorFromRGB(0x999999);
    labTime.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:labTime];
    labTime.sd_layout
    .topSpaceToView(button,10)
    .centerXEqualToView(self.view)
    .widthIs(Width/3.2)
    .heightIs(14);
    
}
- (void)turnbank{
    ChooseBank *choosebank = [[ChooseBank alloc]init];
    [self.navigationController pushViewController:choosebank animated:YES];
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
