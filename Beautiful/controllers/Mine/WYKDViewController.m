//
//  WYKDViewController.m
//  xiupin
//
//  Created by pro on 17/2/20.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WYKDViewController.h"
#import "MY.h"

@interface WYKDViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableBJ;
    UIView *view;
    CGFloat ko;
}
@end

@implementation WYKDViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"我要开店"];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake( 16, 32, 30/2, 38/2);
    // btn.backgroundColor= [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"icon_return_white-1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self slide];
    
    
    
    [self SetUpShop];
    [self shopType];
    [self shopSite];
    [self witness];
    [self permit];
    
    [self submit];

    
    NSLog(@"%f",Height);
}

- (void)btnturn{
   // MY * myturn = [[MY alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)slide{
    tableBJ = [[UITableView alloc]init];
    tableBJ.frame = CGRectMake(0, 64, Width, Height-64-88);
    tableBJ.contentSize = CGSizeMake(Width, Height*1.3);
    tableBJ.backgroundColor = UIColorFromRGB(0xf6f6f6);
    tableBJ.dataSource = self;
    tableBJ.delegate = self;
    tableBJ.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableBJ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strcell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strcell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strcell];
//        [self SetUpShop];
//        [self shopType];
//        [self shopSite];
//        [self witness];
//        [self permit];
    }
    return cell;
}



-(void)SetUpShop{
    UIView *shopNameBJ = [[UIView alloc]init];
    shopNameBJ.frame = CGRectMake( 0, 0, Width, 55);
    shopNameBJ.backgroundColor = UIColorFromRGB(0xffffff);
    [tableBJ addSubview:shopNameBJ];
    
    UILabel *shopname = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 15)];
    shopname.text = @"店铺名称";
    shopname.textColor = UIColorFromRGB(0x222222);
    shopname.textAlignment = 0;
    shopname.font = [UIFont systemFontOfSize:15];
    [shopNameBJ addSubview:shopname];
    
    UITextField *importName = [[UITextField alloc]init];
    importName.frame = CGRectMake( Width-115, 0, 100, 55);
    //importName.secureTextEntry = YES;
    importName.placeholder  = @"请输入店铺名称";
    //importName.clearsOnBeginEditing = YES;
    importName.font = [UIFont systemFontOfSize:14];
    importName.textAlignment = 1;
    importName.textColor = UIColorFromRGB(0x7a7a7a);
    [shopNameBJ addSubview:importName];
    
}

- (void)shopType{
    UIView *shopTypeBJ = [[UIView alloc]init];
    shopTypeBJ.frame = CGRectMake( 0, 55, Width, 56);
    shopTypeBJ.backgroundColor = UIColorFromRGB(0xffffff);
    [tableBJ addSubview:shopTypeBJ];

    UIView *cutOffRule = [[UIView alloc]initWithFrame:CGRectMake(15, 0, Width-30, 0.5)];
    cutOffRule.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [shopTypeBJ addSubview:cutOffRule];
    
    UILabel *shopname = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 15)];
    shopname.text = @"店铺类型";
    shopname.textColor = UIColorFromRGB(0x222222);
    shopname.textAlignment = 0;
    shopname.font = [UIFont systemFontOfSize:15];
    [shopTypeBJ addSubview:shopname];

    UIButton *btnchooseType = [UIButton buttonWithType:UIButtonTypeCustom];
    btnchooseType.frame = CGRectMake(Width-155/2, 0, 155/2, 55);
    [btnchooseType setTitle:@"请选择" forState:UIControlStateNormal];
    //btnchooseType.backgroundColor = [UIColor redColor];
    btnchooseType.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btnchooseType setTitleColor:UIColorFromRGB(0x7a7a7a) forState:UIControlStateNormal];
    btnchooseType.titleLabel.font = [UIFont systemFontOfSize:14];
    [shopTypeBJ addSubview:btnchooseType];
    
    UIButton *btnchooseimg = [UIButton buttonWithType:UIButtonTypeCustom];
    btnchooseimg.frame = CGRectMake(Width-50/2, 0, 10, 55);
    [btnchooseimg setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
    [btnchooseimg setTitleColor:UIColorFromRGB(0x7a7a7a) forState:UIControlStateNormal];
    btnchooseimg.titleLabel.font = [UIFont systemFontOfSize:14];
    [shopTypeBJ addSubview:btnchooseimg];

}

- (void)shopSite{
    UIView *shopSiteBJ = [[UIView alloc]init];
    shopSiteBJ.frame = CGRectMake( 0, 111, Width, 56);
    shopSiteBJ.backgroundColor = UIColorFromRGB(0xffffff);
    [tableBJ addSubview:shopSiteBJ];

    UIView *cutOffRule = [[UIView alloc]initWithFrame:CGRectMake(15, 0, Width-30, 0.5)];
    cutOffRule.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [shopSiteBJ addSubview:cutOffRule];
    
    UILabel *shopname = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 15)];
    shopname.text = @"店铺地址";
    shopname.textColor = UIColorFromRGB(0x222222);
    shopname.textAlignment = 0;
    shopname.font = [UIFont systemFontOfSize:15];
    [shopSiteBJ addSubview:shopname];
    
    UIButton *btnchooseType = [UIButton buttonWithType:UIButtonTypeCustom];
    btnchooseType.frame = CGRectMake(Width-155/2, 0, 155/2, 55);
    [btnchooseType setTitle:@"去设置" forState:UIControlStateNormal];
    //btnchooseType.backgroundColor = [UIColor redColor];
    btnchooseType.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btnchooseType setTitleColor:UIColorFromRGB(0x7a7a7a) forState:UIControlStateNormal];
    btnchooseType.titleLabel.font = [UIFont systemFontOfSize:14];
    [shopSiteBJ addSubview:btnchooseType];
    
    UIButton *btnchooseimg = [UIButton buttonWithType:UIButtonTypeCustom];
    btnchooseimg.frame = CGRectMake(Width-50/2, 0, 10, 55);
    [btnchooseimg setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
    [btnchooseimg setTitleColor:UIColorFromRGB(0x7a7a7a) forState:UIControlStateNormal];
    btnchooseimg.titleLabel.font = [UIFont systemFontOfSize:14];
    [shopSiteBJ addSubview:btnchooseimg];


}

- (void)witness{
    UIView *witnessBJ = [[UIView alloc]init];
    witnessBJ.frame = CGRectMake( 0, 167, Width, 191);
    witnessBJ.backgroundColor = UIColorFromRGB(0xffffff);
    [tableBJ addSubview:witnessBJ];
    
    UIView *cutOffRule = [[UIView alloc]initWithFrame:CGRectMake(15, 0, Width-30, 0.5)];
    cutOffRule.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [witnessBJ addSubview:cutOffRule];
    
    UILabel *shopname = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 15)];
    shopname.text = @"法人身份证";
    shopname.textColor = UIColorFromRGB(0x222222);
    shopname.textAlignment = 0;
    shopname.font = [UIFont systemFontOfSize:15];
    [witnessBJ addSubview:shopname];
    
    UIView *identityCardBJz = [[UIView alloc]initWithFrame:CGRectMake( 19, 51, 160, 199/2)];
    identityCardBJz.backgroundColor = UIColorFromRGB(0xf6f6f6);
    identityCardBJz.layer.borderColor = UIColorFromRGB(0xebebeb).CGColor;
    identityCardBJz.layer.borderWidth = 1;//边框宽
    [witnessBJ addSubview:identityCardBJz];
    
    UILabel *labIdz = [[UILabel alloc]initWithFrame:CGRectMake(85/2, 17, 75, 15)];
    labIdz.text = @"身份证正面";
    //labIdz.backgroundColor = [UIColor redColor];
    labIdz.font = [UIFont systemFontOfSize:14];
    labIdz.textAlignment = 1;
    labIdz.textColor = UIColorFromRGB(0xa1a1a1);
    [identityCardBJz addSubview:labIdz];
    
    UIButton *btnidz = [UIButton buttonWithType:UIButtonTypeCustom];
    btnidz.frame = CGRectMake(126/2, 90/2, 72/2, 72/2);
    [btnidz setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    btnidz.backgroundColor = UIColorFromRGB(0xdddddd);
    [btnidz addTarget:self action:@selector(jiaIDz) forControlEvents:UIControlEventTouchUpInside];
    [identityCardBJz addSubview:btnidz];

    UIView *identityCardBJf = [[UIView alloc]initWithFrame:CGRectMake( Width-160-41/2, 51, 160, 199/2)];
    identityCardBJf.backgroundColor = UIColorFromRGB(0xf6f6f6);
    //identityCardBJf.layer.borderColor = [UIColor redColor].CGColor;//边框颜色
    identityCardBJf.layer.borderColor = UIColorFromRGB(0xebebeb).CGColor;
    identityCardBJf.layer.borderWidth = 1;//边框宽
    [witnessBJ addSubview:identityCardBJf];
    
    UILabel *labIdf = [[UILabel alloc]initWithFrame:CGRectMake(85/2, 17, 75, 15)];
    labIdf.text = @"身份证反面";
    labIdf.font = [UIFont systemFontOfSize:14];
    labIdf.textAlignment = 1;
    labIdf.textColor = UIColorFromRGB(0xa1a1a1);
    [identityCardBJf addSubview:labIdf];
    
    UIButton *btnidf = [UIButton buttonWithType:UIButtonTypeCustom];
    btnidf.frame = CGRectMake(126/2, 90/2, 72/2, 72/2);
    [btnidf setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    btnidf.backgroundColor = UIColorFromRGB(0xdddddd);
    [btnidf addTarget:self action:@selector(jiaIDf) forControlEvents:UIControlEventTouchUpInside];
    [identityCardBJf addSubview:btnidf];
    
    UILabel *labHint = [[UILabel alloc]init];
    labHint.frame  =CGRectMake( 15, 318/2, Width-30, 25);
    labHint.text = @"* 手持身份证拍照,拍照时亲保持身份证上文字清晰可见!";
    labHint.textAlignment = 0;
    labHint.font = [UIFont systemFontOfSize:14];
    labHint.textColor = UIColorFromRGB(0xf54046);
    [witnessBJ addSubview:labHint];
                    


}

- (void)permit{
    
UIView *permitBJ = [[UIView alloc]init];
permitBJ.frame = CGRectMake( 0, 358, Width, 191);
permitBJ.backgroundColor = UIColorFromRGB(0xffffff);
[tableBJ addSubview:permitBJ];

    UIView *cutOffRule = [[UIView alloc]initWithFrame:CGRectMake(15, 0, Width-30, 0.5)];
    cutOffRule.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [permitBJ addSubview:cutOffRule];
    
    UILabel *shopName = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 15)];
    shopName.text = @"营业执照";
    shopName.textColor = UIColorFromRGB(0x222222);
    shopName.textAlignment = 0;
    shopName.font = [UIFont systemFontOfSize:15];
    [permitBJ addSubview:shopName];

//    UILabel *shopname = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 15)];
//    shopname.text = @"法人身份证";
//    shopname.textColor = UIColorFromRGB(0x222222);
//    shopname.textAlignment = 0;
//    shopname.font = [UIFont systemFontOfSize:15];
//    [permitBJ addSubview:shopname];
    
    UIView *licenseBJ = [[UIView alloc]initWithFrame:CGRectMake( 19, 51, 160, 199/2)];
    licenseBJ.backgroundColor = UIColorFromRGB(0xf6f6f6);
    licenseBJ.layer.borderColor = UIColorFromRGB(0xebebeb).CGColor;
    licenseBJ.layer.borderWidth = 1;//边框宽
    [permitBJ addSubview:licenseBJ];
    
    UILabel *labIdz = [[UILabel alloc]initWithFrame:CGRectMake(85/2, 17, 75, 15)];
    labIdz.text = @"营业执照";
    labIdz.font = [UIFont systemFontOfSize:14];
    labIdz.textAlignment = 1;
    labIdz.textColor = UIColorFromRGB(0xa1a1a1);
    [licenseBJ addSubview:labIdz];
    
    UIButton *btnidz = [UIButton buttonWithType:UIButtonTypeCustom];
    btnidz.frame = CGRectMake(126/2, 90/2, 72/2, 72/2);
    [btnidz setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    btnidz.backgroundColor = UIColorFromRGB(0xdddddd);
    [btnidz addTarget:self action:@selector(jiaZZ) forControlEvents:UIControlEventTouchUpInside];
    [licenseBJ addSubview:btnidz];
    
    UILabel *labHint = [[UILabel alloc]init];
    labHint.frame  =CGRectMake( 15, 318/2, Width-30, 25);
    labHint.text = @"* 拍照时请保持营业执照上文字清晰可见!";
    labHint.textAlignment = 0;
    labHint.font = [UIFont systemFontOfSize:14];
    labHint.textColor = UIColorFromRGB(0xf54046);
    [permitBJ addSubview:labHint];

}

- (void)submit{
    UIView *SBview = [[UIView alloc]initWithFrame:CGRectMake( 0, Height-88, Width, 88)];
    SBview.backgroundColor = UIColorFromRGB(0xf6f6f6);
    //SBview.backgroundColor = [UIColor redColor];
    [self.view addSubview:SBview];
    
    UIView *submitView = [[UIView alloc]initWithFrame:CGRectMake(15, 44, Width-30, 44)];
    submitView.layer.cornerRadius = 15/2;
    //submitView.layer.masksToBounds = YES;
    submitView.backgroundColor = UIColorFromRGB(0x31cdaa);
    submitView.backgroundColor = [UIColor whiteColor];
    [SBview addSubview:submitView];
    
    UIView *bjview = [[UIView alloc]init];
    bjview.frame = CGRectMake(0, Height-35, Width, 35);
    bjview.backgroundColor = UIColorFromRGB(0x000000);
    [SBview addSubview:bjview];
    
    UIButton *btnSB = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSB.frame = CGRectMake( Width/2-35, 14, 35, 35);
    [btnSB setTitle:@"提交" forState:UIControlStateNormal];
    [btnSB setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [btnSB addTarget:self action:@selector(tijiao) forControlEvents:UIControlEventTouchUpInside];
    btnSB.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    btnSB.titleLabel.font = [UIFont systemFontOfSize:17];
    [submitView addSubview:btnSB];
}

- (void)jiaIDz{
    NSLog(@"%f",Height);
}

- (void)jiaIDf{
    NSLog(@"身份证反面");
}

- (void)jiaZZ{
    NSLog(@"添加营业执照");
}

- (void)tijiao{
    NSLog(@"提交");
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
