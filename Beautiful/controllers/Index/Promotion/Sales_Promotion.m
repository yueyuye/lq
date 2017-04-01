//
//  Sales_Promotion.m
//  xiupin
//
//  Created by mac on 17/2/26.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "Sales_Promotion.h"
#import "CuXiaoVC.h"



@interface Sales_Promotion ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *cuxiaoArry;
    
    UITableView *tableview;
    
    
    int number;
    
    
    CGFloat f;
}
@end

@implementation Sales_Promotion

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"促销活动"];
    [self addBackButton];
    [self cuxiaoArry];
    
    
    [self tableview];
}


-(void)cuxiaoArry{
    cuxiaoArry=[NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
 number =(int)(cuxiaoArry.count);
    
    
}
-(void)tableview{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width,Height-64) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.separatorStyle=NO;
    tableview.showsVerticalScrollIndicator=NO;
//    tableview.bounces = YES;
//    tableview.pagingEnabled=YES;
    [self.view addSubview:tableview]
    ;
    
   
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, cuxiaoArry.count*145, Width, 43)];
    [tableview addSubview:vi];
    
    UIView *vi1 =[[UIView alloc]initWithFrame:CGRectMake((Width-178)/2, 43/2-1, 46, 2)];
    vi1.backgroundColor = UIColorFromRGB(0xe3e3e3);
    [vi addSubview:vi1];

    
    UIView *vi2 =[[UIView alloc]initWithFrame:CGRectMake(Width-145, 43/2-1, 46, 2)];
    vi2.backgroundColor = UIColorFromRGB(0xe3e3e3);
    [vi addSubview:vi2];
    
    
    
    UILabel *endlab=[[UILabel alloc]initWithFrame:CGRectMake(Width/2-34, 43/2-10, 68, 20)];
    endlab.textColor=UIColorFromRGB(0xb1b1b1);
    endlab.text=@"已经到底啦";
    endlab.textAlignment=NSTextAlignmentCenter;
    endlab.font =[UIFont systemFontOfSize:13];
    [vi addSubview:endlab];
    
//    UIView *vi3 = [[UIView alloc]initWithFrame:CGRectMake(0, 42, Width, 1)];
//    vi3.backgroundColor =UIColorFromRGB(0xe9e9e9);
//    [vi addSubview:vi3];
}



#pragma mark -- tableview事件


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell= [tableview dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        UIImageView *imgvi = [[UIImageView alloc]initWithFrame:CGRectMake(15, 145/2-50, 100, 100)];
        imgvi.image = [UIImage imageNamed:@"banner"];
        [cell addSubview:imgvi];
        
        UILabel *titilab = [[UILabel alloc]initWithFrame:CGRectMake(130, 25, Width/3, 16)];
        titilab.text = @"活动标题" ;
        titilab.font=[UIFont systemFontOfSize:15];
        [cell addSubview:titilab];
        
        UILabel *neironglab = [[UILabel alloc]initWithFrame:CGRectMake(130, 44, Width-150, 145/2+50-25-40)];
        neironglab.text = @"活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容活动内容" ;
        neironglab.numberOfLines=0;
//        [neironglab sizeToFit];
        neironglab.textColor = UIColorFromRGB(0x888888);
        neironglab.font=[UIFont systemFontOfSize:14];
        [cell addSubview:neironglab];
        
        
        
        UILabel *tuihuolab = [[UILabel alloc]initWithFrame:CGRectMake(130, 145/2+50-16, Width/3, 16)];
        tuihuolab.text = @"7天退货" ;
        tuihuolab.textColor = UIColorFromRGB(0x888888);
        tuihuolab.font=[UIFont systemFontOfSize:13];
        [cell addSubview:tuihuolab];
        
        
        
        
        UILabel *timelab = [[UILabel alloc]initWithFrame:CGRectMake(Width-95, 145/2+50-16, 80, 16)];
        timelab.text = @"01-19 15:33" ;
        timelab.textColor = UIColorFromRGB(0x888888);
        timelab.font=[UIFont systemFontOfSize:13];
        [cell addSubview:timelab];
        
        
//        f =neironglab.frame.size.height+titilab.frame.size.height;
//        
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 144, Width, 1)];
        vi.backgroundColor =UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi];
    }
    
//    cell.textLabel.text =[NSString stringWithFormat:@"%ld",indexPath.row];
//   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==number) {
        
        return 43;
    }
    
    return 145;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableview deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    CuXiaoVC *cuxiao = [[CuXiaoVC alloc]init];
    [self.navigationController pushViewController:cuxiao animated:YES];
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
