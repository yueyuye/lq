//
//  Manager.m
//  xiupin
//
//  Created by pro on 17/2/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Manager.h"

@interface Manager ()
{
    UIScrollView *scroll;
    UIView *view;
}

@end

@implementation Manager

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"区域经理管理"];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake( 16, 32, 30/2, 38/2);
   // btn.backgroundColor= [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"icon_return_white-1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self manager];
    
    CGFloat scrollViewHeight = 0.0f;for (view in scroll.subviews){ scrollViewHeight += view.frame.size.height;}[scroll setContentSize:(CGSizeMake(320, scrollViewHeight+64))];
    
}

- (void)btnturn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)manager{
    
    
    UIView *viewBJ = [[UIView alloc]init];
    viewBJ.frame = CGRectMake(0, 64, Width, 112/2);
    [self.view addSubview:viewBJ];
    
    UILabel *labName = [[UILabel alloc]init];
    labName.frame = CGRectMake(15, 20, 75, 16);
    labName.textAlignment = 0;
    labName.text = @"名字";
    labName.font = [UIFont systemFontOfSize:15];
    [viewBJ addSubview:labName];
    
    UILabel *labPhong = [[UILabel alloc]init];
    labPhong.frame = CGRectMake( 315/2, 20, 250/2, 16);
    labPhong.textAlignment = 0;
    labPhong.text = @"电话号码";
    labPhong.font = [UIFont systemFontOfSize:15];
    [viewBJ addSubview:labPhong];
    
    
    UIView *viewStriping = [[UIView alloc]initWithFrame:CGRectMake( 15, 111/2, Width-30, 0.5)];
    viewStriping.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [viewBJ addSubview:viewStriping];
    

    scroll = [[UIScrollView alloc]init];
    scroll.frame = CGRectMake(0, 64+112/2, Width, Height);
    [self.view addSubview:scroll];
    
    for (int i=0; i<5; i++) {
        
        UIView *viewBJ = [[UIView alloc]init];
        viewBJ.frame = CGRectMake(0, i*112/2, Width, 112/2);
        [scroll addSubview:viewBJ];
        
        
        UILabel *labName = [[UILabel alloc]init];
        labName.frame = CGRectMake(15, 20, 75, 16);
        labName.textAlignment = 0;
        labName.text = @"甜蜜儿";
        labName.font = [UIFont systemFontOfSize:15];
        [viewBJ addSubview:labName];
        
        UILabel *labPhong = [[UILabel alloc]init];
        labPhong.frame = CGRectMake( 315/2, 20, 250/2, 16);
        //labPhong.backgroundColor = [UIColor redColor];
        labPhong.textAlignment = 0;
        labPhong.text = @"1234567891011";
        labPhong.font = [UIFont systemFontOfSize:15];
        [viewBJ addSubview:labPhong];
        
        
        UIView *viewStriping = [[UIView alloc]initWithFrame:CGRectMake( 15, 111/2, Width-30, 0.5)];
        viewStriping.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [viewBJ addSubview:viewStriping];
        
        
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
