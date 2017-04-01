//
//  explainView.m
//  xiupin
//
//  Created by pro on 17/2/22.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "explainView.h"

@interface explainView ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *array;
}

@end

@implementation explainView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"优惠券说明"];
    [self addBackButton];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    array=@[@"一天",@"一天",@"一天",];
    // Do any additional setup after loading the view.
    
    UITableView *TabView=[UITableView new];
    TabView.frame=CGRectMake(0, 64, Width, Height);
    TabView.delegate=self;
    TabView.dataSource=self;
    TabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:TabView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *taye=[array objectAtIndex:indexPath.row];
    if ([taye isEqualToString:@"一天"]) {
        NSString *celling=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
        if ( cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
            UILabel *headingLab=[UILabel new];
            headingLab.tag=100;
            [cell addSubview:headingLab];
            
            UILabel *contentLab=[UILabel new];
            contentLab.tag=110;
            [cell addSubview:contentLab];
        }
        UILabel *headingLabel=(UILabel *)[cell viewWithTag:100];
        headingLabel.frame=CGRectMake(15, 20, 130, 32);
        headingLabel.text=@"1、什么是优惠券";
        headingLabel.font=[UIFont systemFontOfSize:16];
        headingLabel.textColor=UIColorFromRGB(0x222222);
        
        UILabel *contentLabel=(UILabel *)[cell viewWithTag:110];
        contentLabel.frame=CGRectMake(15, 64, Width-40, 28);
        contentLabel.font=[UIFont systemFontOfSize:14];
        contentLabel.textColor=UIColorFromRGB(0x656565);
        contentLabel.text=@"优惠券，给持券人某种特殊权利的优待券（如赊购物品或享受一定折扣）。";
        contentLabel.numberOfLines=0;
        [contentLabel sizeToFit];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;

    }
    else{
        NSString *celling=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
        if ( cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
    }
        return cell;
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
