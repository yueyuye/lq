//
//  MyWalletVC.m
//  Beautiful
//
//  Created by mac on 17/3/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyWalletVC.h"
#import "WithdrawMoney.h"
@interface MyWalletVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *Withdrawview;
    
    NSArray * labarry;
    
    
    NSMutableArray *Detailsmuarry;
}
@end

@implementation MyWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"我的钱包"];
    [self addBackButton];
    labarry = @[@"今日分红：2658元",@"累积分红：9587元",@"现有分红：2658元",@"现有积分：9587元"];
    Detailsmuarry = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", nil];
    
    
    
     [self Withdrawview];
     [self Detailsview];
}
-(void)Withdrawview{
    
    Withdrawview = [UIView new];
    Withdrawview.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:Withdrawview];
    Withdrawview.sd_layout.topSpaceToView(self.view,64).leftSpaceToView(self.view,0).widthIs(Width).heightIs(166);
    
    //横线view
    UIView *view = [UIView new];
    view.backgroundColor =UIColorFromRGB(0xd4d6d5);
    [Withdrawview addSubview:view];
    view.sd_layout.widthIs(Width).heightIs(.5).topSpaceToView(Withdrawview,165).leftSpaceToView(Withdrawview,0);
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, 200, 20)];
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.text = @"我的钱包现有金额：3518元";
    textLabel.textColor = UIColorFromRGB(0x7a7a7a);
    [Withdrawview addSubview:textLabel];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textLabel.text]; // 改变特定范围颜色大小要用的
    NSRange r2 = NSMakeRange(9,5);
    [attributedString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xfe8525) range:r2];
    [textLabel setAttributedText:attributedString];
    
    
    UILabel *lab = [UILabel new];
    lab.text =@"可直接用于购物，提现需要扣除税收等费用";
    lab.textAlignment = NSTextAlignmentLeft;
    lab.textColor =UIColorFromRGB(0xff0000);
    lab.font = [UIFont systemFontOfSize:12];
    [Withdrawview addSubview:lab];
    lab.sd_layout.widthIs(280).heightIs(20).topSpaceToView(Withdrawview,51).leftSpaceToView(Withdrawview,15);
    
    for (int k = 0; k <labarry.count; k++) {
        UILabel *forlab = [[UILabel alloc]initWithFrame:CGRectMake(k%2*120+k%2*70+15, 83+k/2*40, 120, 20)];
        forlab.text =labarry[k];
        forlab.textAlignment = NSTextAlignmentCenter;
        forlab.textColor =UIColorFromRGB(0x7a7a7a);
        forlab.font = [UIFont systemFontOfSize:14];
        [Withdrawview addSubview:forlab];
        
        
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:forlab.text]; // 改变特定范围颜色大小要用的
        NSRange labcolor = NSMakeRange(5,5);
        [attriString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xfe8525) range:labcolor];
        [forlab setAttributedText:attriString];
       
    }
  //竖线view
    UIView *view2 = [UIView new];
    view2.backgroundColor =UIColorFromRGB(0xd4d6d5);
    [Withdrawview addSubview:view2];
    view2.sd_layout.widthIs(1).heightIs(45).topSpaceToView(Withdrawview,90).leftSpaceToView(Withdrawview,170);
    
    UIButton *tixianbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tixianbutton setTitle:@"提现" forState:UIControlStateNormal];
    [tixianbutton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    tixianbutton.backgroundColor = UIColorFromRGB(0x31cdaa);
    tixianbutton.layer.cornerRadius = 5;
    tixianbutton.clipsToBounds = YES;
    tixianbutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [tixianbutton addTarget:self action:@selector(tixianbuttonCilk:) forControlEvents:UIControlEventTouchUpInside];
    [Withdrawview addSubview:tixianbutton];
    tixianbutton.sd_layout.widthIs(60).heightIs(30).topSpaceToView(Withdrawview,20).rightSpaceToView(Withdrawview,15);
}
-(void)Detailsview{
    UITableView *Detailstable = [[UITableView alloc]initWithFrame:CGRectMake(0, 240, Width, 95+Detailsmuarry.count * 37)];
    Detailstable.dataSource =self;
    Detailstable.delegate = self;
    Detailstable.separatorStyle = NO;
    Detailstable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:Detailstable];
    
    
    if (Detailstable.frame.origin.y+50+Detailstable.ViewHeight>Height) {
        Detailstable.scrollEnabled = YES;
        CGRect frame =  Detailstable.frame;
        frame.size.height = Height-290;
        Detailstable.frame = frame;
        
    }else{
        Detailstable.scrollEnabled = NO;
    }
    
   }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return Detailsmuarry.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 95;
    }
    return 37;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        for (int p = 0; p<2; p++) {
            UIView *view = [UIView new];
            view.frame = CGRectMake(0, 50*p+45, Width, .5);
            view.backgroundColor =UIColorFromRGB(0xd4d6d5);
            [cell addSubview:view];
           
        }
        UILabel *lab = [UILabel new];
        lab.text = @"明细";
        lab.textColor = UIColorFromRGB(0x656565);
        lab.font = [UIFont systemFontOfSize:13];
        [cell addSubview:lab];
        lab.sd_layout.topSpaceToView(cell,15).leftSpaceToView(cell,15).widthIs(30).heightIs(15);
        
        UILabel *datelab = [UILabel new];
        datelab.text = @"日期";
        datelab.textColor = UIColorFromRGB(0x818181);
        datelab.font = [UIFont systemFontOfSize:13];
        [cell addSubview:datelab];
        datelab.sd_layout.bottomSpaceToView(cell,8).leftSpaceToView(cell,15).widthIs(30).heightIs(15);
        
        UILabel *integrallab = [UILabel new];
        integrallab.text = @"当日积分";
        integrallab.textColor = UIColorFromRGB(0x818181);
        integrallab.font = [UIFont systemFontOfSize:13];
        [cell addSubview:integrallab];
        integrallab.sd_layout.bottomSpaceToView(cell,8).rightSpaceToView(cell,190).widthIs(60).heightIs(15);
        
        UILabel *Dividendlab = [UILabel new];
        Dividendlab.text = @"当日分红";
        Dividendlab.textColor = UIColorFromRGB(0x818181);
        Dividendlab.font = [UIFont systemFontOfSize:13];
        [cell addSubview:Dividendlab];
        Dividendlab.sd_layout.bottomSpaceToView(cell,8).rightSpaceToView(cell,90).widthIs(60).heightIs(15);
        
        UILabel *Withdrawlab = [UILabel new];
        Withdrawlab.text = @"提现";
        Withdrawlab.textColor = UIColorFromRGB(0x818181);
        Withdrawlab.font = [UIFont systemFontOfSize:13];
        [cell addSubview:Withdrawlab];
        Withdrawlab.sd_layout.bottomSpaceToView(cell,8).rightSpaceToView(cell,15).widthIs(35).heightIs(15);
    }
    else{
        UILabel *datelab = [UILabel new];
        datelab.text = @"2016-10-10";
        datelab.textColor = UIColorFromRGB(0x222222);
        datelab.font = [UIFont systemFontOfSize:12];
        [cell addSubview:datelab];
        datelab.sd_layout.bottomSpaceToView(cell,5).leftSpaceToView(cell,15).widthIs(90).heightIs(15);
        
        UILabel *integrallab = [UILabel new];
        integrallab.text = @"+100";
        integrallab.textColor = UIColorFromRGB(0x222222);
        integrallab.font = [UIFont systemFontOfSize:12];
        integrallab.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:integrallab];
        integrallab.sd_layout.bottomSpaceToView(cell,5).rightSpaceToView(cell,190).widthIs(60).heightIs(15);
        
        UILabel *Dividendlab = [UILabel new];
        Dividendlab.text = @"+100";
        Dividendlab.textColor = UIColorFromRGB(0x222222);
        Dividendlab.font = [UIFont systemFontOfSize:12];
        Dividendlab.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:Dividendlab];
        Dividendlab.sd_layout.bottomSpaceToView(cell,5).rightSpaceToView(cell,90).widthIs(60).heightIs(15);
        
        UILabel *Withdrawlab = [UILabel new];
        Withdrawlab.text = @"-100";
        Withdrawlab.textColor = UIColorFromRGB(0x222222);
        Withdrawlab.font = [UIFont systemFontOfSize:12];
        [cell addSubview:Withdrawlab];
        Withdrawlab.sd_layout.bottomSpaceToView(cell,5).rightSpaceToView(cell,15).widthIs(38).heightIs(15);
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tixianbuttonCilk:(UIButton *)tixianbutt{
    WithdrawMoney * withdrawvi = [WithdrawMoney new];
    withdrawvi.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:withdrawvi animated:YES];
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
