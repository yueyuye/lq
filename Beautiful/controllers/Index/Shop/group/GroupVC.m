//
//  GroupVC.m
//  Beautiful
//
//  Created by mac on 17/3/14.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "GroupVC.h"
#import "CustomerVC.h"
#import "MygroupVC.h"
@interface GroupVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titibtnarry;
    
    UIView *greenview;
    
    UITableView *allgrouptable;
    
    int random;
}
@end

@implementation GroupVC

- (void)viewDidLoad {
    random =0;
    
    [super viewDidLoad];
    [self setNavigationBar:@"团购"];
    [self addBackButton];
    titibtnarry = @[@"全部团购",@"顾客组团",@"我的团购"];
    
    
    [self titibutton];
    [self tableview];
    
}

#pragma mark -- 团购三按钮

-(void)titibutton{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Width, 48)];
    view.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:view];
    
    for (int i = 0 ;i < titibtnarry.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titibtnarry[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake((Width-144)/3*i+i*56+16, view.ViewHeight/2-8, (Width-144)/3, 20);
        [btn setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = i+100;
        [btn addTarget:self action:@selector(titilbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    if (i == 0) {
        [btn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        }
    }
    
    greenview = [[UIView alloc]initWithFrame:CGRectMake(16, view.ViewHeight-4, (Width-144)/3, 4)];
    greenview.backgroundColor = UIColorFromRGB(0x31cdaa);
    [view addSubview:greenview];
    
    for (int k = 0; k <titibtnarry.count - 1; k++) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake((Width-2)/3+(Width-2)/3*k, view.ViewHeight/2-10, 1, 20)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [view addSubview:vi];
    }
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 112, Width, 1)];
    vi.backgroundColor = UIColorFromRGB(0xd4d6d5);
    [self.view addSubview:vi];
}
-(void)titilbtnCilk:(UIButton *)titilbtn{
   
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.1];
        if (titilbtn.tag == 100) {
            random = 0;
            greenview.frame = CGRectMake(16, 44, (Width-144)/3, 4);
        }
        if (titilbtn.tag == 101) {
            random = 1;
            greenview.frame = CGRectMake(70+(Width-144)/3, 44, (Width-144)/3, 4);
            
        }
        if (titilbtn.tag == 102) {
            random = 2;
            greenview.frame = CGRectMake(130+(Width-144)/3*2, 44, (Width-144)/3, 4);
        }
        NSLog(@"%d",random);
    for (int k = 0 ; k <titibtnarry.count; k++) {
        if (titilbtn.tag == k+100) {
            [titilbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        }
        else{
            UIButton *btn = (UIButton *)[self.view viewWithTag:k+100];
            [btn setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
        }
    }
    [allgrouptable reloadData];
    [UIView commitAnimations];
}

#pragma mark -- tableview

-(void)tableview{
    allgrouptable = [[UITableView alloc]initWithFrame:CGRectMake(0, 113, Width, Height-113)];
    allgrouptable.delegate = self;
    allgrouptable.dataSource =self;
    allgrouptable.rowHeight =275;
    allgrouptable.separatorStyle = UITableViewCellSeparatorStyleNone;
    allgrouptable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:allgrouptable];
    
    
 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return 10;
  
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (random == 1) {
        return 300;
    }
    return 275;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
        
    if (random == 0) {

      UITableViewCell*  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
       cell.backgroundColor = UIColorFromRGB(0xf6f6f6);
        
        UIImageView * img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 11, Width, 150)];
        img.image = [UIImage imageNamed:@"banner-1"];
        [cell addSubview:img];

        UIView *whitevi = [[UIView alloc]initWithFrame:CGRectMake(0, 161, Width, 114)];
        whitevi.backgroundColor = UIColorFromRGB(0xffffff);
        [cell addSubview:whitevi];
        
        UILabel *grouptitil = [[UILabel alloc]initWithFrame:CGRectMake(15,15, Width-30, 37)];
        grouptitil.text = @"组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称";
        grouptitil.numberOfLines = 0;
        grouptitil.textColor = UIColorFromRGB(0x313131);
        grouptitil.font = [UIFont systemFontOfSize:15];
        [whitevi addSubview:grouptitil];
        
        UILabel *nonsupportlab = [[UILabel alloc]initWithFrame:CGRectMake(15,55, 150, 15)];
        nonsupportlab.text = @"不支持七天退货";
        nonsupportlab.textColor = UIColorFromRGB(0x656565);
        nonsupportlab.font = [UIFont systemFontOfSize:11];
        [whitevi addSubview:nonsupportlab];
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(15,75, 50, 15)];
        numlab.text = @"10人团:";
        numlab.textColor = UIColorFromRGB(0x222222);
        numlab.font = [UIFont systemFontOfSize:13];
        [whitevi addSubview:numlab];
        
        UILabel *ylab = [[UILabel alloc]initWithFrame:CGRectMake(63,76, 15, 15)];
        ylab.text = @"￥";
        ylab.textColor = UIColorFromRGB(0xff0000);
        ylab.font = [UIFont systemFontOfSize:12];
        [whitevi addSubview:ylab];
        
        UILabel *muchlab = [[UILabel alloc]initWithFrame:CGRectMake(75,72, 20, 20)];
        muchlab.text = @"49";
        muchlab.textColor = UIColorFromRGB(0xff0000);
        muchlab.font = [UIFont systemFontOfSize:16];
        [whitevi addSubview:muchlab];
        
        UILabel *univalencelab = [[UILabel alloc]initWithFrame:CGRectMake(100,72, 100, 20)];
        univalencelab.text = @"单买价：99";
        univalencelab.textColor = UIColorFromRGB(0xa7a7a7);
        univalencelab.font = [UIFont systemFontOfSize:12];
        [whitevi addSubview:univalencelab];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 274, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi];
       
        return cell;
    }
 
    if (random == 1) {
        UITableViewCell*  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = UIColorFromRGB(0xf6f6f6);
        
        UIImageView * img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 11, Width, 150)];
        img.image = [UIImage imageNamed:@"banner-1"];
        [cell addSubview:img];
        
        UIView *whitevi = [[UIView alloc]initWithFrame:CGRectMake(0, 161, Width, 139)];
        whitevi.backgroundColor = UIColorFromRGB(0xffffff);
        [cell addSubview:whitevi];
        
        UILabel *grouptitil = [[UILabel alloc]initWithFrame:CGRectMake(15,15, Width-30, 37)];
        grouptitil.text = @"组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称";
        grouptitil.numberOfLines = 0;
        grouptitil.textColor = UIColorFromRGB(0x313131);
        grouptitil.font = [UIFont systemFontOfSize:15];
        [whitevi addSubview:grouptitil];
        
        UILabel *nonsupportlab = [[UILabel alloc]initWithFrame:CGRectMake(15,55, 150, 15)];
        nonsupportlab.text = @"不支持七天退货";
        nonsupportlab.textColor = UIColorFromRGB(0x656565);
        nonsupportlab.font = [UIFont systemFontOfSize:11];
        [whitevi addSubview:nonsupportlab];
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(15,75, 50, 15)];
        numlab.text = @"10人团:";
        numlab.textColor = UIColorFromRGB(0x222222);
        numlab.font = [UIFont systemFontOfSize:13];
        [whitevi addSubview:numlab];
        
        UILabel *ylab = [[UILabel alloc]initWithFrame:CGRectMake(63,76, 15, 15)];
        ylab.text = @"￥";
        ylab.textColor = UIColorFromRGB(0xff0000);
        ylab.font = [UIFont systemFontOfSize:12];
        [whitevi addSubview:ylab];
        
        UILabel *muchlab = [[UILabel alloc]initWithFrame:CGRectMake(75,72, 20, 20)];
        muchlab.text = @"49";
        muchlab.textColor = UIColorFromRGB(0xff0000);
        muchlab.font = [UIFont systemFontOfSize:16];
        [whitevi addSubview:muchlab];
        
        UILabel *univalencelab = [[UILabel alloc]initWithFrame:CGRectMake(100,72, 100, 20)];
        univalencelab.text = @"单买价：99";
        univalencelab.textColor = UIColorFromRGB(0xa7a7a7);
        univalencelab.font = [UIFont systemFontOfSize:12];
        [whitevi addSubview:univalencelab];
        
        
        UILabel *timerlab = [[UILabel alloc]initWithFrame:CGRectMake(15,95, Width-100, 20)];
        timerlab.text = @"结束时间: 2017-02-01 22:22:22";
        timerlab.textColor = UIColorFromRGB(0x909090);
        timerlab.font = [UIFont systemFontOfSize:14];
        [whitevi addSubview:timerlab];
        
        
        UILabel *noonelab = [[UILabel alloc]initWithFrame:CGRectMake(Width-90,72,75,20)];
        noonelab.text = @"无商家接单";
        noonelab.textColor = UIColorFromRGB(0xf5a81f);
        noonelab.font = [UIFont systemFontOfSize:14];
        [whitevi addSubview:noonelab];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 299, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi];
        
        return cell;
    }
    else{
        UITableViewCell*  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = UIColorFromRGB(0xf6f6f6);
        
        UIImageView * img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 11, Width, 150)];
        img.image = [UIImage imageNamed:@"banner-1"];
        [cell addSubview:img];
        
        UIView *whitevi = [[UIView alloc]initWithFrame:CGRectMake(0, 161, Width, 114)];
        whitevi.backgroundColor = UIColorFromRGB(0xffffff);
        [cell addSubview:whitevi];
        
        UILabel *grouptitil = [[UILabel alloc]initWithFrame:CGRectMake(15,15, Width-30, 37)];
        grouptitil.text = @"组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称组团名称";
        grouptitil.numberOfLines = 0;
        grouptitil.textColor = UIColorFromRGB(0x313131);
        grouptitil.font = [UIFont systemFontOfSize:15];
        [whitevi addSubview:grouptitil];
        
        UILabel *nonsupportlab = [[UILabel alloc]initWithFrame:CGRectMake(15,55, 150, 15)];
        nonsupportlab.text = @"不支持七天退货";
        nonsupportlab.textColor = UIColorFromRGB(0x656565);
        nonsupportlab.font = [UIFont systemFontOfSize:11];
        [whitevi addSubview:nonsupportlab];
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(15,75, 50, 15)];
        numlab.text = @"10人团:";
        numlab.textColor = UIColorFromRGB(0x222222);
        numlab.font = [UIFont systemFontOfSize:13];
        [whitevi addSubview:numlab];
        
        UILabel *ylab = [[UILabel alloc]initWithFrame:CGRectMake(63,76, 15, 15)];
        ylab.text = @"￥";
        ylab.textColor = UIColorFromRGB(0xff0000);
        ylab.font = [UIFont systemFontOfSize:12];
        [whitevi addSubview:ylab];
        
        UILabel *muchlab = [[UILabel alloc]initWithFrame:CGRectMake(75,72, 20, 20)];
        muchlab.text = @"49";
        muchlab.textColor = UIColorFromRGB(0xff0000);
        muchlab.font = [UIFont systemFontOfSize:16];
        [whitevi addSubview:muchlab];
        
        UILabel *univalencelab = [[UILabel alloc]initWithFrame:CGRectMake(100,72, 100, 20)];
        univalencelab.text = @"单买价：99";
        univalencelab.textColor = UIColorFromRGB(0xa7a7a7);
        univalencelab.font = [UIFont systemFontOfSize:12];
        [whitevi addSubview:univalencelab];
        
        UILabel *noonelab = [[UILabel alloc]initWithFrame:CGRectMake(Width-90,72,75,20)];
        noonelab.font = [UIFont systemFontOfSize:14];
        [whitevi addSubview:noonelab];
    if (indexPath.row == 0) {
            noonelab.text = @"组团中 ";
            noonelab.textColor = UIColorFromRGB(0xf5a81f);
        }
    if (indexPath.row == 1) {
            noonelab.text = @"已成团";
            noonelab.textColor = UIColorFromRGB(0x31cdaa);
        }
    if (indexPath.row == 2) {
            noonelab.text = @"已失败";
            noonelab.textColor = UIColorFromRGB(0xff0000);
        }
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 274, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi];
        return cell;
   }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (random == 0) {
        
    }
    if (random == 1) {
        CustomerVC *customervc = [CustomerVC new];
        [self.navigationController pushViewController:customervc animated:YES];
    }
    if (random == 2) {
        MygroupVC *mygroup = [MygroupVC new];
        [self.navigationController pushViewController:mygroup animated:YES];
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
