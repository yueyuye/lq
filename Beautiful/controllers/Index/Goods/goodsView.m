//
//  goodsView.m
//  xiupin
//
//  Created by pro on 17/2/22.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "goodsView.h"
#import "Commodity details.h"
@interface goodsView ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *array;
    
    
    CGFloat frame;
}

@end

@implementation goodsView

- (void)viewDidLoad {
    array=[NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"", nil];
    [super viewDidLoad];
    [self setNavigationBar:@"抢购"];
    [self addBackButton];
    
    
    
    
    
    UITableView *Tableview=[UITableView new];
    Tableview.frame=CGRectMake(0, 64, Width, Height-64);
    Tableview.delegate=self;
    Tableview.dataSource=self;
    Tableview.separatorStyle = NO;
    Tableview.showsVerticalScrollIndicator=NO;
    [self.view addSubview:Tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
#pragma mark -- 高 --
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 167;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        
        UIView* tuijianview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,167)];
        
        tuijianview.backgroundColor = [UIColor whiteColor];
        [cell addSubview:tuijianview];
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 166, Width,1)];
        vi1.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi1];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 100/Width*Width, 100)];
        img.image = [UIImage imageNamed:@"chengzi"];
        [tuijianview addSubview:img];
        
        frame =img.frame.origin.x+100/Width*Width;
        
        for (int j = 0; j<2; j++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, j*15+20+j*8, Width/1.8, 40)];
            [tuijianview addSubview:lab];
            
            
            if (j == 0) {
                lab.text = @"优质雷波脐橙优质雷波脐橙优质雷波脐橙";
                lab.textColor =UIColorFromRGB(0x222222);
                lab.numberOfLines = 0;
                lab.font = [UIFont systemFontOfSize:16];
            }
            else{
                lab.text = @"不支持7天退货";
                lab.textColor =UIColorFromRGB(0x656565);
                lab.frame = CGRectMake(frame+15, j*15+40+j*8, Width/1.8, 20);
                lab.font = [UIFont systemFontOfSize:12];
            }
        }
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 88, 20, 15)];
        lab.text = @"￥";
        lab.textColor =UIColorFromRGB(0xff0000);
        lab.font = [UIFont systemFontOfSize:16];
        [tuijianview addSubview:lab];
        
        
        
        UILabel *jiagelab = [[UILabel alloc]initWithFrame:CGRectMake(frame+30, 86, 50, 15)];
        jiagelab.text = @"49";
        jiagelab.textColor =UIColorFromRGB(0xff0000);
        jiagelab.font = [UIFont systemFontOfSize:16];
        [tuijianview addSubview:jiagelab];
        
        
        UILabel *mendianjiagelab = [[UILabel alloc]initWithFrame:CGRectMake(frame+55, 86, 80, 15)];
        mendianjiagelab.text = @"门店价：￥99";
        mendianjiagelab.textColor =UIColorFromRGB(0xa7a7a7);
        mendianjiagelab.font = [UIFont systemFontOfSize:12];
        [tuijianview addSubview:mendianjiagelab];
        
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(50, mendianjiagelab.frame.size.height/2, 20,1)];
        vi.backgroundColor = UIColorFromRGB(0xa7a7a7);
        [mendianjiagelab addSubview:vi];
       
        
        UIButton *promptlybtn = [UIButton buttonWithType:UIButtonTypeCustom];
        promptlybtn.backgroundColor =UIColorFromRGB(0xf5a81f);
        [promptlybtn setTitle:@"立即抢购" forState:UIControlStateNormal];
        promptlybtn.layer.cornerRadius =5;
        [promptlybtn addTarget:self action:@selector(promptlybtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        promptlybtn.titleLabel.font = [UIFont systemFontOfSize:14];
        promptlybtn.frame = CGRectMake(Width-Width*.22, 86, Width*.18, 34);
        [tuijianview addSubview:promptlybtn];
        
        
        
        
        
   //进度条{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(frame+15, 105, Width/2.9, 16)];
        view.backgroundColor = UIColorFromRGB(0xffe7bd);
        view.layer.cornerRadius=5;
        view.clipsToBounds = YES;
        view.layer.borderWidth = 2;
        view.layer.borderColor =UIColorFromRGB(0xf5a81f).CGColor;
        [tuijianview addSubview:view];
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 16)];
        view2.layer.cornerRadius=6;
        view2.clipsToBounds = YES;
        view2.backgroundColor = UIColorFromRGB(0xf5a81f);
        [view addSubview:view2];
    
        CGRect view2frame = view2.frame;
        view2frame.size.width = view.frame.size.width/2-2;
        view2.frame = view2frame;
        
        
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(view.ViewWidth/2-20, view.ViewHeight/2-5, 40, 10)];
        NSString *string =[NSString stringWithFormat:@"%.f%@",view2.ViewWidth/view.ViewWidth*100,@"%"];
        lable.text=string;
        lable.textAlignment = NSTextAlignmentRight;
        lable.textColor = UIColorFromRGB(0xffffff);
        lable.font = [UIFont systemFontOfSize:10];
        [view addSubview:lable];
        
        
        
        
        //进度条}
        
        
        
        
        UILabel * KMlab = [[UILabel alloc]initWithFrame:CGRectMake(Width-15-Width/8, 130, Width/8, 15)];
        KMlab.font = [UIFont systemFontOfSize:12];
        KMlab.textColor =UIColorFromRGB(0x959595);
        KMlab.textAlignment = NSTextAlignmentRight;
        KMlab.text = @"12KM";
        [tuijianview addSubview:KMlab];

        UILabel * shoplab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 130, Width/3, 15)];
        shoplab.font = [UIFont systemFontOfSize:14];
        shoplab.textColor =UIColorFromRGB(0x959595);
        shoplab.textAlignment = NSTextAlignmentLeft;
        shoplab.text = @"彭老板的店";
        [tuijianview addSubview:shoplab];
    }
    
    
    
    
    return cell;
    
    
   }


-(void)promptlybtnCilk:(UIButton *)promptlybtn{
    Commodity_details *detailsVC=[[Commodity_details alloc]init];
    [self.navigationController pushViewController:detailsVC animated:YES];
    
    
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
