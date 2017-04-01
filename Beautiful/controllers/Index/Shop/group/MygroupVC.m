//
//  MygroupVC.m
//  Beautiful
//
//  Created by mac on 17/3/14.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "MygroupVC.h"
#import "GroupView.h"
@interface MygroupVC ()<UIScrollViewDelegate>
{
    UIScrollView *scrollvi;
    UIView *whietvi;
    CGFloat flat;
}

@end

@implementation MygroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"我的团购"];
    [self addBackButton];
    
    
    scrollvi = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-50)];
    scrollvi.backgroundColor = UIColorFromRGB(0xf6f6f6);
    scrollvi.delegate = self;
    scrollvi.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:scrollvi];
    
    
    
    [self imgvi];
    [self wheitview];
    [self lable];
    [self timervi];
    [self explainview];
}
-(void)imgvi{
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, 216)];
    img.image = [UIImage imageNamed:@"banner-1"];
    
    [scrollvi addSubview:img];
    
    flat = img.ViewHeight;
}


-(void)wheitview{
    
    whietvi = [[UIView alloc]initWithFrame:CGRectMake(0, 216, Width, 175)];
    whietvi.backgroundColor =UIColorFromRGB(0xffffff);
    [scrollvi addSubview:whietvi];
    
    flat += whietvi.ViewHeight+64;
    
    for (int i = 0; i<2; i++) {
    
    UIButton * otherbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    otherbtn.frame = CGRectMake(Width/2*i, Height-50, Width/2, 50);
    otherbtn.tag =123+i;
    [otherbtn addTarget:self action:@selector(otherbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherbtn];
    
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [otherbtn addSubview:vi];
    if (i == 0){
        [otherbtn setTitle:@"其他拼团" forState:UIControlStateNormal];
        otherbtn.backgroundColor = UIColorFromRGB(0xffffff);
        [otherbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
        }
        else{
            otherbtn.backgroundColor = UIColorFromRGB(0x31cdaa);
            [otherbtn setTitle:@"我要组团" forState:UIControlStateNormal];
        }
    }
}
-(void)timervi{
    UIView *timervi = [[UIView alloc]initWithFrame:CGRectMake(0, 400, Width, 55)];
    timervi.backgroundColor = UIColorFromRGB(0xffffff);
    [scrollvi addSubview:timervi];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(15, timervi.ViewHeight/2-10, 20, 20)];
    image.image = [UIImage imageNamed:@"icon_time"];
    [timervi addSubview:image];
    
    UILabel *timerlab = [[UILabel alloc]initWithFrame:CGRectMake(50, timervi.ViewHeight/2-10, Width-100, 20)];
    timerlab.text = @"结束时间: 2017-02-01 22:22:22";
    timerlab.textColor = UIColorFromRGB(0x222222);
    timerlab.font = [UIFont systemFontOfSize:14];
    [timervi addSubview:timerlab];
    
    flat +=timervi.ViewHeight+10;
}
-(void)explainview{
    UIView *explainview = [[UIView alloc]init];
    explainview.backgroundColor = UIColorFromRGB(0xffffff);
    [scrollvi addSubview:explainview];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 18, 3, 21)];
    lab.backgroundColor = UIColorFromRGB(0xf5a81f);
    [explainview addSubview:lab];
    
    UILabel *Eventlab = [[UILabel alloc]initWithFrame:CGRectMake(25, 18, 100, 20)];
    Eventlab.text = @"规则说明";
    Eventlab.font = [UIFont systemFontOfSize:14];
    Eventlab.textAlignment = NSTextAlignmentLeft;
    Eventlab.textColor = UIColorFromRGB(0x222222);
    
    [explainview addSubview:Eventlab];
    
    
    UILabel *detailslab = [[UILabel alloc]initWithFrame:CGRectMake(15, 40,Width-30, 20)];
    detailslab.text = @"        活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情\n        活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动\n        详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详\n        情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情        活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情\n        活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动\n        详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详\n        情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情活动详情";
    detailslab.font = [UIFont systemFontOfSize:13];
    detailslab.textAlignment = NSTextAlignmentLeft;
    detailslab.textColor = UIColorFromRGB(0x7a7a7a);
    detailslab.numberOfLines = 0;
    [detailslab sizeToFit];
    [explainview addSubview:detailslab];
    
    explainview.frame = CGRectMake(0, 466, Width, detailslab.ViewHeight+Eventlab.ViewHeight+30);
    flat +=explainview.ViewHeight+10;
    scrollvi.contentSize = CGSizeMake(0,flat);
}
-(void)lable{
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(15,12, Width-30, 40)];
    lable.text=@"活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称活动名称";
    lable.textColor=UIColorFromRGB(0x222222);
    lable.numberOfLines = 0;
    lable.font = [UIFont systemFontOfSize:15];
    [whietvi addSubview:lable];
    
    UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(15,60, 75, 15)];
    numlab.text = @"团购价：";
    numlab.textColor = UIColorFromRGB(0x222222);
    numlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:numlab];
    
    UILabel *ylab = [[UILabel alloc]initWithFrame:CGRectMake(65,61, 15, 15)];
    ylab.text = @"￥";
    ylab.textColor = UIColorFromRGB(0xff0000);
    ylab.font = [UIFont systemFontOfSize:12];
    [whietvi addSubview:ylab];
    
    UILabel *muchlab = [[UILabel alloc]initWithFrame:CGRectMake(75,57, 20, 20)];
    muchlab.text = @"49";
    muchlab.textColor = UIColorFromRGB(0xff0000);
    muchlab.font = [UIFont systemFontOfSize:16];
    [whietvi addSubview:muchlab];
    
    UILabel *univalencelab = [[UILabel alloc]initWithFrame:CGRectMake(105,57, 100, 20)];
    univalencelab.text = @"单买价：￥99";
    univalencelab.textColor = UIColorFromRGB(0xa7a7a7);
    univalencelab.font = [UIFont systemFontOfSize:12];
    univalencelab.textAlignment = NSTextAlignmentRight;
    [whietvi addSubview:univalencelab];
    
    UILabel *gaylab = [[UILabel alloc]initWithFrame:CGRectMake(univalencelab.ViewWidth-26,univalencelab.ViewHeight/2-0.5, 26, 1)];
    gaylab.backgroundColor = UIColorFromRGB(0xa7a7a7);
    [univalencelab addSubview:gaylab];
    
    
    UILabel *nonsupportlab = [[UILabel alloc]initWithFrame:CGRectMake(15,85, 150, 15)];
    nonsupportlab.text = @"不支持七天退货";
    nonsupportlab.textColor = UIColorFromRGB(0xa7a7a7);
    nonsupportlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:nonsupportlab];
    
    UILabel *Offeredlab = [[UILabel alloc]initWithFrame:CGRectMake(15,110, 80, 15)];
    Offeredlab.text = @"参团人数：";
    Offeredlab.textColor = UIColorFromRGB(0xa7a7a7);
    Offeredlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:Offeredlab];
    
    UILabel *numberlab = [[UILabel alloc]initWithFrame:CGRectMake(80,110, 15, 15)];
    numberlab.text = @"12";
    numberlab.textColor = UIColorFromRGB(0x313131);
    numberlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:numberlab];
    
    UILabel *nowlab = [[UILabel alloc]initWithFrame:CGRectMake(115,110, 80, 15)];
    nowlab.text = @"当前人数：";
    nowlab.textColor = UIColorFromRGB(0xa7a7a7);
    nowlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:nowlab];
    
    UILabel *countlab = [[UILabel alloc]initWithFrame:CGRectMake(175,110, 15, 15)];
    countlab.text = @"9";
    countlab.textColor = UIColorFromRGB(0x313131);
    countlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:countlab];
    
    UILabel *waylab = [[UILabel alloc]initWithFrame:CGRectMake(205,110, 150, 15)];
    waylab.text = @"配送方式：";
    waylab.textColor = UIColorFromRGB(0xa7a7a7);
    waylab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:waylab];
    
    UILabel *merchantlab = [[UILabel alloc]initWithFrame:CGRectMake(270,110, 150, 15)];
    merchantlab.text = @"免费";
    merchantlab.textColor = UIColorFromRGB(0x313131);
    merchantlab.font = [UIFont systemFontOfSize:13];
    [whietvi addSubview:merchantlab];
    
    UILabel *explainlab = [[UILabel alloc]initWithFrame:CGRectMake(15,133,Width-15, 20)];
    explainlab.text = @"支付开团并等待9人参团，人数不足自动退款";
    explainlab.textColor = UIColorFromRGB(0x4e4e4e);
    explainlab.font = [UIFont systemFontOfSize:15];
    [whietvi addSubview:explainlab];
}
-(void)otherbtnCilk:(UIButton *)otherbtn{
    for (int i= 0 ; i<2; i++) {
   
    if (otherbtn.tag == 123+i) {
        otherbtn.backgroundColor = UIColorFromRGB(0x31cdaa);
        [otherbtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    }
    else{
        UIButton *otherbtn = (UIButton *)[self.view viewWithTag:123+i];
        otherbtn.backgroundColor = UIColorFromRGB(0xffffff);
        [otherbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
    }
  }
    if (otherbtn.tag == 123) {
        NSLog(@"其他拼团");
    }
    else{
        GroupView *group = [GroupView new];
        [self.navigationController pushViewController:group animated:YES];
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
