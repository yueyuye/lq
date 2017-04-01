//
//  Commodity_detailsView.m
//  购物车
//
//  Created by pro on 17/2/28.
//  Copyright (c) 2017年 yi. All rights reserved.
//

#import "Commodity_detailsView.h"

@interface Commodity_detailsView ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>{
    UIScrollView *ScView;
    NSMutableArray *Array;
    UIScrollView *ScrollView;
    UIPageControl *page;
    int number;
}

@end

@implementation Commodity_detailsView

- (void)viewDidLoad {
    [super viewDidLoad];
     Array=[NSMutableArray arrayWithObjects:@"1.jpg",@"5.jpeg",@"2.jpg",@"3.jpg",@"4.jpg", nil];
//    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    // Do any additional setup after loading the view.
    
   
    
    
#pragma mark   总体介绍
    
    ScView=[UIScrollView new];
    ScView.frame=CGRectMake(0, 0, Width, Height);
    ScView.contentSize=CGSizeMake(0, Height*1.3);
    [self.view addSubview:ScView];
    
//    UIView *transparentView=[UIView new];
//    transparentView.frame=CGRectMake(0,0, Width, 200);
//    transparentView.backgroundColor=[UIColor clearColor];
//    [ScView addSubview:transparentView];
    
    
    ScrollView=[UIScrollView new];
    ScrollView.frame=CGRectMake(0, 0, Width, 200);
    ScrollView.showsVerticalScrollIndicator = NO;
    ScrollView.showsHorizontalScrollIndicator = NO;
    ScrollView.bounces=NO;
    ScrollView.contentSize = CGSizeMake(Width*5, 0);
    ScrollView.delegate = self;
    ScrollView.pagingEnabled = YES;
    [self.view addSubview:ScrollView];
    
    for (int i=0; i<Array.count; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*Width, 0, Width, 200)];
        img.userInteractionEnabled = YES;
        img.image= [UIImage imageNamed:Array[i]];
        [ScrollView addSubview:img];
    }
    page = [[UIPageControl alloc]initWithFrame:CGRectMake(Width/2-40, 160, 80, 20)];
    page.numberOfPages = Array.count;
    page.hidesForSinglePage = YES;
    page.currentPage = 0;
    page.currentPageIndicatorTintColor= UIColorFromRGB(0x31cdaa);
    page.pageIndicatorTintColor = UIColorFromRGB(0xd1d1d1);
    [page addTarget:self action:@selector(page:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:page];
    
    UIButton *returnBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.frame=CGRectMake(15, 25, 30, 30);
    [returnBtn setImage:[UIImage imageNamed:@"icon_return_details"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(returnButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    
    UIView *backdropView=[UIView new];
    backdropView.frame=CGRectMake(0,200, Width, Height*1.3-200);
    backdropView.backgroundColor=UIColorFromRGB(0xf6f6f6);
    [ScView addSubview:backdropView];
    
    UIView *introduceView=[UIView new];
    introduceView.frame=CGRectMake(0,0, Width, 143);
    introduceView.backgroundColor= [UIColor whiteColor];
    [backdropView addSubview:introduceView];
    
    UILabel *nameLabel=[UILabel new];
    nameLabel.frame=CGRectMake(15, 15, 277, 32);
    nameLabel.text=@"生日蛋糕水果蛋糕奶油蛋糕生日蛋糕水果蛋糕奶油蛋糕";
    nameLabel.numberOfLines=0;
    [nameLabel sizeToFit];
    nameLabel.textColor=UIColorFromRGB(0x222222);
    nameLabel.font=[UIFont systemFontOfSize:16];
    [introduceView addSubview:nameLabel];
    
    UILabel *currencyLabel=[UILabel new];
    currencyLabel.frame=CGRectMake(15,60, 13, 32);
    currencyLabel.text=@"￥";
    currencyLabel.textColor=UIColorFromRGB(0xff0000);
    currencyLabel.font=[UIFont systemFontOfSize:16];
    [introduceView addSubview:currencyLabel];
    
    UILabel *priceLabel=[UILabel new];
    priceLabel.frame=CGRectMake(28, 50, 132, 45);
    priceLabel.text=@"199.99";
    priceLabel.textColor=UIColorFromRGB(0xff0000);
    priceLabel.font=[UIFont systemFontOfSize:22];
    [introduceView addSubview:priceLabel];
    
    UILabel *shopLabel=[UILabel new];
    shopLabel.frame=CGRectMake(123, 62,90, 28);
    shopLabel.textColor=UIColorFromRGB(0xa9a9a9);
    shopLabel.font=[UIFont systemFontOfSize:14];
    shopLabel.text=@"门店价：￥99";
    [introduceView addSubview:shopLabel];
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(58, 12, 27,1)];
    vi.backgroundColor = UIColorFromRGB(0xa7a7a7);
    [shopLabel addSubview:vi];
    
    UILabel *detailaLabel=[UILabel new];
    detailaLabel.frame=CGRectMake(15, 85, 280, 28);
    detailaLabel.text=@"在满300送50的基础上再享受优惠券抵扣50元";
    detailaLabel.textColor=UIColorFromRGB(0x4e4e4e);
    detailaLabel.font=[UIFont systemFontOfSize:14];
    [introduceView addSubview:detailaLabel];
    
    UIImageView *pictureImg=[UIImageView new];
    pictureImg.frame=CGRectMake(15, 116, 14, 14);
    pictureImg.image=[UIImage imageNamed:@"icon_choose_green"];
    [introduceView addSubview:pictureImg];
    
    UILabel *returnLabel=[UILabel new];
    returnLabel.frame=CGRectMake(32, 109, 70, 28);
    returnLabel.text=@"7天退货";
    returnLabel.font=[UIFont systemFontOfSize:14];
    returnLabel.textColor=UIColorFromRGB(0xa9a9a9);
    [introduceView addSubview:returnLabel];
    
    UILabel *distanceLabel=[UILabel new];
    distanceLabel.frame=CGRectMake(128, 109, 100, 28);
    distanceLabel.text=@"12KM内免费送";
    distanceLabel.font=[UIFont systemFontOfSize:14];
    distanceLabel.textColor=UIColorFromRGB(0xa9a9a9);
    [introduceView addSubview:distanceLabel];
    
    UIButton *shareBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame=CGRectMake(Width-50, 8, 30, 45);
    [shareBtn addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
    [introduceView addSubview:shareBtn];
    
    UIImageView *shareImg=[UIImageView new];
    shareImg.image=[UIImage imageNamed:@"icon_home_now"];
    shareImg.frame=CGRectMake(0, 0, 30, 17);
    [shareBtn addSubview:shareImg];
    
    UILabel *shareLabel=[UILabel new];
    shareLabel.text=@"分享";
    shareLabel.textColor=UIColorFromRGB(0xa9a9a9);
    shareLabel.frame=CGRectMake(0, 17, 30, 28);
    shareLabel.font=[UIFont systemFontOfSize:14];
    [shareBtn addSubview:shareLabel];
    
    UIButton *delegationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    delegationBtn.frame=CGRectMake(Width-70, 65, 65, 28);
    [delegationBtn addTarget:self action:@selector(delegationButton:) forControlEvents:UIControlEventTouchUpInside];
    [delegationBtn setTitle:@"我要组团" forState:UIControlStateNormal];
    [delegationBtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
    delegationBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [introduceView addSubview:delegationBtn];
    
    UILabel *anticipateLabel=[UILabel new];
    anticipateLabel.frame=CGRectMake(Width-124, 109, 115, 28);
    anticipateLabel.text=@"预计24小时内送达";
    anticipateLabel.font=[UIFont systemFontOfSize:14];
    anticipateLabel.textColor=UIColorFromRGB(0xa9a9a9);
    [introduceView addSubview:anticipateLabel];
    
#pragma mark 营业————————
    
    UIView *businessView=[UIView new];
    businessView.frame=CGRectMake(0, 153, Width, 123);
    businessView.backgroundColor=[UIColor whiteColor];
    [backdropView addSubview:businessView];
    
    UIImageView *timeImg=[UIImageView new];
    timeImg.frame=CGRectMake(15, 18, 18, 18);
    timeImg.image=[UIImage imageNamed:@"icon_time"];
    [businessView addSubview:timeImg];
    
    UILabel *businessLabel=[UILabel new];
    businessLabel.frame=CGRectMake(40, 15, 70, 25);
    businessLabel.text=@"营业时间：";
    businessLabel.textColor=UIColorFromRGB(0x222222);
    businessLabel.font=[UIFont systemFontOfSize:14];
    [businessView addSubview:businessLabel];
    
    UILabel *timeLabel=[UILabel new];
    timeLabel.frame=CGRectMake(40, 35,280, 28);
    timeLabel.text=@"周一到周五  09：00--22：00   丨   正在营业";
    timeLabel.textColor=UIColorFromRGB(0x222222);
    timeLabel.font=[UIFont systemFontOfSize:14];
    [businessView addSubview:timeLabel];
    
    UILabel *lineLab=[UILabel new];
    lineLab.frame=CGRectMake(15, 68, Width-40, 1);
    lineLab.backgroundColor=UIColorFromRGB(0xe9e9e9);
    [businessView addSubview:lineLab];
    
    UIImageView *GPSImg=[UIImageView new];
    GPSImg.frame=CGRectMake(15, 88, 18, 18);
    GPSImg.image=[UIImage imageNamed:@"icon_start"];
    [businessView addSubview:GPSImg];
    
    UILabel *GPSLabel=[UILabel new];
    GPSLabel.frame=CGRectMake(40, 85,270, 28);
    GPSLabel.text=@"成都市益州大道南段888号益州国际广场";
    GPSLabel.textColor=UIColorFromRGB(0x222222);
    GPSLabel.font=[UIFont systemFontOfSize:14];
    [businessView addSubview:GPSLabel];
    
    UIButton *distanceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    distanceBtn.frame=CGRectMake(Width-50,80, 40, 40);
    [distanceBtn addTarget:self action:@selector(distanceButton:) forControlEvents:UIControlEventTouchUpInside];
    [businessView addSubview:distanceBtn];
    
    UILabel *distanceLab=[UILabel new];
    distanceLab.text=@"2.6KM";
    distanceLab.textColor=UIColorFromRGB(0x31cdaa);
    distanceLab.frame=CGRectMake(Width-50, 80, 37, 24);
    distanceLab.font=[UIFont systemFontOfSize:12];
    [businessView addSubview:distanceLab];
    
    UIImageView *distanceImg=[UIImageView new];
    distanceImg.image=[UIImage imageNamed:@"icon_position"];
    distanceImg.frame=CGRectMake(Width-38, 105, 10, 10);
    [businessView addSubview:distanceImg];
    
    
#pragma mark - - 选择颜色 - -
    
    
    UIButton *chooseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.frame=CGRectMake(0, 286, Width, 55);
    [chooseBtn addTarget:self action:@selector(chooseButton:) forControlEvents:UIControlEventTouchUpInside];
    chooseBtn.backgroundColor=[UIColor whiteColor];
    [backdropView addSubview:chooseBtn];
    
    UILabel *chooseLabel=[UILabel new];
    chooseLabel.frame=CGRectMake(15, 20, 140, 15);
    chooseLabel.text=@"选择颜色、型号分类";
    chooseLabel.textColor=UIColorFromRGB(0x222222);
    chooseLabel.font=[UIFont systemFontOfSize:14];
    [chooseBtn addSubview:chooseLabel];
    
    UIImageView *chooseImg=[UIImageView new];
    chooseImg.image=[UIImage imageNamed:@"icon_next_right"];
    chooseImg.frame=CGRectMake(Width-25, 20, 10, 15);
    [chooseBtn addSubview:chooseImg];
    
#pragma mark --  宝贝评价  --
    
    UIView *judgeView=[UIView new];
    judgeView.frame=CGRectMake(0, 351, Width, 220);
    judgeView.backgroundColor=[UIColor whiteColor];
    [backdropView addSubview:judgeView];
    
    UILabel *judgeLabel=[UILabel new];
    judgeLabel.text=@"宝贝评价（1025）";
    judgeLabel.frame=CGRectMake(15, 15, 117, 17);
    judgeLabel.textColor=UIColorFromRGB(0x222222);
    judgeLabel.font=[UIFont systemFontOfSize:14];
    [judgeView addSubview:judgeLabel];
    
    UIButton *totalBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    totalBtn.frame=CGRectMake(15, 53, 44, 25);
    totalBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    totalBtn.layer.cornerRadius = 12.0f;
    [totalBtn setTitle:@"全部" forState:UIControlStateNormal];
    [totalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    totalBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [totalBtn addTarget:self action:@selector(totalButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:totalBtn];
    
    UIButton *goodBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    goodBtn.frame=CGRectMake(75, 53, 90, 25);
    goodBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    goodBtn.layer.cornerRadius = 12.0f;
    [goodBtn setTitle:@"  好评（999+）" forState:UIControlStateNormal];
    [goodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    goodBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [goodBtn addTarget:self action:@selector(goodButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:goodBtn];
    
    UIButton *centreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    centreBtn.frame=CGRectMake(180, 53, 100, 25);
    centreBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    centreBtn.layer.cornerRadius = 12.0f;
    [centreBtn setTitle:@"中评（20）" forState:UIControlStateNormal];
    [centreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    centreBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [centreBtn addTarget:self action:@selector(centreButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:centreBtn];
    
    UIButton *mistakeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    mistakeBtn.frame=CGRectMake(295, 53, 65, 25);
    mistakeBtn.backgroundColor=UIColorFromRGB(0xdbdbdb);
    mistakeBtn.layer.cornerRadius = 12.0f;
    [mistakeBtn setTitle:@" 差评（3）" forState:UIControlStateNormal];
    [mistakeBtn setTitleColor:UIColorFromRGB(0x6c6c6c) forState:UIControlStateNormal];
    mistakeBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [mistakeBtn addTarget:self action:@selector(mistakeButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:mistakeBtn];
    
    UIButton *headBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame=CGRectMake(15, 93, 41, 41);
    [headBtn setImage:[UIImage imageNamed:@"timg-1.jpeg"] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(headBtn:) forControlEvents:UIControlEventTouchUpInside];
    headBtn.layer.cornerRadius=20.5;
    headBtn.layer.masksToBounds=YES;
    [judgeView addSubview:headBtn];
    
    UILabel *nameLab=[UILabel new];
    nameLab.frame=CGRectMake(66, 90, 46, 30);
    nameLab.text=@"甜蜜儿";
    nameLab.textColor=UIColorFromRGB(0x6c6c6c);
    nameLab.font=[UIFont systemFontOfSize:15];
    [judgeView addSubview:nameLab];
    
    for (int i=0; i<4; i++) {
        UIImageView *speckImg=[UIImageView new];
        speckImg.frame=CGRectMake(66+12*i, 115, 12, 15);
        speckImg.image=[UIImage imageNamed:@"icon_star_yellow"];
        [judgeView addSubview:speckImg];
        
        UIImageView *speckImg2=[UIImageView new];
        speckImg2.frame=CGRectMake(114, 115, 12, 15);
        speckImg2.image=[UIImage imageNamed:@"icon_star_gray"];
        [judgeView addSubview:speckImg2];
    }
    
    UILabel *fair_evaluationLabel=[UILabel new];
    fair_evaluationLabel.frame=CGRectMake(66, 140, 250, 28);
    fair_evaluationLabel.text=@"服务态度好，服务态度好！！！";
    fair_evaluationLabel.textColor=UIColorFromRGB(0x222222);
    fair_evaluationLabel.numberOfLines=0;
    [fair_evaluationLabel sizeToFit];
    [judgeView addSubview:fair_evaluationLabel];
    
    UIButton *inspectBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    inspectBtn.frame=CGRectMake(Width/2-55,175, 110, 28);
    inspectBtn.backgroundColor=[UIColor whiteColor];
    inspectBtn.layer.borderColor = [UIColorFromRGB(0xf5a81f)CGColor];
    [inspectBtn.layer setBorderWidth:1];
    inspectBtn.layer.cornerRadius = 5.0f;
    [inspectBtn setTitle:@"查看全部评论" forState:UIControlStateNormal];
    [inspectBtn setTitleColor:UIColorFromRGB(0xf5a81f) forState:UIControlStateNormal];
    inspectBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [inspectBtn addTarget:self action:@selector(inspectButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:inspectBtn];
    
#pragma mark --  上啦查看详情  --
    
    UIButton *pullBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    pullBtn.frame=CGRectMake(0,570,Width, 38);
    [pullBtn addTarget:self action:@selector(pullButton:) forControlEvents:UIControlEventTouchUpInside];
    [backdropView addSubview:pullBtn];
    
    UIImageView *pullImg=[UIImageView new];
    pullImg.image=[UIImage imageNamed:@"icon_up_slide"];
    pullImg.frame=CGRectMake(115, 14, 18, 18);
    [pullBtn addSubview:pullImg];
    
    UILabel *pullLab=[UILabel new];
    pullLab.text=@"上啦查看图文详情";
    pullLab.textColor=UIColorFromRGB(0xa9a9a9a);
    pullLab.frame=CGRectMake(140, 11, 168, 28);
    pullLab.font=[UIFont systemFontOfSize:14];
    [pullBtn addSubview:pullLab];
    
#pragma mark ---  客服、店铺   ---
    
    UILabel *lineLab2=[UILabel new];
    lineLab2.frame=CGRectMake(0,Height-49, 126, 2);
    lineLab2.backgroundColor=UIColorFromRGB(0x222222);
    [self.view addSubview:lineLab2];
    
    UIButton *customer_serviceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    customer_serviceBtn.frame=CGRectMake(0,Height-50, 63, 50);
    customer_serviceBtn.backgroundColor=UIColorFromRGB(0xf0f0f0);
    [customer_serviceBtn addTarget:self action:@selector(customer_serviceButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customer_serviceBtn];
    
    UIImageView *customer_serviceImg=[UIImageView new];
    customer_serviceImg.image=[UIImage imageNamed:@"icon_service"];
    customer_serviceImg.frame=CGRectMake(18,5, 26, 21);
    [customer_serviceBtn addSubview:customer_serviceImg];
    
    UILabel *customer_serviceLabel=[UILabel new];
    customer_serviceLabel.text=@"客服";
    customer_serviceLabel.textColor=UIColorFromRGB(0x797979);
    customer_serviceLabel.frame=CGRectMake(18, 26, 25, 24);
    customer_serviceLabel.font=[UIFont systemFontOfSize:12];
    [customer_serviceBtn addSubview:customer_serviceLabel];
    
    UILabel *lineLab3=[UILabel new];
    lineLab3.frame=CGRectMake(62,5,2, 40);
    lineLab3.backgroundColor=UIColorFromRGB(0x222222);
    [customer_serviceBtn addSubview:lineLab3];
    
    UIButton *ShopBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    ShopBtn.frame=CGRectMake(63,Height-50, 63, 50);
    ShopBtn.backgroundColor=UIColorFromRGB(0xf0f0f0);
    [ShopBtn addTarget:self action:@selector(ShopButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ShopBtn];
    
    UIImageView *ShopImg=[UIImageView new];
    ShopImg.image=[UIImage imageNamed:@"icon_store"];
    ShopImg.frame=CGRectMake(18,5, 26, 21);
    [ShopBtn addSubview:ShopImg];
    UILabel *ShopLabel=[UILabel new];
    ShopLabel.text=@"店铺";
    ShopLabel.textColor=UIColorFromRGB(0x797979);
    ShopLabel.frame=CGRectMake(18, 26, 25, 24);
    ShopLabel.font=[UIFont systemFontOfSize:12];
    [ShopBtn addSubview:ShopLabel];
    
#pragma mark  加入购物车、立即购买
    
    UIButton *Shopping_cartBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Shopping_cartBtn.frame=CGRectMake(Width-250,Height-50,125, 50);
    Shopping_cartBtn.backgroundColor=UIColorFromRGB(0xf5a81f);
    [Shopping_cartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [Shopping_cartBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    Shopping_cartBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [Shopping_cartBtn addTarget:self action:@selector(Shopping_cartButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Shopping_cartBtn];
    
    UIButton *Buy_nowBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Buy_nowBtn.frame=CGRectMake(Width-125,Height-50,125, 50);
    Buy_nowBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    [Buy_nowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [Buy_nowBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    Buy_nowBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [Buy_nowBtn addTarget:self action:@selector(Buy_nowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Buy_nowBtn];
    
    
}
-(void)page:(UIPageControl *)page1{
    ScrollView.contentOffset = CGPointMake(Width *page.currentPage, 0);
    number = (int)page.currentPage;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //根据scrollView的偏移量来设置pageControl
    
    page.currentPage=scrollView.contentOffset.x/Width;
    
    number=scrollView.contentOffset.x/Width;
    
    
}
-(void)returnButton:(UIButton *)Btn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)shareButton:(UIButton *)btn{
    NSLog( @"----分享----");
}
-(void)delegationButton:(UIButton *)button{
    NSLog(@"===我要组团===");
//    GroupView *GroupVC=[GroupView new];
//    //    GroupVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:GroupVC animated:YES];
}
-(void)distanceButton:(UIButton *)bttn{
    NSLog(@"===定位距离===");
}
-(void)chooseButton:(UIButton *)button{
    NSLog(@"---选择颜色、型号---");
}
-(void)totalButton:(UIButton *)button{
    NSLog(@" 全部评价");
}
-(void)goodButton:(UIButton *)button{
    NSLog(@" 好评 ");
}
-(void)centreButton:(UIButton *)button{
    NSLog(@" 中评 ");
}
-(void)mistakeButton:(UIButton *)button{
    NSLog(@" 差评 ");
}
-(void)headBtn:(UIButton *)button{
    NSLog(@" 个人头像 ");
}
-(void)inspectButton:(UIButton *)button{
    NSLog(@"查看全部评论");
}
-(void)pullButton:(UIButton *)btn{
    NSLog(@"上拉刷新");
}
-(void)customer_serviceButton:(UIButton *)button{
    NSLog(@"客服");
}
-(void)ShopButton:(UIButton *)button{
    NSLog(@"店铺");
}
-(void)Shopping_cartButton:(UIButton *)button{
    NSLog(@"加入购物车");
}
-(void)Buy_nowButton:(UIButton *)button{
    NSLog(@"立即购买");
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
