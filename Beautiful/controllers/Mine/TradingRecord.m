//
//  TradingRecord.m
//  xiupin
//
//  Created by pro on 17/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "TradingRecord.h"

@interface TradingRecord ()
{
    UIScrollView *scroll;
    UIView *view;
    
    NSMutableDictionary *dic;
    NSArray *arrtu;
    
    NSArray *arrmoney;
    
    NSArray *arrSite;
   
    NSArray *arrTime;
   
}

@end

@implementation TradingRecord

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"交易记录"];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    arrtu = @[@"icon_end",@"icon_end"];
    arrSite = @[@"中国你按时打算到那时",@"美国目的阿斯顿发发看时间对方那是的"];
    arrmoney = @[@"-32",@"-30"];
    arrTime = @[@"2013123",@"3124312412"];
    dic = [[NSMutableDictionary alloc]init];
    [dic setValue:arrtu forKey:@"你"];
    [dic setValue:arrSite forKey:@"叫"];
    [dic setValue:arrmoney forKey:@"什"];
    [dic setValue:arrTime forKey:@"么"];
    
    scroll = [[UIScrollView alloc]init];
    scroll.frame = CGRectMake(0, 64, Width, Height);
    [self.view addSubview:scroll];
    
    [self record];
    
    CGFloat scrollViewHeight = 0.0f;for (view in scroll.subviews){ scrollViewHeight += view.frame.size.height;}[scroll setContentSize:(CGSizeMake(320, scrollViewHeight+64))];

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


- (void)record{
    
    for (int i=0; i<arrtu.count; i++) {
        UIView *viewBJ = [[UIView alloc]init];
        viewBJ.frame = CGRectMake( 0, i*85, Width, 84);
        viewBJ.backgroundColor = UIColorFromRGB(0xffffff);
        viewBJ.tag = 1100;
        [scroll addSubview:viewBJ];
        
        NSArray *arr  = [dic objectForKey:@"你"];
        NSString *str = [arr objectAtIndex:i];
        UIImageView *img = [[UIImageView alloc]init];
        img.frame = CGRectMake(0, 10, 40, 30);
        img.backgroundColor = [UIColor whiteColor];
        img.image = [UIImage imageNamed:str];
        [viewBJ addSubview:img];
        
        NSArray *arrm  = [dic objectForKey:@"什"];
        NSString *strm = [arrm objectAtIndex:i];
        UILabel *labmoney = [[UILabel alloc]init];
        labmoney.frame = CGRectMake( 79, 20, 130, 20);
        labmoney.text = strm;
        labmoney.font = [UIFont systemFontOfSize:20];
        [viewBJ addSubview:labmoney];
        
        NSArray *arrd  = [dic objectForKey:@"叫"];
        NSString *strd = [arrd objectAtIndex:i];
        UILabel *labSite = [[UILabel alloc]init];
        labSite.frame = CGRectMake( 79, 50, 150, 15);
        labSite.text = strd;
        labSite.font = [UIFont systemFontOfSize:14];
        [viewBJ addSubview:labSite];
        
        NSArray *arrt  = [dic objectForKey:@"么"];
        NSString *strt = [arrt objectAtIndex:i];
        UILabel *labTime = [[UILabel alloc]init];
        labTime.frame = CGRectMake( Width-130, 20, 230/2, 10);
        labTime.text = strt;
        labTime.font = [UIFont systemFontOfSize:10];
        [viewBJ addSubview:labTime];
             }
    

}




//- (void)record{
//    UITableView *table = [[UITableView alloc]init];
//    table.frame = CGRectMake(0, 64, Width, Height);
//    table.dataSource = self;
//    table.delegate = self;
//    [self.view addSubview:table];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 10;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *strcell = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
//    }
//    
//    return cell;
//}



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
