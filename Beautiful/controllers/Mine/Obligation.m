//
//  Obligation.m
//  xiupin
//
//  Created by pro on 17/2/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Obligation.h"

@interface Obligation ()
<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arrDd;
    NSArray *arrShop;
    NSArray *arrCommodity1;
    NSArray *arrCommodity2;
    NSArray *arrCommodity3;
    NSArray *arrCommodity4;
    NSArray *arr;
    
    UIScrollView *scroll;
    UIView *view;
    
    UITableView *messageTableview;
    UITableView *friendTableView;
    
    UITableView *table;
    UITableView *table1;
    
    NSArray *arrB;
    NSArray *arrBG;
}


@end

@implementation Obligation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrDd = @[@"待付款",@"待送货",@"已送货",@"待自提",@"待评价"];
    arrShop = @[@"店一",@"店二",@"店三",@"店四"];
    arrCommodity1 = @[@"一",@"二"];
    arrCommodity2 = @[@"火"];
    arrCommodity3 = @[@"果果",@"苹果",@"水果"];
    arrCommodity4 = @[@"大米",@"小米"];
    arr = @[arrShop,arrCommodity1,arrCommodity2,arrCommodity3,arrCommodity4];
    
    [self setNavigationBar:@"我的订单"];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake( 16, 32, 30/2, 38/2);
    [btn setImage:[UIImage imageNamed:@"icon_return_white-1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    [self indent];
    
    
    
}

- (void)settable{
    table = [[UITableView alloc]init];
    table.frame = CGRectMake(0, 121, Width, Height);
    table.dataSource = self;
    table.delegate = self;
    table.separatorStyle = UITableViewCellSelectionStyleNone;
    table.tag = 10;
    table.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self.view addSubview:table];
}

- (void)settableView{
    table1 = [[UITableView alloc]init];
    table1.frame = CGRectMake(0, 121, Width, Height);
    table1.dataSource = self;
    table1.backgroundColor = [UIColor whiteColor];
    table1.delegate = self;
    table1.tag = 11;
    [self.view addSubview:table1];
}

//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString* strShop = [arrShop objectAtIndex:section];

    if (tableView.tag ==10) {
        if ([strShop isEqualToString:@"店一"]) {
            return arrCommodity1.count;
        }
        if ([strShop isEqualToString:@"店二"]) {
            return arrCommodity2.count;
        }
        if ([strShop isEqualToString:@"店三"]) {
            return arrCommodity3.count;
        }
        else{
            return arrCommodity4.count;
        }
    }
    return 5;
}
#pragma mark - 表头
//设置表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return arrShop.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerSectionID = @"headerSectionID";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerSectionID];
   // UILabel *label;
    UILabel *lab;
    UILabel *lab1;
    
    if (headerView == nil) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerSectionID];
//        label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 20)];
//        label.font = [UIFont systemFontOfSize:14];
//        [headerView addSubview:label];
        UIView *viewCL = [[UIView alloc]init];
        viewCL.frame = CGRectMake(0, 0, Width, 44);
        viewCL.backgroundColor= UIColorFromRGB(0xfdfdfd);
        [headerView addSubview:viewCL];
        
        lab = [[UILabel alloc]init];
        lab.frame = CGRectMake(15, 14, 125, 15);
        lab.font = [UIFont systemFontOfSize:14];
        lab.textColor = UIColorFromRGB(0x222222);
        [viewCL addSubview:lab];
        
        lab1 = [[UILabel alloc]init];
        lab1.frame = CGRectMake( Width-60, 14, 50, 15);
        lab1.font = [UIFont systemFontOfSize:14];
        lab1.text = @"待付款";
        lab1.textColor = UIColorFromRGB(0x959595);
        [viewCL addSubview:lab1];

    }
    NSString* strShop = [arrShop objectAtIndex:section];
//    if (section == 0) {
//        label.text = strShop;
//    }else {
//        label.text = @"我的好友";
//    }
   // label.text = strShop;
    
    lab.text = strShop;
    
    return headerView;
}

//高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag ==10) {
        
        return 428/2-43;
        }
    
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        NSString* strShop = [arr objectAtIndex:indexPath.section][indexPath.row];
        
        //NSString *strShop = [arrShop objectAtIndex:indexPath.row];
        if ([strShop isEqualToString:@"店一"]) {
            
            

            
            static NSString *strcell = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
                
                UIView *viewHX = [[UIView alloc]init];
                viewHX.frame = CGRectMake( 15, 0, Width-30, 0.5);
                viewHX.backgroundColor = UIColorFromRGB(0xf3f3f3);
                [cell addSubview:viewHX];
                
                UIImageView *img = [[UIImageView alloc]init];
                img.frame = CGRectMake( 15, 16, 146/2, 146/2);
                img.image = [UIImage imageNamed:@"banner"];
                img.layer.borderColor = UIColorFromRGB(0x959595).CGColor;
                img.layer.borderWidth = 0.25;
                [cell addSubview:img];
                
                UILabel *labDescribe = [[UILabel alloc]init];
                labDescribe.frame = CGRectMake( 211/2, 16, Width-211/2-15, 100);
                labDescribe.text = @"优质橙子优质橙子优质橙子优质橙子优质橙子优质橙子优质橙子优质橙子";
                [labDescribe setNumberOfLines:0];
                [labDescribe sizeToFit];
                //labDescribe.backgroundColor= [UIColor redColor];
                labDescribe.font = [UIFont systemFontOfSize:15];
                [cell addSubview:labDescribe];
                
                UILabel *labSellingPrice = [[UILabel alloc]init];
                labSellingPrice.frame = CGRectMake(211/2, 59.5, 35, 18);
                labSellingPrice.text = @"￥40";
                labSellingPrice.font = [UIFont systemFontOfSize:15];
                labSellingPrice.textColor = UIColorFromRGB(0xff0000);
                [cell addSubview:labSellingPrice];
                
                UILabel *labOriginalPrice = [[UILabel alloc]init];
                labOriginalPrice.frame = CGRectMake(211/2+45, 59.5, 30, 18);
                labOriginalPrice.text = @"￥25";
                labOriginalPrice.font = [UIFont systemFontOfSize:12.5];
                labOriginalPrice.textColor = UIColorFromRGB(0x959595);
                [cell addSubview:labOriginalPrice];
                
                UILabel *labQuantity = [[UILabel alloc]init];
                labQuantity.frame = CGRectMake(Width-37.5, 60, 35/2, 10);
                labQuantity.text = @"x2";
                labQuantity.font = [UIFont systemFontOfSize:12];
                [cell addSubview:labQuantity];
                
                UIView *viewHX2 = [[UIView alloc]init];
                viewHX2.frame = CGRectMake( 15, 110, Width-30, 0.5);
                viewHX2.backgroundColor = UIColorFromRGB(0xf3f3f3);
                [cell addSubview:viewHX2];
                
                UILabel *labSubtotal = [[UILabel alloc]init];
                labSubtotal.frame = CGRectMake(15, 135, 35, 15);
                labSubtotal.text = @"小计:";
                //labSubtotal.backgroundColor = [UIColor redColor];
                labSubtotal.font = [UIFont systemFontOfSize:12.5];
                [cell addSubview:labSubtotal];
                
                UILabel *labTotalPrices = [[UILabel alloc]init];
                labTotalPrices.frame = CGRectMake( 50, 132, 40, 20);
                labTotalPrices.textColor  = [UIColor redColor];
                labTotalPrices.text = @"￥98";
                labTotalPrices.font = [UIFont systemFontOfSize:16];
                [cell addSubview:labTotalPrices];
                
                
                UIButton *btnCancelDD = [UIButton  buttonWithType:UIButtonTypeCustom];
                btnCancelDD.layer.borderWidth = 1;
                [btnCancelDD setTitle:@"取消订单" forState:UIControlStateNormal];
                [btnCancelDD setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
                btnCancelDD.frame = CGRectMake( Width/2, 126, Width/4-15, 29);
                [cell addSubview:btnCancelDD];

                UIButton *btnPayment = [UIButton  buttonWithType:UIButtonTypeCustom];
                btnPayment.layer.borderWidth = 1;
                [btnPayment setTitle:@"立即付款" forState:UIControlStateNormal];
                [btnPayment setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
                btnPayment.frame = CGRectMake( Width*0.75, 126, Width/4-15, 29);
                [cell addSubview:btnPayment];
            }
            
            return cell;
        }
        if ([strShop isEqualToString:@"店二"]) {
            static NSString *strcell = @"cell1";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
                
                UILabel *lab = [[UILabel alloc]init];
                lab.text = @"不太好";
                lab.frame = CGRectMake(0, 0, 100, 100);
                [cell addSubview:lab];
                
                
                
            }
            return cell;
            

        }
        else{
            static NSString *strcell = @"cell4";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
                UILabel *lab = [[UILabel alloc]init];
                lab.text = @"不太好";
                [cell addSubview:lab];
                
            }
            return cell;
        }
        
    }
    else{
        static NSString *strcell = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            UILabel *lab = [[UILabel alloc]init];
            lab.text = @"不太好";
            [cell addSubview:lab];

        }
        return cell;

    }
    
}




- (void)btnturn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)indent{
    UIView *viewBJ = [[UIView alloc]init];
    viewBJ.frame = CGRectMake(0, 64, Width, 94/2);
    viewBJ.backgroundColor = UIColorFromRGB(0xffffff);
    viewBJ.tag = 1349;
    [self.view addSubview:viewBJ];
    
    for (int i=0; i<5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *str = [arrDd objectAtIndex:i];
        btn.frame = CGRectMake(22+i*Width/5.2, 15, 45, 16);
        btn.tag = 1350+i;
        [btn addTarget:self action:@selector(indentDetails:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [viewBJ addSubview:btn];
    }
    
    UIView *viewHX = [[UIView alloc]init];
    viewHX.frame = CGRectMake(0, 94/2-1, Width, 0.5);
    viewHX.backgroundColor = UIColorFromRGB(0xd4d5d6);
    [viewBJ addSubview:viewHX];
}



- (void)indentDetails:(UIButton *)btn{
    
    NSLog(@"123132");
    
    UIView *viewbj = (UIView *)[self.view viewWithTag:1349];
    UIButton *but0 = (UIButton *)[viewbj viewWithTag:1350];
    UIButton *but1 = (UIButton *)[viewbj viewWithTag:1351];
    UIButton *but2 = (UIButton *)[viewbj viewWithTag:1352];
    UIButton *but3 = (UIButton *)[viewbj viewWithTag:1353];
    UIButton *but4 = (UIButton *)[viewbj viewWithTag:1354];

    
    if (btn.tag==1350) {
        [but0 setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        [but1 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but2 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but3 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but4 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        table1.alpha = 0;
        [self settable];
        
        
        
    }
    if (btn.tag==1351) {
        
        [but0 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but1 setTitleColor:UIColorFromRGB(0x31cdaa)  forState:UIControlStateNormal];
        [but2 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but3 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but4 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [self settableView];
    }
    if (btn.tag==1352) {
        
        [but0 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but1 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but2 setTitleColor:UIColorFromRGB(0x31cdaa)  forState:UIControlStateNormal];
        [but3 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but4 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
    }
    if (btn.tag==1353) {
        
        [but0 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but1 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but2 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but3 setTitleColor:UIColorFromRGB(0x31cdaa)  forState:UIControlStateNormal];
        [but4 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
    }
    if (btn.tag==1354) {
        
        [but0 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but1 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but2 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but3 setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        [but4 setTitleColor:UIColorFromRGB(0x31cdaa)  forState:UIControlStateNormal];
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
