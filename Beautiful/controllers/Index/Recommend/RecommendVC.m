//
//  RecommendVC.m
//  Beautiful
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RecommendVC.h"

@interface RecommendVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tablevi;
    
    CGFloat frame;
    
    
    NSMutableArray *mutablearry;
}
@end

@implementation RecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"为您推荐"];
    [self addBackButton];
    
    mutablearry = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
    
    tablevi = [[UITableView alloc]initWithFrame:CGRectMake(0,64, Width, Height-64)];
    tablevi.delegate =self;
    tablevi.dataSource =self;
    tablevi.separatorStyle = NO;
    tablevi.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tablevi];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutablearry.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 138;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell= [tablevi dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 137, Width,1)];
        vi1.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi1];

        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 100/Width*Width, 100)];
        img.image = [UIImage imageNamed:@"chengzi"];
        [cell addSubview:img];
        
        frame =img.frame.origin.x+100/Width*Width;
        
        for (int j = 0; j<2; j++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, j*15+22+j*8, Width/2, 15)];
            [cell addSubview:lab];
            
            
            if (j == 0) {
                lab.text = @"优质雷波脐橙";
                lab.textColor =UIColorFromRGB(0x222222);
                lab.font = [UIFont systemFontOfSize:16];
            }
            else{
                lab.text = @"7天退货";
                lab.textColor =UIColorFromRGB(0x656565);
                lab.font = [UIFont systemFontOfSize:12];
            }
        }
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 68, 20, 15)];
        lab.text = @"￥";
        lab.textColor =UIColorFromRGB(0xff0000);
        lab.font = [UIFont systemFontOfSize:16];
        [cell addSubview:lab];
        
        
        
        UILabel *jiagelab = [[UILabel alloc]initWithFrame:CGRectMake(frame+30, 66, 50, 15)];
        jiagelab.text = @"49";
        jiagelab.textColor =UIColorFromRGB(0xff0000);
        jiagelab.font = [UIFont systemFontOfSize:16];
        [cell addSubview:jiagelab];
        
        
        UILabel *mendianjiagelab = [[UILabel alloc]initWithFrame:CGRectMake(frame+80, 66, 80, 15)];
        mendianjiagelab.text = @"门店价：￥99";
        mendianjiagelab.textColor =UIColorFromRGB(0xa7a7a7);
        mendianjiagelab.font = [UIFont systemFontOfSize:12];
        [cell addSubview:mendianjiagelab];
        
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(50, mendianjiagelab.frame.size.height/2, 20,1)];
        vi.backgroundColor = UIColorFromRGB(0xa7a7a7);
        [mendianjiagelab addSubview:vi];
        
        
        UILabel *youhuilab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 83, Width/1.55, 20)];
        youhuilab.text = @"在满300的基础上再享优惠抵扣卷50元";
        youhuilab.textColor =UIColorFromRGB(0x616161);
        youhuilab.font = [UIFont systemFontOfSize:11];
        youhuilab.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:youhuilab];
        
        
        UILabel * KMlab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 105, Width/8, 15)];
        KMlab.font = [UIFont systemFontOfSize:12];
        KMlab.textColor =UIColorFromRGB(0xa7a7a7);
        KMlab.text = @"12KM";
        [cell addSubview:KMlab];
        
        for (int k = 0; k<2; k++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(k*Width/5+frame+Width/6, 105, Width/5, 15)];
            lab.font = [UIFont systemFontOfSize:12];
            lab.textColor =UIColorFromRGB(0xa7a7a7);
            [cell addSubview:lab];
            
            
            if (k == 0) {
                lab.text = @"203个评价";
                
            }
            else{
                lab.text = @"好评率98%";
                
            }
        }
        
    }
    return cell;
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
