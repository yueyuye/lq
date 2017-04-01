//
//  browsingHistory.m
//  xiupin
//
//  Created by pro on 17/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "browsingHistory.h"

@interface browsingHistory ()
{
    UIView *browsigBJ;
    UIScrollView *allscrollview;
    NSArray *arr;
    UIView* view;
    
}

@end

@implementation browsingHistory

//出现横线

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"浏览记录"];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    arr = @[@"遇",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲",@"欲"];
    
    allscrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Width, Height)];
    [self.view addSubview:allscrollview];

    [self browsig];
    
    CGFloat scrollViewHeight = 0.0f;for (view in allscrollview.subviews){ scrollViewHeight += view.frame.size.height;}[allscrollview setContentSize:(CGSizeMake(320, scrollViewHeight+64))];

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


- (void)browsig{
    for (int i=0; i<arr.count; i++) {
        browsigBJ = [[UIView alloc]initWithFrame:CGRectMake(0, i*(280/2), Width,278/2)];
        browsigBJ.tag = 10+i;
        browsigBJ.backgroundColor = [UIColor whiteColor];
        [allscrollview addSubview:browsigBJ];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(17, 20, 100, 100)];
        img.image = [UIImage imageNamed:@"icon_message_system"];
        [browsigBJ addSubview:img];
        
        for (int j = 0; j<2; j++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(137, j*15+22+j*8, Width/2, 15)];
            [browsigBJ addSubview:lab];
            
            
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
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(137, 68, 20, 15)];
        lab.text = @"￥";
        lab.textColor =UIColorFromRGB(0xff0000);
        lab.font = [UIFont systemFontOfSize:16];
        [browsigBJ addSubview:lab];
        
        
        
        UILabel *jiagelab = [[UILabel alloc]initWithFrame:CGRectMake(150, 66, 50, 15)];
        jiagelab.text = @"49";
        jiagelab.textColor =UIColorFromRGB(0xff0000);
        jiagelab.font = [UIFont systemFontOfSize:16];
        [browsigBJ addSubview:jiagelab];
        
        
        UILabel *mendianjiagelab = [[UILabel alloc]initWithFrame:CGRectMake(180, 66, 80, 15)];
        mendianjiagelab.text = @"门店价：￥99";
        mendianjiagelab.textColor =UIColorFromRGB(0xa7a7a7);
        mendianjiagelab.font = [UIFont systemFontOfSize:12];
        [browsigBJ addSubview:mendianjiagelab];
        
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(50, mendianjiagelab.frame.size.height/2, 20,1)];
        vi.backgroundColor = UIColorFromRGB(0xa7a7a7);
        [mendianjiagelab addSubview:vi];
        
        
        UILabel *youhuilab = [[UILabel alloc]initWithFrame:CGRectMake(137, 83, Width, 20)];
        youhuilab.text = @"在满300的基础上再享优惠抵扣卷50元";
        youhuilab.textColor =UIColorFromRGB(0x616161);
        youhuilab.font = [UIFont systemFontOfSize:12];
        youhuilab.textAlignment = NSTextAlignmentLeft;
        [browsigBJ addSubview:youhuilab];
        
        
        UILabel * KMlab = [[UILabel alloc]initWithFrame:CGRectMake(137, 105, 40, 15)];
        KMlab.font = [UIFont systemFontOfSize:12];
        KMlab.textColor =UIColorFromRGB(0xa7a7a7);
        KMlab.text = @"12KM";
        [browsigBJ addSubview:KMlab];
        
        for (int k = 0; k<2; k++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(k*100+200, 105, 80, 15)];
            lab.font = [UIFont systemFontOfSize:12];
            lab.textColor =UIColorFromRGB(0xa7a7a7);
            [browsigBJ addSubview:lab];
            
            
            if (k == 0) {
                lab.text = @"203个评价";
                //                lab.backgroundColor = [UIColor redColor];
            }
            else{
                lab.text = @"好评率98%";
                //              lab.backgroundColor = [UIColor grayColor];
            }
        }
        
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
