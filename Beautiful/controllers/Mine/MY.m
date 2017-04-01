//
//  MY.m
//  xiupin
//
//  Created by mac on 17/2/16.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "MY.h"
#import "WYKDViewController.h"
#import "browsingHistory.h"
#import "TradingRecord.h"
#import "WDYHJViewController.h"
#import "Manager.h"
#import "Obligation.h"
#import "Delivery.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface MY ()<UITableViewDataSource,UITableViewDelegate>
{
     NSArray *arr;
    NSArray *arrlc;
    NSArray *arrlct;
}

@end

@implementation MY


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = @[@"订单",@"我要开店",@"浏览记录",@"交易记录",@"我的优惠劵",@"退货",@"秀品客服",@"区域经理"];
    arrlc = @[@"待付款",@"待送货",@"已送货",@"待自提",@"待评价",];
    arrlct = @[@"icon_message",@"icon_message",@"icon_message",@"icon_message",@"icon_message"];
    
    [self BJbg];
   
}

-(void)BJbg{
    UITableView *table = [[UITableView alloc]init];
    table.frame = CGRectMake( 0, 0, Width, Height);
    table.dataSource = self;
    table.delegate = self;
    table.contentInset = UIEdgeInsetsMake(194, 0, 0, 0);
    table.tag = 1000;
    table.backgroundColor = UIColorFromRGB(0xf6f6f6);
    table.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:table];
    
    UIView *BJView = [[UIView alloc]initWithFrame:CGRectMake(0, -194, Width, 194)];
    BJView.contentMode = UIViewContentModeScaleAspectFill;
    BJView.tag = 1001;
    BJView.backgroundColor = UIColorFromRGB(0x31cdaa);
    [table addSubview:BJView];
#pragma mark - 头像 -
    UILabel *labbk = [[UILabel alloc]initWithFrame:CGRectMake(Width/2-76/2, 130/2-194, 76, 76)];
    labbk.layer.cornerRadius = 76/2;
    labbk.layer.masksToBounds = YES;
    labbk.backgroundColor = UIColorFromRGB(0xc2f0e6);
    [table addSubview:labbk];
    
    UIButton *btntx = [UIButton buttonWithType:UIButtonTypeCustom];
    btntx.frame = CGRectMake( Width/2-71/2, 135/2-194, 71, 71);
    btntx.layer.cornerRadius = 71/2;
    btntx.layer.masksToBounds = YES;
    btntx.tag = 1002;
    btntx.backgroundColor = [UIColor redColor];
    [table addSubview:btntx];

    
    UIButton *btnsz = [UIButton buttonWithType:UIButtonTypeCustom];
    btnsz.frame = CGRectMake( 15, 30, 24, 24);
    btnsz.layer.cornerRadius = 12;
    btnsz.tag = 1003;
    btnsz.layer.masksToBounds = YES;
    btnsz.backgroundColor = [UIColor redColor];
    [BJView addSubview:btnsz];
    
    UIButton *btnxx = [UIButton buttonWithType:UIButtonTypeCustom];
    btnxx.frame = CGRectMake( Width-43, 67/2, 21, 16);
    [btnxx setImage:[UIImage imageNamed:@"icon_message"] forState:UIControlStateNormal];
    btnxx.tag = 1004;
    //btnxx.backgroundColor = [UIColor redColor];
    [BJView addSubview:btnxx];
    
    UILabel *labsm =[[UILabel alloc]init];
    labsm.frame = CGRectMake(Width-30, 26, 15, 15);
    labsm.layer.cornerRadius = 15/2;
    labsm.layer.masksToBounds = YES;
    labsm.tag = 1005;
    labsm.backgroundColor = [UIColor redColor];
    [BJView addSubview:labsm];

    UILabel *labmz =[[UILabel alloc]init];
    labmz.frame = CGRectMake( 180, (388-90)/2-194, 55, 20);
    labmz.text = @"甜蜜儿";
    labmz.font = [UIFont systemFontOfSize:18];
    labmz.textAlignment = 1;
    //labmz.backgroundColor = [UIColor redColor];
    [table addSubview:labmz];
    
    //NSLog(@"%f",Width/2-75/2);
    

}

#pragma mark - 自定义view
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UITableView *table = (UITableView *)[self.view viewWithTag:1000];
    UIView *BjView = (UIView *)[table viewWithTag:1001];
   // UIButton *btntx = (UIButton *)[BjView viewWithTag:1002];
    UIButton *btnsz = (UIButton *)[BjView viewWithTag:1003];
    UIButton *btnxx = (UIButton *)[BjView viewWithTag:1004];
    UILabel *labsm = (UILabel *)[BjView viewWithTag:1005];
    CGPoint point = scrollView.contentOffset;
    if (point.y < -194) {
        CGRect rect = BjView.frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        BjView.frame = rect;
    }
    if (point.y > -194) {
        [self.view addSubview:btnxx];
        [self.view addSubview:labsm];

        [self.view addSubview:btnsz];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}

#pragma mark - 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [arr objectAtIndex:indexPath.row];
    if ([str isEqualToString:@"订单"]) {
        return 250/2;
    }
    else{
    return 60;
    }
}
#pragma mark - 表格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPathP{
    NSString *str = [arr objectAtIndex:indexPathP.row];
    if ([str isEqualToString:@"订单"]) {
        
        static NSString *strcell = @"cell0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.backgroundColor = UIColorFromRGB(0xf6f6f6);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *bjview = [[UIView alloc]initWithFrame:CGRectMake(0, 10, Width, 230/2)];
            bjview.backgroundColor = [UIColor whiteColor];            [cell addSubview:bjview];
            
            UILabel *labwd = [[UILabel alloc]initWithFrame:CGRectMake(35/2, 25/2, 130/2, 15)];
            labwd.text = @"我的订单";
            labwd.font = [UIFont systemFontOfSize:16];
            labwd.textAlignment = 1;
            [bjview addSubview:labwd];
            
            UIButton *btnqb = [UIButton buttonWithType:UIButtonTypeCustom];
            btnqb.frame = CGRectMake(Width-170/2, 25/2, 120/2, 15);
            [btnqb setTitle:@"全部订单" forState:UIControlStateNormal];
            [btnqb setTitleColor:UIColorFromRGB(0x8b8b8b) forState:UIControlStateNormal];
            btnqb.titleLabel.font = [UIFont systemFontOfSize:15];
            [btnqb addTarget:self action:@selector(qbddturn) forControlEvents:UIControlEventTouchUpInside];
            btnqb.titleLabel.textAlignment = 1;
            [bjview addSubview:btnqb];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 25/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [bjview addSubview:btnturn];
            
            UIView *viewhx = [[UIView alloc]initWithFrame:CGRectMake(15, 87/2, Width-30, 0.5)];
            viewhx.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [bjview addSubview:viewhx];
            
            
            for (int i=0; i<5; i++) {
                
                
                UIButton *butlct = [UIButton buttonWithType:UIButtonTypeCustom];
                butlct.frame = CGRectMake(i*17+i*(Width-20-25*5)/4+24, 115/2, 30, 22);
                butlct.backgroundColor = [UIColor blueColor];
                butlct.tag = 1200+i;
                [butlct addTarget:self action:@selector(lctturn:) forControlEvents:UIControlEventTouchUpInside];
                [butlct setImage:[UIImage imageNamed:@"icon_sale_more"] forState:UIControlStateNormal];
                [bjview addSubview:butlct];
            }
            
            for (int y=0; y<5; y++) {

                UIButton *butlc = [UIButton buttonWithType:UIButtonTypeCustom];
                butlc.frame = CGRectMake(y*17+y*(Width-20-25*5)/4+19, 92,40, 11);
                butlc.tag = 1210+y;
                [butlc addTarget:self action:@selector(butlcTurn:) forControlEvents:UIControlEventTouchUpInside];
                [butlc setTitle:str forState:UIControlStateNormal];
                [butlc setTitleColor:UIColorFromRGB(0x646464) forState:UIControlStateNormal];
                butlc.titleLabel.font = [UIFont systemFontOfSize:13];
                [bjview addSubview:butlc];
            }

        }
        return cell;

    }
    else if ([str isEqualToString:@"我要开店"]){
        
        static NSString *strcell = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *bjcell = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 10)];
            bjcell.backgroundColor = UIColorFromRGB(0xf6f6f6);
            [cell addSubview:bjcell];
            
            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
            //img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 65/2, 150, 15)];
            lab.text = @"我要开店";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];
            
            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnWYKD)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];
            
        }
        return cell;
        

    }
    else if ([str isEqualToString:@"浏览记录"]){
        
        static NSString *strcell = @"cell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *viewhx = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, Width, 0.5)];
            viewhx.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:viewhx];

            
            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2-10, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
           // img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 45/2, 150, 15)];
            lab.text = @"浏览记录";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];
            
            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnLLJL)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];

            
        }
        return cell;
        

    }
    
    else if ([str isEqualToString:@"交易记录"]){
        
        static NSString *strcell = @"cell3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIView *viewhx = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, Width, 0.5)];
            viewhx.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:viewhx];

            
            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2-10, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
            //img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 45/2, 150, 15)];
            lab.text = @"交易记录";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
           // btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];
            
            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnJYJL)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];

        }
        return cell;
        

    }else if ([str isEqualToString:@"我的优惠劵"]){
        
        static NSString *strcell = @"cell4";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *bjcell = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 10)];
            bjcell.backgroundColor = UIColorFromRGB(0xf6f6f6);
            [cell addSubview:bjcell];
            
            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
           // img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 65/2, 150, 15)];
            lab.text = @"我的优惠券";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];
            
            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnYHJ)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];

            
        }
        return cell;
        

    }else if ([str isEqualToString:@"退货"]){
        
        static NSString *strcell = @"cell5";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *viewhx = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, Width, 0.5)];
            viewhx.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:viewhx];

            
            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2-10, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
            //img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 45/2, 150, 15)];
            lab.text = @"退货/售后";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];
            
            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnTH)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];

            
        }
        return cell;
        

    }else if ([str isEqualToString:@"秀品客服"]){
        
        static NSString *strcell = @"cell6";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *viewhx = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, Width, 0.5)];
            viewhx.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:viewhx];

            
            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2-10, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
            //img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 45/2, 150, 15)];
            lab.text = @"秀品客服";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];
            
            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnXPKF)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];
 
        }
        return cell;
        

    }
    else{
        static NSString *strcell = @"cell7";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UIView *viewhx = [[UIView alloc]initWithFrame:CGRectMake( 0, 0, Width, 0.5)];
            viewhx.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:viewhx];

            UIImageView *img = [[UIImageView alloc]init];
            img.frame = CGRectMake(15, 55/2-10, 25, 25);
            img.image = [UIImage imageNamed:@"icon_sale_more"];
            //img.backgroundColor = [UIColor redColor];
            [cell addSubview:img];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake( 55, 45/2, 150, 15)];
            lab.text = @"区域经理管理";
            lab.textColor = UIColorFromRGB(0x656565);
            lab.font = [UIFont systemFontOfSize:14];
            lab.textAlignment = 0;
            //lab.backgroundColor = [UIColor redColor];
            lab.font = [UIFont systemFontOfSize:18];
            [cell addSubview:lab];
            
            UIButton *btnturn = [UIButton buttonWithType:UIButtonTypeCustom];
            btnturn.frame = CGRectMake(Width-45/2, 58/2, 10, 15);
            [btnturn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            //btnturn.backgroundColor = [UIColor redColor];
            [cell addSubview:btnturn];


            cell.userInteractionEnabled = YES;
            UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(turnQYJL)];
            PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
            PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
            //PrivateLetterTap.delegate= self;
            cell.contentMode = UIViewContentModeScaleToFill;
            [cell addGestureRecognizer:PrivateLetterTap];

        }
        return cell;
 
    }
}

#pragma mark - 网页跳转 -

- (void)lctturn:(UIButton *)btn{
    
    if (btn.tag ==1200) {
        Obligation *obligation = [[Obligation alloc]init];
        obligation.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:obligation animated:YES];

    }
    if (btn.tag ==1201) {
        Obligation *obligation = [[Obligation alloc]init];
        obligation.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:obligation animated:YES];

    }
    if (btn.tag ==1202) {
        Obligation *obligation = [[Obligation alloc]init];
        obligation.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:obligation animated:YES];
        
    }
    if (btn.tag ==1203) {
        Obligation *obligation = [[Obligation alloc]init];
        obligation.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:obligation animated:YES];
        
    }
    if (btn.tag ==1204) {
        Obligation *obligation = [[Obligation alloc]init];
        obligation.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:obligation animated:YES];
        
    }

}


- (void)butlcTurn:(UIButton *)btn{
    
    Obligation *obligation = [[Obligation alloc]init];
    obligation.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:obligation animated:YES];

}

-(void)turnWYKD{
    
    UIBarButtonItem *returnButtonItem = [[UIBarButtonItem alloc] init];
    returnButtonItem.title = @"   ";
    self.navigationItem.backBarButtonItem = returnButtonItem;
    
    WYKDViewController *wykd = [[WYKDViewController alloc]init];
    //让底部tab消失
    wykd.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wykd animated:YES];
}

- (void)turnLLJL{
    NSLog(@"浏览记录");
    browsingHistory *BHturn = [[browsingHistory alloc]init];
    BHturn.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:BHturn animated:YES];
}

- (void)turnJYJL{
    NSLog(@"交易记录");
    TradingRecord *TR = [[TradingRecord alloc]init];
    TR.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:TR animated:YES];
}

- (void)qbddturn{
    NSLog(@"你好啊，我们今天去划水");
}

- (void)turnYHJ{
    NSLog(@"我的优惠券");
    WDYHJViewController *yhj = [[WDYHJViewController alloc]init];
    yhj.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:yhj animated:YES];
}

- (void)turnTH{
    NSLog(@"退货/");
}

- (void)turnXPKF{
    NSLog(@"秀品客服");
}

- (void)turnQYJL{
    NSLog(@"区域经理");
    Manager *manager = [[Manager alloc]init];
    manager.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:manager animated:YES];
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
