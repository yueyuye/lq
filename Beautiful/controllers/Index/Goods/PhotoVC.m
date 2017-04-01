//
//  PhotoVC.m
//  Beautiful
//
//  Created by mac on 17/3/6.
//  Copyright (c) 2017年 mac. All rights reserved.
//
#import "ServiceVC.h"
#import "PhotoVC.h"
#import "Shop.h"
@interface PhotoVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *paymentVi;
    int amount;
    int number;
    
    UIView *toolbar;
    
    UIView *view;
    UIScrollView *ScView;
    NSMutableArray *Array;
    UIScrollView *imgScrollView;
    UIPageControl *page;
    
    int numcolor;
  
    
    UIImageView *image;
    
    UITableView *paymenttabvi;
    
    NSMutableArray * classifyarry;
    NSMutableArray *selectedArray;
    NSMutableArray *colormuarry;
    NSMutableArray *materialarry;
    
    NSArray *deliveryarr;
    NSDictionary *dic;
    
    NSMutableArray *expressarry;
    
    NSArray *expressarr;
    
    int expresstype;
    
    
}
@end

@implementation PhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"彭老板的店"];
    [self addBackButton];
    
    amount =1;
    
    expresstype = 0;
    
    selectedArray = [NSMutableArray new];
    
    expressarr = @[@"快递1",@"快递2",@"快递3"];
    expressarry = [NSMutableArray arrayWithObjects:@"快递1",@"价格",@"范围", nil];
    
    classifyarry = [NSMutableArray arrayWithObjects:@"订购数量",@"配送方式",@"颜色",@"材质",nil];
    colormuarry =[NSMutableArray arrayWithObjects:@"蓝色",@"蓝色",@"绿色",@"绿色",nil];
    materialarry = [NSMutableArray arrayWithObjects:@"白装",@"蓝装",@"紫装",@"橙装",@"粉装",@"神装",@"鬼装", nil];
    
    Array=[NSMutableArray arrayWithObjects:@"banner-1",@"icon_home_now",nil];
    [super viewDidLoad];
    
    deliveryarr = @[@"上门自提",@"普通配送",@"快递"];
    
    
    UILabel *lineLab2=[UILabel new];
    lineLab2.frame=CGRectMake(0,Height-49, 127, 2);
    lineLab2.backgroundColor=UIColorFromRGB(0x222222);
    [self.view addSubview:lineLab2];
    
    UIButton *customer_serviceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    customer_serviceBtn.frame=CGRectMake(0,Height-50, 63, 50);
    customer_serviceBtn.backgroundColor=UIColorFromRGB(0xf0f0f0);
    [customer_serviceBtn addTarget:self action:@selector(customer_serviceButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customer_serviceBtn];
    
    UIImageView *customer_serviceImg=[UIImageView new];
    customer_serviceImg.image=[UIImage imageNamed:@"icon_service"];
    customer_serviceImg.clipsToBounds = YES;
    customer_serviceImg.contentMode = UIViewContentModeScaleAspectFill;
    customer_serviceImg.frame=CGRectMake(18,5, 26, 21);
    [customer_serviceBtn addSubview:customer_serviceImg];
    
    UILabel *customer_serviceLabel=[UILabel new];
    customer_serviceLabel.text=@"客服";
    customer_serviceLabel.textColor=UIColorFromRGB(0x939393);
    customer_serviceLabel.frame=CGRectMake(18, 26, 25, 24);
    customer_serviceLabel.font=[UIFont systemFontOfSize:12];
    [customer_serviceBtn addSubview:customer_serviceLabel];
    
    UILabel *lineLab3=[UILabel new];
    lineLab3.frame=CGRectMake(62,5,1, 40);
    lineLab3.backgroundColor=UIColorFromRGB(0xd2d2d2);
    [customer_serviceBtn addSubview:lineLab3];
    
    UIButton *ShopBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    ShopBtn.frame=CGRectMake(64,Height-50, 63, 50);
    ShopBtn.backgroundColor=UIColorFromRGB(0xf0f0f0);
    [ShopBtn addTarget:self action:@selector(ShopButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ShopBtn];
    
    UIImageView *ShopImg=[UIImageView new];
    ShopImg.image=[UIImage imageNamed:@"icon_store"];
    ShopImg.frame=CGRectMake(18,5, 26, 21);
    [ShopBtn addSubview:ShopImg];
    UILabel *ShopLabel=[UILabel new];
    ShopLabel.text=@"店铺";
    ShopLabel.textColor=UIColorFromRGB(0x939393);
    ShopLabel.frame=CGRectMake(18, 26, 25, 24);
    ShopLabel.font=[UIFont systemFontOfSize:12];
    [ShopBtn addSubview:ShopLabel];
    
#pragma mark  加入购物车、立即购买
    
    UIButton *Shopping_cartBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Shopping_cartBtn.frame=CGRectMake(127,Height-50,(Width-127)/2, 50);
    Shopping_cartBtn.backgroundColor=UIColorFromRGB(0xf5a81f);
    [Shopping_cartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [Shopping_cartBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    Shopping_cartBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [Shopping_cartBtn addTarget:self action:@selector(Shopping_cartButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Shopping_cartBtn];
    
    UIButton *Buy_nowBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Buy_nowBtn.frame=CGRectMake((Width-127)/2+127,Height-50,(Width-127)/2, 50);
    Buy_nowBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    [Buy_nowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [Buy_nowBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    Buy_nowBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [Buy_nowBtn addTarget:self action:@selector(Buy_nowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Buy_nowBtn];
    
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-114)];
    img.clipsToBounds = YES;
    img.contentMode = UIViewContentModeCenter;
    img.image = [UIImage imageNamed:@"banner-1"];
    img.userInteractionEnabled = YES;
    [self.view addSubview:img];
    
    toolbar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,Height)];
    toolbar.backgroundColor =[UIColor blackColor];
    toolbar.alpha = 0;
    [self.view addSubview:toolbar];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesCilk:)];
    [toolbar addGestureRecognizer:tap];

    [self paymentVi];
    
}
-(void)paymentVi{
    
    paymentVi = [[UIView alloc]initWithFrame:CGRectMake(0, Height+433, Width, 433)];
    paymentVi.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:paymentVi];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0,433-50, Width, 50);
    cancelBtn.backgroundColor = UIColorFromRGB(0x31cdaa);
    [cancelBtn setTitle:@"确定" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [paymentVi addSubview:cancelBtn];
    
    
    
    
    
    
#pragma mark ==立即购买tableview：
    paymenttabvi = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width,433-50) style:UITableViewStylePlain];
    paymenttabvi.delegate =self;
    paymenttabvi.dataSource =self;
    paymenttabvi.separatorStyle = NO;
    paymenttabvi.showsVerticalScrollIndicator = NO;
    [paymentVi addSubview:paymenttabvi];
    
}
- (NSInteger)numberOfSections{
    return 0;
}
#pragma mark ==确定btnCilk
-(void)cancelBtnCilk:(UIButton *)cancelBtn{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.01];
    toolbar.alpha = 0;
    paymentVi.frame = CGRectMake(0, Height+433, Width, 433);
    [UIView commitAnimations];
    
}

#pragma mark == 立即购买--表的事件
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return classifyarry.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 140;
    }
    if (indexPath.row == 1) {
        return 65;
    }
    if (indexPath.row ==2) {
        if (expresstype == 0) {
            return 88;
        }
        if (expresstype == 1) {
            return 88+46;
        }
        else
        {
            return 70+46*3;
        }
        
    }
    if (indexPath.row == 3) {
        
        return 29*colormuarry.count/6+29+45;
    }
    if(indexPath.row ==4){
        return 29*materialarry.count/3+70;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UIView * titilvi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 140)];
        titilvi.backgroundColor = UIColorFromRGB(0xffffff);
        [cell addSubview:titilvi];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 100, 100)];
        img.image = [UIImage imageNamed:@"chengzi"];
        [titilvi addSubview:img];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(Width-245, 35,230,50)];
        lab.text = @"优质雷波脐橙优质雷波脐橙优质雷波脐橙优质雷波脐橙优质雷波脐橙";
        lab.numberOfLines = 0;
        lab.textColor = UIColorFromRGB(0x2d2d2d);
        lab.font = [UIFont systemFontOfSize:15];
        [titilvi addSubview:lab];
        
        UILabel *moneylab = [[UILabel alloc]initWithFrame:CGRectMake(Width-245,titilvi.ViewHeight-35,15,15)];
        moneylab.text = @"￥";
        moneylab.numberOfLines = 0;
        moneylab.textColor = UIColorFromRGB(0xff0000);
        moneylab.font = [UIFont systemFontOfSize:12];
        [titilvi addSubview:moneylab];
        
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(Width-234,titilvi.ViewHeight-45,30,30)];
        numlab.numberOfLines = 0;
        numlab.text = @"49";
        numlab.textColor = UIColorFromRGB(0xff0000);
        numlab.font = [UIFont systemFontOfSize:18];
        [titilvi addSubview:numlab];
        
        
        UIView * vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, 139, Width, 1)];
        vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [tableView addSubview:vi2];
        return cell;
    }
    
    if (indexPath.row == 1) {
        
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 65/2-10, 100, 20)];
        lab.text = @"订购数量";
        lab.textColor = UIColorFromRGB(0x2d2d2d);
        lab.font = [UIFont systemFontOfSize:15];
        [cell addSubview:lab];
        
        UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,64, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi];
        
        
        UILabel *numberlab = [[UILabel alloc]initWithFrame:CGRectMake(Width-156, 15, 141, 35)];
        numberlab.layer.cornerRadius = 6;
        numberlab.layer.borderColor = UIColorFromRGB(0xe0e0e0).CGColor;
        numberlab.userInteractionEnabled =YES;
        numberlab.layer.borderWidth = 2;
        [cell addSubview:numberlab];
        
        
        UIButton *Subtractbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        Subtractbtn.frame = CGRectMake(0, 0, 38, 35);
        [Subtractbtn setImage:[UIImage imageNamed:@"Subtract"] forState:UIControlStateNormal];
        [Subtractbtn addTarget:self action:@selector(SubtractbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [numberlab addSubview:Subtractbtn];
        
        
        UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addbtn.frame = CGRectMake(numberlab.ViewWidth-38, 0, 38, 35);
        [addbtn addTarget:self action:@selector(addbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [addbtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [numberlab addSubview:addbtn];
        
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(37, 0, 141-75, 35)];
        numlab.layer.borderColor =UIColorFromRGB(0xe0e0e0).CGColor;
        NSString *string = [NSString stringWithFormat:@"%d",amount];
        numlab.text = string;
        numlab.tag = 222;
        numlab.textAlignment =NSTextAlignmentCenter;
        numlab.layer.borderWidth = 2;
        [numberlab addSubview:numlab];
        return cell;
    }
    
    
    if (indexPath.row ==2) {
        
        if (expresstype == 0) {
            
            
            UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab.text = @"配送方式";
            lab.textColor = UIColorFromRGB(0x2d2d2d);
            lab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab];
            
            for (int i = 0 ; i<3; i++) {
                
                UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(15+i*(Width-35-84)/3+i*42, 43, (Width-35-84)/3, 29);
                [button setTitle:deliveryarr[i] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:13];
                [button setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
                button.layer.borderWidth = 2;
                button.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
                button.layer.cornerRadius = 13;
                button.tag = i+300;
                button.userInteractionEnabled = YES;
                [button addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
                
                if (button.tag == 300) {
                    button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
                    [button setTitleColor:UIColorFromRGB(0x32cdaa) forState:UIControlStateNormal];
                }
            }
            
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab1.text = @"配送方式";
            lab1.textColor = UIColorFromRGB(0x2d2d2d);
            lab1.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab1];
            
            
            UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,87,Width, 1)];
            vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:vi];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (expresstype ==1) {
            //普通配送
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab.text = @"配送方式";
            lab.textColor = UIColorFromRGB(0x2d2d2d);
            lab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab];
            
            for (int i = 0 ; i<3; i++) {
                UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(15+i*(Width-35-84)/3+i*42, 43, (Width-35-84)/3, 29);
                [button setTitle:deliveryarr[i] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:13];
                [button setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
                button.layer.borderWidth = 2;
                button.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
                button.layer.cornerRadius = 13;
                button.tag = i+300;
                button.userInteractionEnabled = YES;
                [button addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
                
                if (button.tag == 301) {
                    button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
                    [button setTitleColor:UIColorFromRGB(0x32cdaa) forState:UIControlStateNormal];
                }
            }
            
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab1.text = @"配送方式";
            lab1.textColor = UIColorFromRGB(0x2d2d2d);
            lab1.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab1];
            
            
            UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,87,Width, 1)];
            vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:vi];
            
            UIView * vi2 = [[UIView alloc]initWithFrame:CGRectMake(0,45+88, Width, 1)];
            vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:vi2];
            
            UILabel *common = [[UILabel alloc]initWithFrame:CGRectMake(15, 14+88, 100, 20)];
            common.text = @"价格";
            common.textColor = UIColorFromRGB(0x2d2d2d);
            common.font = [UIFont systemFontOfSize:15];
            [cell addSubview:common];
            
            UILabel *commonlab = [[UILabel alloc]initWithFrame:CGRectMake(115, 14+88, 50, 20)];
            commonlab.text = @"12元";
            commonlab.textColor = UIColorFromRGB(0x818181);
            commonlab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:commonlab];
            return cell;
        }
        
        if (expresstype == 2) {
            //快递
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            for (int i = 0 ; i<3; i++) {
                UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(15+i*(Width-35-84)/3+i*42, 43, (Width-35-84)/3, 29);
                [button setTitle:deliveryarr[i] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:13];
                [button setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
                button.layer.borderWidth = 2;
                button.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
                button.layer.cornerRadius = 13;
                button.tag = i+300;
                button.userInteractionEnabled = YES;
                [button addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
                
                if (button.tag == 302) {
                    button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
                    [button setTitleColor:UIColorFromRGB(0x32cdaa) forState:UIControlStateNormal];
                }
            }
            
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab1.text = @"配送方式";
            lab1.textColor = UIColorFromRGB(0x2d2d2d);
            lab1.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab1];
            
            for (int f = 0; f<expressarry.count; f++) {
                UIView * gayvi = [[UIView alloc]initWithFrame:CGRectMake(15,110+f*46, Width-15, 1)];
                gayvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
                [cell addSubview:gayvi];
            }
            
            for (int p = 0; p<3; p++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setTitle:expressarr[p] forState:UIControlStateNormal];
                [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
                btn.frame = CGRectMake(15+p*(Width-60)/3+p*15,75, (Width-60)/3, 28);
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                btn.layer.cornerRadius = 12;
                btn.tag = p+888;
                [btn addTarget:self action:@selector(btnCilk:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:btn];
                
            }
            UILabel *express = [[UILabel alloc]initWithFrame:CGRectMake(15, 125, 100, 20)];
            express.text = @"价格";
            express.textColor = UIColorFromRGB(0x2d2d2d);
            express.font = [UIFont systemFontOfSize:15];
            [cell addSubview:express];
            
            UILabel *expresslab = [[UILabel alloc]initWithFrame:CGRectMake(115, 125, 50, 20)];
            expresslab.text = @"12元";
            expresslab.textColor = UIColorFromRGB(0x818181);
            expresslab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:expresslab];
            
            UILabel *scope = [[UILabel alloc]initWithFrame:CGRectMake(15, 170, 100, 20)];
            scope.text = @"范围";
            scope.textColor = UIColorFromRGB(0x2d2d2d);
            scope.font = [UIFont systemFontOfSize:15];
            [cell addSubview:scope];
            
            UILabel *scopelab = [[UILabel alloc]initWithFrame:CGRectMake(115, 170, 50, 20)];
            scopelab.text = @"20KM";
            scopelab.textColor = UIColorFromRGB(0x818181);
            scopelab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:scopelab];
            
            
            
            
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    
    
    if (indexPath.row == 3) {
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        UIView *colorvi = [[UIView alloc]init];
        colorvi.tag = 123;
        colorvi.frame =CGRectMake(0, 0, Width,29*colormuarry.count/6+29+45);
        [cell addSubview:colorvi];
        
        
        UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,colorvi.ViewHeight-1, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [colorvi addSubview:vi];
        
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
        lab.text = @"颜色";
        lab.textColor = UIColorFromRGB(0x2d2d2d);
        lab.font = [UIFont systemFontOfSize:15];
        [colorvi addSubview:lab];
        
        
        
        for (int h = 0 ; h<colormuarry.count; h++) {
            UIButton * colorbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            colorbtn.frame = CGRectMake(15+h%6*55+h%6*3,43+h/6*29,55,29);
            [colorbtn setTitle:colormuarry[h] forState:UIControlStateNormal];
            colorbtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [colorbtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            colorbtn.layer.borderWidth = 2;
            colorbtn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            colorbtn.layer.cornerRadius = 13;
            colorbtn.tag = h+400;
            colorbtn.userInteractionEnabled = YES;
            [colorbtn addTarget:self action:@selector(colorbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [colorvi addSubview:colorbtn];
        }
        return cell;
    }
    
    
    
    if(indexPath.row == 4) {
        
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,29*materialarry.count/3+75)];
        view1.tag = 987;
        [cell addSubview:view1];
        
        
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
        lab.text = @"材质";
        lab.textColor = UIColorFromRGB(0x2d2d2d);
        lab.font = [UIFont systemFontOfSize:15];
        [view1 addSubview:lab];
        
        
        UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,view1.ViewHeight-1, Width,1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [view1 addSubview:vi];
        
        
        
        for (int k = 0 ; k<materialarry.count; k++) {
            UIButton * materialbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            materialbtn.frame = CGRectMake(15+k%3*(Width-35-84)/3+k%3*42,45+k/3*29,(Width-35-84)/3,29);
            [materialbtn setTitle:materialarry[k] forState:UIControlStateNormal];
            materialbtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [materialbtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            materialbtn.layer.borderWidth = 2;
            materialbtn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            materialbtn.layer.cornerRadius = 13;
            materialbtn.tag = k+400;
            materialbtn.userInteractionEnabled = YES;
            [materialbtn addTarget:self action:@selector(materialbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            
            [view1 addSubview:materialbtn];
        }
        
        return cell;
    }
    else{
        static NSString *str = @"cell";
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:str];
        
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        return cell;
    }
}
-(void)btnCilk:(UIButton *)btn{
    
    
    
    for (int k = 0; k<3; k++) {
        if (btn.tag == 888+k) {
            
            btn.backgroundColor = UIColorFromRGB(0x31cdaa);
            
        }
        else{
            UIButton *btn2 = (UIButton *)[paymenttabvi viewWithTag:k+888];
            btn2.backgroundColor = UIColorFromRGB(0xffffff);
        }
    }
}
-(void)buttonCilk:(UIButton *)button{
    
    if (button.tag == 300) {
        
        expresstype = 0;
        
    }
    
    if (button.tag == 301) {
        expresstype = 1;
    }
    if (button.tag == 302) {
        expresstype=2;
        
    }
    for (int w = 0;w<3; w++) {
        if (button.tag == w+300) {
            
            [button setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
        }
        else{
            UIButton * btn = (UIButton *)[paymenttabvi viewWithTag:300+w];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            btn.layer.borderColor = UIColorFromRGB(0x222222).CGColor;
        }
    }
    
    [paymenttabvi reloadData];
}
-(void)colorbtnCilk:(UIButton *)colorbtn{
    
    UIView *vi = (UIView*)[paymenttabvi viewWithTag:123];
    for (int i = 0; i<colormuarry.count; i++) {
        
        if (colorbtn.tag == 400+i) {
            colorbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            colorbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            colorbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            
            
            [colorbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [colorbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [colorbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            
            
        }
        else{
            UIButton *btn = (UIButton *)[vi viewWithTag:i+400];
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            
            
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        }
    }
}

-(void)materialbtnCilk:(UIButton *)materialbtn{
    UIView *vi = (UIView*)[paymenttabvi viewWithTag:987];
    for (int i = 0; i<materialarry.count; i++) {
        
        if (materialbtn.tag == 400+i) {
            materialbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            materialbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            materialbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            
            
            [materialbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [materialbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [materialbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            
            
        }
        else{
            UIButton *btn = (UIButton *)[vi viewWithTag:i+400];
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            
            
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        }
    }
    
}
-(void)SubtractbtnCilk:(UIButton *)Subtractbtn{
    UILabel *numlab = (UILabel *)[paymenttabvi viewWithTag:222];
    amount  = amount-1;
    if (amount <1) {
        amount=1;
    }
    numlab.text = [NSString stringWithFormat:@"%d",amount];
    
}
-(void)addbtnCilk:(UIButton *)addbtn{
    UILabel *numlab = (UILabel *)[paymenttabvi viewWithTag:222];
    amount  = amount+1;
    numlab.text = [NSString stringWithFormat:@"%d",amount];
}

-(void)ShopButton:(UIButton *)button{
    NSLog(@"店铺");
    Shop *shop = [Shop new];
    shop.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:shop animated:YES];
}
-(void)distanceButton:(UIButton *)bttn{
    NSLog(@"===定位距离===");
}
-(void)customer_serviceButton:(UIButton *)button{
    NSLog(@"客服");
    ServiceVC* servi = [ServiceVC new];
    [self.navigationController pushViewController:servi animated:YES]
    ;
}
-(void)Shopping_cartButton:(UIButton *)button{
    NSLog(@"加入购物车");
}
-(void)Buy_nowButton:(UIButton *)button{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.01];
    toolbar.alpha = .5;
    paymentVi.frame = CGRectMake(0, Height-433, Width, 433);
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tapgesCilk:(UITapGestureRecognizer *)tapges{
    
    paymentVi.frame = CGRectMake(0, Height, Width, 433);
    toolbar.alpha = 0;
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
