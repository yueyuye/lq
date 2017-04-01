//
//  dianJuanView.m
//  xiupin
//
//  Created by pro on 17/2/21.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "dianJuanView.h"
#import "explainView.h"
@interface dianJuanView ()<UITableViewDataSource,UITableViewDelegate>{
    
    
    NSArray *array;
    int b;
    UIButton *pinkBtn;
}

@end

@implementation dianJuanView

- (void)viewDidLoad {
    b=0;
    array=@[@"一天",@"二天",@"二天",@"二天"];
    [super viewDidLoad];
    [self setNavigationBar:@"选择优惠券"];
    [self addBackButton];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    UIView *NoView=[UIView new];
    NoView.frame=CGRectMake(0,64, Width, 55);
    NoView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:NoView];
    
    UILabel *NoLabel=[UILabel new];
    NoLabel.frame=CGRectMake(15, 7.5, 100, 40);
    NoLabel.text=@"不使用优惠券";
    NoLabel.textColor=UIColorFromRGB(0x222222);
    NoLabel.font=[UIFont systemFontOfSize:16];
    [NoView addSubview:NoLabel];
    
    UIButton *xuanZeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    xuanZeBtn.frame=CGRectMake(Width-35, 14, 20, 20);
    [xuanZeBtn setImage:[UIImage imageNamed:@"icon_choose_green"] forState:UIControlStateNormal];
    [NoView addSubview:xuanZeBtn];
    
    UITableView *TableView=[UITableView new];
    TableView.frame=CGRectMake(0, 129, Width, Height);
    TableView.delegate=self;
    TableView.dataSource=self;
    
// 设置分割线的样式为None.
    TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:TableView];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
#pragma mark -- 高 --
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *type=[array objectAtIndex:indexPath.row];
    if([type isEqualToString:@"一天"]){
        return 50;
    }
    
    else {
        return 100;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *type=[array objectAtIndex:indexPath.row];
    if ([type isEqualToString:@"一天"]) {
        NSString *celling=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
            UILabel *label=[UILabel new];
            label.tag=100;
            [cell addSubview:label];
            
            UIImageView *imgView=[UIImageView new];
            imgView.tag=110;
            [cell addSubview:imgView];
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.tag=120;
            [cell addSubview:button];

        }
        UILabel *Lab=(UILabel *)[cell viewWithTag:100];
        Lab.text=@"有三张优惠卷可以使用";
        Lab.frame=CGRectMake(15, 15, 150, 14);
        Lab.textColor=UIColorFromRGB(0x222222);
        Lab.font=[UIFont systemFontOfSize:14];
        
        UIImageView *Img=(UIImageView *)[cell viewWithTag:110];
        Img.image=[UIImage imageNamed:@"icon_query"];
        Img.frame=CGRectMake(Width-110, 15, 17, 17);
        
        UIButton *explainBtn=(UIButton *)[cell viewWithTag:120];
        explainBtn.frame=CGRectMake(Width-90, 17,75, 15);
        [explainBtn setTitle:@"优惠卷说明" forState:UIControlStateNormal];
        [explainBtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        [explainBtn addTarget:self action:@selector(explainBtn:) forControlEvents:UIControlEventTouchUpInside];
        explainBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    else{
        
        NSString *celling=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
        UIView *View=[UIView new];
        View.tag=200;
        [cell addSubview:View];
        
        UILabel *Lab=[UILabel new];
        Lab.tag=210;
        [cell addSubview:Lab];
        
        UILabel *Lab2=[UILabel new];
        Lab2.tag=220;
        [cell addSubview:Lab2];
        
        UILabel *Lab3=[UILabel new];
        Lab3.tag=230;
        [cell addSubview:Lab3];
        
        UILabel *Lab4=[UILabel new];
        Lab4.tag=240;
        [cell addSubview:Lab4];
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag=250;
        [cell addSubview:button];

    }
        UIView *discountView=(UIView *)[cell viewWithTag:200];
        discountView.frame=CGRectMake(15, 12, Width-30, 80);
        discountView.backgroundColor=UIColorFromRGB(0xfffee2);
        
        UILabel *discountLab=(UILabel *)[cell viewWithTag:210];
        discountLab.text=@"￥";
        discountLab.font=[UIFont systemFontOfSize:18];
        discountLab.frame=CGRectMake(35, 60, 15, 18);
        discountLab.textColor=UIColorFromRGB(0xff718d);
        
        UILabel *tenLab=(UILabel *)[cell viewWithTag:220];
        tenLab.text=@"10";
        tenLab.font=[UIFont systemFontOfSize:60];
        tenLab.frame=CGRectMake(50, 33, 70, 45);
        tenLab.textColor=UIColorFromRGB(0xff718d);
        
        UILabel *commonlyLab=(UILabel *)[cell viewWithTag:230];
        commonlyLab.text=@"通用优惠券";
        commonlyLab.font=[UIFont systemFontOfSize:17];
        commonlyLab.frame=CGRectMake(130, 38, 85, 17);
        commonlyLab.textColor=UIColorFromRGB(0x7a7a7a);
        
        UILabel *dateLab=(UILabel *)[cell viewWithTag:240];
        dateLab.text=@"2017-03-01到期";
        dateLab.font=[UIFont systemFontOfSize:12];
        dateLab.frame=CGRectMake(130, 65, 90, 10);
        dateLab.textColor=UIColorFromRGB(0x909082);
    
        pinkBtn=(UIButton *)[cell viewWithTag:250];
        pinkBtn.frame=CGRectMake(Width-55, 45, 20, 20);
//        [pinkBtn setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateNormal];
        [pinkBtn addTarget:self action:@selector(pinkButton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    }
}
//点击单元格选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0) {
        return ;
        
    }
    else{
       
           [pinkBtn setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateNormal];
        
    }
}
-(void)pinkButton:(UIButton *)Btn{
        if (b%2==1) {
            [Btn setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateNormal];
           
        }
        else{
        
            [Btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
        }
         b=b+1;
}
-(void)explainBtn:(UIButton *)explainButton{
    explainView *explainVC = [explainView new];
    [self.navigationController pushViewController:explainVC animated:YES];
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
