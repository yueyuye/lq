//
//  NeiRongVC.m
//  xiupin
//
//  Created by mac on 17/2/21.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "NeiRongVC.h"

@interface NeiRongVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *contentbleview;
    
    
    NSMutableArray *contentmuarry;
    NSArray *contentarry;
    
    CGFloat f;
}
@end

@implementation NeiRongVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBar:@"消息"];
    [self addBackButton];
  
    [self array];
    

    
    
    
    
    contentbleview=[[UITableView alloc]initWithFrame:CGRectMake(0,64, Width, Height-64) style:UITableViewStylePlain];
    contentbleview.delegate =self;
    contentbleview.dataSource = self;
    contentbleview.separatorStyle = NO;
    contentbleview.showsHorizontalScrollIndicator = NO;
    contentbleview.showsVerticalScrollIndicator=NO;
    contentbleview.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self.view addSubview:contentbleview];
    
    
}
-(void)array{
    
    contentmuarry=[[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",nil];
    
    contentarry = @[@"彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎彭莎莎"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [contentmuarry count];
    return ((NSArray *)[contentmuarry objectAtIndex:section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [contentbleview dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
       cell.backgroundColor =UIColorFromRGB(0xf6f6f6);
        
        
        UILabel *timerlab =[[UILabel alloc]initWithFrame:CGRectMake(0, 15, Width, 15)];
        timerlab.text = @"2017-1-19 16:48";
        timerlab.textColor = UIColorFromRGB(0x818181);
        timerlab.textAlignment = NSTextAlignmentCenter;
        timerlab.font = [UIFont systemFontOfSize:13];
        [cell addSubview:timerlab];
        
   
        UILabel *headlinelab =[[UILabel alloc]initWithFrame:CGRectMake(13, 20, Width/2, 20)];
        headlinelab.text = @"消息小标题";
        headlinelab.textColor = UIColorFromRGB(0x4a4a4a);
        headlinelab.textAlignment = NSTextAlignmentLeft;
        headlinelab.font = [UIFont systemFontOfSize:15];
       
        
        
        
        UILabel *contentlab=[[UILabel alloc]initWithFrame:CGRectMake(30, 44, Width-90, 100)];
        contentlab.textColor = UIColorFromRGB(0x818181);
        contentlab.font=[UIFont systemFontOfSize:13];
        contentlab.text=[contentarry objectAtIndex:0];
        contentlab.tag =121;
        contentlab.numberOfLines=0;
        [contentlab sizeToFit];
        
        
        
        UIView *vi =[[UIView alloc]initWithFrame:CGRectMake(15, 35, Width-30,50+contentlab.frame.size.height)];
        vi.backgroundColor = UIColorFromRGB(0xffffff);
        vi.layer.cornerRadius = 10;
        vi.clipsToBounds = YES;
      
       f = vi.frame.size.height;
        
        
         [cell addSubview:vi];
        
        
        [vi addSubview:headlinelab];
        
        [vi addSubview:contentlab];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35+f;
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
