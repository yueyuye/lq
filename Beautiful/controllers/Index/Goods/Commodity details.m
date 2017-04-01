//
//  Commodity details.m
//  xiupin
//
//  Created by pro on 17/2/23.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "Commodity details.h"
#import "GroupView.h"
#import "PhotoVC.h"
#import "Shop.h"
#import "ServiceVC.h"
#import "AppraisaVC.h"
@interface Commodity_details ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIScrollView *ScView;
    NSMutableArray *Array;
    UIScrollView *imgScrollView;
    UIPageControl *page;
    
    int numcolor;
    int amount;
    int number;
    

    UIView *toolbar;
    UIView *backvi;
    UIView *view;
    UIView *paymentVi;
    
    UIImageView *image;
    UIImageView *returnImg;
    
    UIButton *returnBtn;
    
    UITableView *paymenttabvi;
    
    NSMutableArray * classifyarry;
    NSMutableArray *selectedArray;
    NSMutableArray *colormuarry;
    NSMutableArray *materialarry;
    
    NSArray *deliveryarr;
    NSDictionary *dic;
    
    NSMutableArray *expressarry;
    
    NSArray *expressarr;
    
    int expresstype;
    
    UIView *sharevi;
    
    NSMutableArray *shareimgarr;
    NSMutableArray *sharelabarr;
}

@end

@implementation Commodity_details

- (void)viewDidLoad {
    
    amount =1;
    
    expresstype = 0;
    
    selectedArray = [NSMutableArray new];
    
    shareimgarr = [NSMutableArray arrayWithObjects:@"weixin",@"friend_circle",@"sina",@"QQ",nil];
    sharelabarr = [NSMutableArray arrayWithObjects:@"微信好友",@"朋友圈",@"新浪微博",@"QQ", nil];
    
    expressarr = @[@"快递1",@"快递2",@"快递3"];
    expressarry = [NSMutableArray arrayWithObjects:@"快递1",@"价格",@"范围", nil];
    
    classifyarry = [NSMutableArray arrayWithObjects:@"订购数量",@"配送方式",@"颜色",@"材质",nil];
    colormuarry =[NSMutableArray arrayWithObjects:@"蓝色",@"蓝色",@"绿色",@"绿色",nil];
    materialarry = [NSMutableArray arrayWithObjects:@"白装",@"蓝装",@"紫装",@"橙装",@"粉装",@"神装",@"鬼装", nil];
    
    Array=[NSMutableArray arrayWithObjects:@"banner-1",@"icon_home_now",nil];
    [super viewDidLoad];
    
    deliveryarr = @[@"上门自提",@"普通配送",@"快递"];
   
    
    ScView=[UIScrollView new];
    ScView.frame=CGRectMake(0,-20, Width, Height+20);
    ScView.contentSize=CGSizeMake(0,940);
    ScView.showsVerticalScrollIndicator=NO;
    ScView.tag = 111;
    ScView.delegate =self;
    ScView.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self.view addSubview:ScView];
    
    
    
    imgScrollView=[UIScrollView new];
    imgScrollView.frame=CGRectMake(0, 0, Width, Height*.4);
    imgScrollView.showsVerticalScrollIndicator = NO;
    imgScrollView.showsHorizontalScrollIndicator = NO;
    imgScrollView.bounces=NO;
    imgScrollView.contentSize = CGSizeMake(Width*Array.count, 0);
    imgScrollView.delegate = self;
    imgScrollView.pagingEnabled = YES;
    [ScView addSubview:imgScrollView];
    
    for (int i=0; i<Array.count; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*Width, 0, Width, Height*.5)];
        img.image = [UIImage imageNamed:Array[i]];
        img.userInteractionEnabled = YES;
        [imgScrollView addSubview:img];
    }
   page = [[UIPageControl alloc]initWithFrame:CGRectMake(Width/2-40, Height*.4-19, 80, 20)];
    page.numberOfPages = Array.count;
    page.hidesForSinglePage = YES;
    page.currentPage = 0;
    page.currentPageIndicatorTintColor= UIColorFromRGB(0x31cdaa);
    page.pageIndicatorTintColor = UIColorFromRGB(0xd1d1d1);
    [page addTarget:self action:@selector(page:) forControlEvents:UIControlEventTouchUpInside];
    [ScView addSubview:page];
    
    
    
   
    
    returnBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.frame=CGRectMake(15, 25, 30, 30);
    [returnBtn setImage:[UIImage imageNamed:@"icon_return_details"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(returnButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    
    
    view = [[UIView alloc]initWithFrame:CGRectMake(0, Height*.4, Width, ScView.frame.size.height-Height*.4)];
    [ScView addSubview:view];
#pragma mark   总体介绍
    
   
    
    UIView *introduceView=[UIView new];
    introduceView.frame=CGRectMake(0,0, Width, 143);
    introduceView.backgroundColor=[UIColor whiteColor];
    [view addSubview:introduceView];
    
    UILabel *nameLabel=[UILabel new];
    nameLabel.frame=CGRectMake(15, 15, Width- 99, 32);
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
    shopLabel.frame=CGRectMake(123, 60,90, 28);
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
    
    returnImg=[UIImageView new];
    returnImg.frame=CGRectMake(15, 116, 14, 14);
    returnImg.image = [UIImage imageNamed:@"icon_success"];
    [introduceView addSubview:returnImg];
    
    UIButton * returnbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnbtn.frame=CGRectMake(23, 109, 70, 28);
    [returnbtn setTitle:@"7天退货" forState:UIControlStateNormal] ;
    [returnbtn addTarget:self action:@selector(returnbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    returnbtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [returnbtn setTitleColor:UIColorFromRGB(0xa9a9a9) forState:UIControlStateNormal];
    [introduceView addSubview:returnbtn];
    
    UILabel *distanceLabel=[UILabel new];
    distanceLabel.frame=CGRectMake(Width-215, 109, 100, 28);
    distanceLabel.text=@"12KM内免费送";
    distanceLabel.font=[UIFont systemFontOfSize:12];
    distanceLabel.textColor=UIColorFromRGB(0xa9a9a9);
    [introduceView addSubview:distanceLabel];
    
    UIButton *shareBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame=CGRectMake(Width-50, 8, 30, 45);
    [shareBtn addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
    [introduceView addSubview:shareBtn];
    
    UIImageView *shareImg=[UIImageView new];
    shareImg.image=[UIImage imageNamed:@"icon_share"];
    shareImg.frame=CGRectMake(0, 0, 30, 20);
    [shareBtn addSubview:shareImg];
    
    UILabel *shareLabel=[UILabel new];
    shareLabel.text=@"分享";
    shareLabel.textColor=UIColorFromRGB(0xa9a9a9);
    shareLabel.frame=CGRectMake(0, 17, 30, 28);
    shareLabel.font=[UIFont systemFontOfSize:14];
    [shareBtn addSubview:shareLabel];
    
    UIButton *delegationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    delegationBtn.frame=CGRectMake(Width-70, 60, 65, 28);
    [delegationBtn addTarget:self action:@selector(delegationButton:) forControlEvents:UIControlEventTouchUpInside];
    [delegationBtn setTitle:@"我要组团" forState:UIControlStateNormal];
    [delegationBtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
    delegationBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [introduceView addSubview:delegationBtn];
    
    UILabel *anticipateLabel=[UILabel new];
    anticipateLabel.frame=CGRectMake(Width-114, 109, 100, 28);
    anticipateLabel.text=@"预计24小时内送达";
    anticipateLabel.font=[UIFont systemFontOfSize:12];
    anticipateLabel.textColor=UIColorFromRGB(0xa9a9a9);
    [introduceView addSubview:anticipateLabel];
    
#pragma mark 营业————————
    
    UIView *businessView=[UIView new];
    businessView.frame=CGRectMake(0, 153, Width, 123);
    businessView.backgroundColor=[UIColor whiteColor];
    [view addSubview:businessView];
    
    UIImageView *timeImg=[UIImageView new];
    timeImg.frame=CGRectMake(15, 18, 18, 18);
    timeImg.image=[UIImage imageNamed:@"icon_time"];
    [businessView addSubview:timeImg];
    
    UILabel *businessLabel=[UILabel new];
    businessLabel.frame=CGRectMake(39, 15, 70, 18);
    businessLabel.text=@"营业时间：";
    businessLabel.textColor=UIColorFromRGB(0x222222);
    businessLabel.font=[UIFont systemFontOfSize:14];
    [businessView addSubview:businessLabel];
    
    UILabel *timeLabel=[UILabel new];
    timeLabel.frame=CGRectMake(39, 35,Width/2, 18);
    timeLabel.text=@"周一到周五 09:00--22:00";
    timeLabel.textColor=UIColorFromRGB(0x222222);
    timeLabel.font=[UIFont systemFontOfSize:14];
    [businessView addSubview:timeLabel];
    
    
    UIView *vi2 =[[UIView alloc ]initWithFrame:CGRectMake(227, 35, 1, 16)];
    vi2.backgroundColor = UIColorFromRGB(0x222222);
    [businessView addSubview:vi2];
    
    
    UILabel *statuslab =[[UILabel alloc]initWithFrame:CGRectMake(247, 35,Width/3, 18)];
    statuslab.text=@"正在营业";
    statuslab.textColor = UIColorFromRGB(0x222222);
    statuslab.textAlignment = NSTextAlignmentLeft;
    statuslab.font = [UIFont systemFontOfSize:14];
    [businessView addSubview:statuslab];
    
    UILabel *lineLab=[UILabel new];
    lineLab.frame=CGRectMake(15, 68, Width-30, 1);
    lineLab.backgroundColor=UIColorFromRGB(0xe9e9e9);
    [businessView addSubview:lineLab];
    
    UIImageView *GPSImg=[UIImageView new];
    GPSImg.frame=CGRectMake(15, 86, 18, 18);
    GPSImg.image=[UIImage imageNamed:@"icon_site"];
    [businessView addSubview:GPSImg];
    
    UILabel *GPSLabel=[UILabel new];
    GPSLabel.frame=CGRectMake(40, 87,Width-80, 15);
    GPSLabel.text=@"成都市益州大道南段888号益州国际广场";
    GPSLabel.textColor=UIColorFromRGB(0x222222);
    GPSLabel.font=[UIFont systemFontOfSize:13];
    [businessView addSubview:GPSLabel];
    
    UIButton *distanceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    distanceBtn.frame=CGRectMake(Width-50,80, 40, 40);
    [distanceBtn addTarget:self action:@selector(distanceButton:) forControlEvents:UIControlEventTouchUpInside];
    [businessView addSubview:distanceBtn];
    
    UILabel *distanceLab=[UILabel new];
    distanceLab.text=@"2.6KM";
    distanceLab.textColor=UIColorFromRGB(0x31cdaa);
    distanceLab.frame=CGRectMake(Width-52, 80, 37, 24);
    distanceLab.textAlignment = NSTextAlignmentRight;
    distanceLab.font=[UIFont systemFontOfSize:11];
    [businessView addSubview:distanceLab];
    
    UIImageView *distanceImg=[UIImageView new];
    distanceImg.image=[UIImage imageNamed:@"icon_position"];
    distanceImg.frame=CGRectMake(Width-30, 100, 10, 10);
    [businessView addSubview:distanceImg];
    
    
#pragma mark - - 选择颜色 - -
    
    
    UIButton *chooseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.frame=CGRectMake(0, 286, Width, 55);
    [chooseBtn addTarget:self action:@selector(chooseButton:) forControlEvents:UIControlEventTouchUpInside];
    chooseBtn.backgroundColor=[UIColor whiteColor];
    [view addSubview:chooseBtn];
    
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
    judgeView.frame=CGRectMake(0,350+0.4*Height, Width, 220);
    judgeView.backgroundColor=[UIColor whiteColor];
    [ScView addSubview:judgeView];
    
    UILabel *judgeLabel=[UILabel new];
    judgeLabel.text=@"宝贝评价(1025)";
    judgeLabel.frame=CGRectMake(15, 15, 117, 17);
    judgeLabel.textColor=UIColorFromRGB(0x222222);
    judgeLabel.font=[UIFont systemFontOfSize:14];
    [judgeView addSubview:judgeLabel];
    
    UIButton *totalBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    totalBtn.frame=CGRectMake(15, 53,Width*.12, 25);
    totalBtn.backgroundColor=UIColorFromRGB(0xadebdd);
    totalBtn.layer.cornerRadius = 10;
    [totalBtn setTitle:@"全部" forState:UIControlStateNormal];
    [totalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    totalBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [totalBtn addTarget:self action:@selector(totalButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:totalBtn];
    
    UIButton *goodBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    goodBtn.frame=CGRectMake(30+Width*.1, 53,Width*.23, 25);
    goodBtn.backgroundColor=UIColorFromRGB(0xadebdd);
    goodBtn.layer.cornerRadius = 10;
    [goodBtn setTitle:@"好评(999+)" forState:UIControlStateNormal];
    [goodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    goodBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [goodBtn addTarget:self action:@selector(goodButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:goodBtn];
    
    
    UIButton *centreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    centreBtn.frame=CGRectMake(45+Width*.1+Width*.23, 53,Width*.19, 25);
    centreBtn.backgroundColor=UIColorFromRGB(0xadebdd);
    centreBtn.layer.cornerRadius = 10;
    [centreBtn setTitle:@"中评(20)" forState:UIControlStateNormal];
    [centreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    centreBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [centreBtn addTarget:self action:@selector(centreButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:centreBtn];
    
    UIButton *mistakeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    mistakeBtn.frame=CGRectMake(60+Width*.1+Width*.23+Width*.19, 53,Width*.16, 25);
    mistakeBtn.backgroundColor=UIColorFromRGB(0xdbdbdb);
    mistakeBtn.layer.cornerRadius = 12.0f;
    [mistakeBtn setTitle:@"差评(3)" forState:UIControlStateNormal];
    [mistakeBtn setTitleColor:UIColorFromRGB(0x6c6c6c) forState:UIControlStateNormal];
    mistakeBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [mistakeBtn addTarget:self action:@selector(mistakeButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:mistakeBtn];
    
    UIButton *headBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame=CGRectMake(15, 93, 42, 42);
    [headBtn setImage:[UIImage imageNamed:@"banner-1"] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(headBtn:) forControlEvents:UIControlEventTouchUpInside];
    headBtn.layer.cornerRadius=20.5;
    headBtn.layer.masksToBounds=YES;
    [judgeView addSubview:headBtn];

    UILabel *nameLab=[UILabel new];
    nameLab.frame=CGRectMake(66, 95, 46, 15);
    nameLab.text=@"甜蜜儿";
    nameLab.textColor=UIColorFromRGB(0x656565);
    nameLab.font=[UIFont systemFontOfSize:15];
    [judgeView addSubview:nameLab];
   
    for (int i=0; i<4; i++) {
        UIImageView *speckImg=[UIImageView new];
        speckImg.frame=CGRectMake(66+12*i, 115, 13, 13);
        speckImg.image=[UIImage imageNamed:@"icon_star_yellow"];
        [judgeView addSubview:speckImg];
        
        UIImageView *speckImg2=[UIImageView new];
        speckImg2.frame=CGRectMake(114, 115, 13, 13);
        speckImg2.image=[UIImage imageNamed:@"icon_star_gray"];
        [judgeView addSubview:speckImg2];
    }
    
    UILabel *fair_evaluationLabel=[UILabel new];
    fair_evaluationLabel.frame=CGRectMake(66, 135, 250, 15);
    fair_evaluationLabel.text=@"服务态度好，服务态度好！！！";
    fair_evaluationLabel.textColor=UIColorFromRGB(0x222222);
    fair_evaluationLabel.font = [UIFont systemFontOfSize:14];
    fair_evaluationLabel.numberOfLines=0;
    [fair_evaluationLabel sizeToFit];
    [judgeView addSubview:fair_evaluationLabel];
    
    UIButton *inspectBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    inspectBtn.frame=CGRectMake(Width/2-55,175, 110, 28);
    inspectBtn.backgroundColor=[UIColor whiteColor];
    inspectBtn.layer.borderColor = [UIColorFromRGB(0xf5a81f)CGColor];
    inspectBtn.layer.borderWidth=1;
    inspectBtn.layer.cornerRadius = 5.0f;
    [inspectBtn setTitle:@"查看全部评论" forState:UIControlStateNormal];
    [inspectBtn setTitleColor:UIColorFromRGB(0xf5a81f) forState:UIControlStateNormal];
    inspectBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [inspectBtn addTarget:self action:@selector(inspectButton:) forControlEvents:UIControlEventTouchUpInside];
    [judgeView addSubview:inspectBtn];
    
#pragma mark --  上拉查看详情  --
    
    UIButton *pullBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    pullBtn.frame=CGRectMake(0,570,Width, 38);
    [pullBtn addTarget:self action:@selector(pullButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:pullBtn];
    
    UIImageView *pullImg=[UIImageView new];
    pullImg.image=[UIImage imageNamed:@"icon_up_slide"];
    pullImg.frame=CGRectMake(Width/2-70, 14, 18, 18);
    [pullBtn addSubview:pullImg];
    
    UILabel *pullLab=[UILabel new];
    pullLab.text=@"上拉查看图文详情";
    pullLab.textColor=UIColorFromRGB(0xa9a9a9a);
    pullLab.frame=CGRectMake(Width/2-50, 11, 120, 28);
    pullLab.textAlignment = NSTextAlignmentCenter;
    pullLab.font=[UIFont systemFontOfSize:14];
    [pullBtn addSubview:pullLab];
    
#pragma mark ---  客服、店铺   ---
    
    UILabel *lineLab2=[UILabel new];
    lineLab2.frame=CGRectMake(0,Height-49, 127, 2);
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
    customer_serviceLabel.textColor=UIColorFromRGB(0x939393);
    customer_serviceLabel.frame=CGRectMake(18, 26, 25, 24);
    customer_serviceLabel.font=[UIFont systemFontOfSize:12];
    [customer_serviceBtn addSubview:customer_serviceLabel];
    
    UILabel *lineLab3=[UILabel new];
    lineLab3.frame=CGRectMake(62,5,1, 40);
    lineLab3.backgroundColor=UIColorFromRGB(0xd2d2d2);
    [customer_serviceBtn addSubview:lineLab3];
    
    UIButton *ShopBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    ShopBtn.frame=CGRectMake(64,Height-50, 63, 50);
    ShopBtn.backgroundColor=UIColorFromRGB(0xf0f0f0);
    [ShopBtn addTarget:self action:@selector(ShopButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ShopBtn];
    
    UIImageView *ShopImg=[UIImageView new];
    ShopImg.image=[UIImage imageNamed:@"icon_store"];
    ShopImg.frame=CGRectMake(18,5, 26, 21);
    [ShopBtn addSubview:ShopImg];
    UILabel *ShopLabel=[UILabel new];
    ShopLabel.text=@"店铺";
    ShopLabel.textColor=UIColorFromRGB(0x939393);
    ShopLabel.frame=CGRectMake(18, 26, 25, 24);
    ShopLabel.font=[UIFont systemFontOfSize:12];
    [ShopBtn addSubview:ShopLabel];
    
#pragma mark  加入购物车、立即购买   
    
    UIButton *Shopping_cartBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Shopping_cartBtn.frame=CGRectMake(127,Height-50,(Width-127)/2, 50);
    Shopping_cartBtn.backgroundColor=UIColorFromRGB(0xf5a81f);
    [Shopping_cartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [Shopping_cartBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    Shopping_cartBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [Shopping_cartBtn addTarget:self action:@selector(Shopping_cartButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Shopping_cartBtn];
    
    UIButton *Buy_nowBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Buy_nowBtn.frame=CGRectMake((Width-127)/2+127,Height-50,(Width-127)/2, 50);
    Buy_nowBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    [Buy_nowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [Buy_nowBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    Buy_nowBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [Buy_nowBtn addTarget:self action:@selector(Buy_nowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Buy_nowBtn];
    
    

    toolbar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,Height)];
    toolbar.backgroundColor =[UIColor blackColor];
        toolbar.alpha = 0;
    [self.view addSubview:toolbar];
   
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesCilk:)];
    [toolbar addGestureRecognizer:tap];
    
    [self paymentVi];
    [self shareview];
    [self sales_return];
   
}
-(void)page:(UIPageControl *)page1{
    imgScrollView.contentOffset = CGPointMake(Width *page.currentPage, 0);
    number = (int)page.currentPage;
}
-(void)tapgesCilk:(UITapGestureRecognizer *)tapges{
    sharevi.frame = CGRectMake(0, -Height*.32, Width, Height*.32);
    backvi.frame = CGRectMake(0,Height, Width,433);
    paymentVi.frame = CGRectMake(0, Height, Width, 433);
    toolbar.alpha = 0;
}
#pragma mark  ==分享
-(void)shareButton:(UIButton *)btn{
    sharevi.frame = CGRectMake(0, Height *.68, Width, Height*.32);
    toolbar.alpha = .5;
}

-(void)shareview{
    sharevi = [[UIView alloc]initWithFrame:CGRectMake(0,-Height*.32, Width, Height*.32)];
    sharevi . backgroundColor = UIColorFromRGB(0xf2f2f2);
    [self.view addSubview:sharevi];
    
    UIButton *cancelbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    cancelbtn.frame =  CGRectMake(0, sharevi.ViewHeight-50, Width, 50);
    cancelbtn.backgroundColor = UIColorFromRGB(0xffffff);
    [cancelbtn addTarget:self action:@selector(cancelBtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [cancelbtn setTitleColor:UIColorFromRGB(0x303030) forState:UIControlStateNormal];
    [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
    [sharevi addSubview:cancelbtn];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, sharevi.ViewHeight-50, Width, 1)];
    vi.backgroundColor = UIColorFromRGB(0xd2d2d2);
    [sharevi addSubview:vi];
    
    for (int l =0; l<shareimgarr.count; l++) {
        UIButton *sharebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sharebtn.frame = CGRectMake(15+l*(Width-120)/4+l*30, 30, (Width-120)/4, (Width-120)/2.7);
        [sharevi addSubview:sharebtn];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (Width-120)/4, (Width-120)/4)];
        img.image = [UIImage imageNamed:shareimgarr[l]];
        [sharebtn addSubview:img];
        
        
        UILabel *sharelab = [[UILabel alloc]initWithFrame:CGRectMake(0, sharebtn.ViewHeight-14, sharebtn.ViewWidth, 14)];
        sharelab.textAlignment = NSTextAlignmentCenter;
        sharelab.textColor = UIColorFromRGB(0x2e2e2e);
        sharelab.font = [UIFont systemFontOfSize:13];
        sharelab.text = [sharelabarr objectAtIndex:l];
        [sharebtn addSubview:sharelab];
    }
}


-(void)cancelBtnCilk:(UIButton *)cancelBtn{
    
    sharevi.frame = CGRectMake(0, -Height*.68, Width, Height*.32);
    toolbar.alpha = 0;
}

#pragma mark ==退货
-(void)sales_return{
    backvi =[[UIView alloc]initWithFrame:CGRectMake(0,Height, Width, 433)];
    backvi.backgroundColor = UIColorFromRGB(0xffffff);
    
    [self.view addSubview:backvi];
    
    
    UILabel *returntitillab = [[UILabel alloc]initWithFrame:CGRectMake(backvi.ViewWidth/2-50, 20, 100, 20)];
    returntitillab.text = @"退货说明";
    returntitillab.font = [UIFont systemFontOfSize:17];
    returntitillab.textAlignment = NSTextAlignmentCenter;
    returntitillab.textColor = UIColorFromRGB(0x222222);
    [backvi addSubview:returntitillab];
    
    
    UILabel *returnlab = [[UILabel alloc]initWithFrame:CGRectMake(15, 50, Width-30, 20)];
    returnlab.text = @"       中国文学分为古典文学、现代文学与当代文学。古典文学以唐宋诗词及四大名著为代表，现代文学以鲁迅小说为代表，当代文学则以具有独立思想的中国自由文学为标志。\n\n       [1]自二十世纪末期开始，具有独立思想的中国自由文学的出现，使得中国文学大踏步进入世界先进文化行列，成为引领世界文学的先锋，并使中国当代文学达到历史的顶峰。\n \n        中华民族的文学， 是以汉民族文学为主干部分的各民族文学的共同体。中国文学有数千年悠久历史，以特殊的内容、形式和风格构成了自己的特色，有自己的审美理想，有自己的起支配作用的思想文化传统和理论批判体系。\n\n        它以优秀的历史、多样的形式、众多的中国作家、丰富的作品、独特的风格、鲜明的个性、诱人的魅力而成为世界文学宝库中光彩夺目的瑰宝。\n\n        黄海波疑带儿子与小玩伴玩耍，却犯了这样一个错误郑爽怼老粉丝：颁奖礼宁愿不去也不让你们得逞萌妹11年快女冠军段林希变化大到不敢,刘德华背后的男人变猛男，他是梁家辉。";
    returnlab.font = [UIFont systemFontOfSize:13];
    returnlab.textAlignment = NSTextAlignmentCenter;
    returnlab.textColor = UIColorFromRGB(0x4e4e4e);
    returnlab.numberOfLines = 0;
    [returnlab sizeToFit];
    [backvi addSubview:returnlab];
    
    
    UIButton *fixbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fixbtn.frame = CGRectMake(0,backvi.ViewHeight-50, Width, 50);
    fixbtn.backgroundColor = UIColorFromRGB(0x31cdaa);
    [fixbtn addTarget:self action:@selector(fixbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [fixbtn setTitle:@"确定" forState:UIControlStateNormal];
    [backvi addSubview:fixbtn];
}

-(void)fixbtnCilk:(UIButton *)fixbtn{
    toolbar.alpha = 0;
    backvi.frame =CGRectMake(0,Height, Width, 433);
    
}

-(void)returnbtnCilk:(UIButton *)returnbtn{
        backvi.frame = CGRectMake(0,Height-433, Width,433);
        toolbar.alpha = .5;

}
#pragma mark ==立即购买


-(void)paymentVi{
   
    paymentVi = [[UIView alloc]initWithFrame:CGRectMake(0, Height, Width, 433)];
    paymentVi.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:paymentVi];

    UIButton *ensurebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ensurebtn.frame = CGRectMake(0,433-50, Width, 50);
    ensurebtn.backgroundColor = UIColorFromRGB(0x31cdaa);
    [ensurebtn setTitle:@"确定" forState:UIControlStateNormal];
    [ensurebtn addTarget:self action:@selector(ensurebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [paymentVi addSubview:ensurebtn];
    
    
    paymenttabvi = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width,433-50) style:UITableViewStylePlain];
    paymenttabvi.delegate =self;
    paymenttabvi.dataSource =self;
    paymenttabvi.separatorStyle = NO;
    paymenttabvi.showsVerticalScrollIndicator = NO;
    [paymentVi addSubview:paymenttabvi];
    
}

#pragma mark ==立即购买表的方法

- (NSInteger)numberOfSections{
    return 0;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return classifyarry.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 140;
    }
    if (indexPath.row == 1) {
        return 65;
    }
    if (indexPath.row ==2) {
        if (expresstype == 0) {
            return 88;
        }
        if (expresstype == 1) {
            return 88+46;
        }
        else
        {
            return 70+46*3;
        }
        
    }
    if (indexPath.row == 3) {
        
        return 29*colormuarry.count/6+29+45;
    }
    if(indexPath.row ==4){
        return 29*materialarry.count/3+70;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        UIView * titilvi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 140)];
        titilvi.backgroundColor = UIColorFromRGB(0xffffff);
        [cell addSubview:titilvi];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 100, 100)];
        img.image = [UIImage imageNamed:@"chengzi"];
        [titilvi addSubview:img];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(Width-245, 35,230,50)];
        lab.text = @"优质雷波脐橙优质雷波脐橙优质雷波脐橙优质雷波脐橙优质雷波脐橙";
        lab.numberOfLines = 0;
        lab.textColor = UIColorFromRGB(0x2d2d2d);
        lab.font = [UIFont systemFontOfSize:15];
        [titilvi addSubview:lab];
        
        UILabel *moneylab = [[UILabel alloc]initWithFrame:CGRectMake(Width-245,titilvi.ViewHeight-35,15,15)];
        moneylab.text = @"￥";
        moneylab.numberOfLines = 0;
        moneylab.textColor = UIColorFromRGB(0xff0000);
        moneylab.font = [UIFont systemFontOfSize:12];
        [titilvi addSubview:moneylab];
        
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(Width-234,titilvi.ViewHeight-45,30,30)];
        numlab.numberOfLines = 0;
        numlab.text = @"49";
        numlab.textColor = UIColorFromRGB(0xff0000);
        numlab.font = [UIFont systemFontOfSize:18];
        [titilvi addSubview:numlab];
        
        
        UIView * vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, 139, Width, 1)];
        vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [tableView addSubview:vi2];
            return cell;
         }

     if (indexPath.row == 1) {
         
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            

        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 65/2-10, 100, 20)];
        lab.text = @"订购数量";
        lab.textColor = UIColorFromRGB(0x2d2d2d);
        lab.font = [UIFont systemFontOfSize:15];
        [cell addSubview:lab];
        
        UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,64, Width, 1)];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi];
        
        
        UILabel *numberlab = [[UILabel alloc]initWithFrame:CGRectMake(Width-156, 15, 141, 35)];
        numberlab.layer.cornerRadius = 6;
        numberlab.layer.borderColor = UIColorFromRGB(0xe0e0e0).CGColor;
        numberlab.userInteractionEnabled =YES;
        numberlab.layer.borderWidth = 2;
        [cell addSubview:numberlab];
        
        
        UIButton *Subtractbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        Subtractbtn.frame = CGRectMake(0, 0, 38, 35);
        [Subtractbtn setImage:[UIImage imageNamed:@"Subtract"] forState:UIControlStateNormal];
        [Subtractbtn addTarget:self action:@selector(SubtractbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [numberlab addSubview:Subtractbtn];
        
        
        UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addbtn.frame = CGRectMake(numberlab.ViewWidth-38, 0, 38, 35);
        [addbtn addTarget:self action:@selector(addbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [addbtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [numberlab addSubview:addbtn];
        
        
        UILabel *numlab = [[UILabel alloc]initWithFrame:CGRectMake(37, 0, 141-75, 35)];
        numlab.layer.borderColor =UIColorFromRGB(0xe0e0e0).CGColor;
        NSString *string = [NSString stringWithFormat:@"%d",amount];
        numlab.text = string;
        numlab.tag = 222;
        numlab.textAlignment =NSTextAlignmentCenter;
        numlab.layer.borderWidth = 2;
        [numberlab addSubview:numlab];
        return cell;
          }
    
    
        if (indexPath.row ==2) {
          
           if (expresstype == 0) {
            
            
            UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
                
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab.text = @"配送方式";
            lab.textColor = UIColorFromRGB(0x2d2d2d);
            lab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab];
                
        for (int i = 0 ; i<3; i++) {
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(15+i*(Width-35-84)/3+i*42, 43, (Width-35-84)/3, 29);
            [button setTitle:deliveryarr[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            button.layer.borderWidth = 2;
            button.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            button.layer.cornerRadius = 13;
            button.tag = i+300;
            button.userInteractionEnabled = YES;
            [button addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:button];
            
            if (button.tag == 300) {
                button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
                [button setTitleColor:UIColorFromRGB(0x32cdaa) forState:UIControlStateNormal];
            }
               }
               
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab1.text = @"配送方式";
            lab1.textColor = UIColorFromRGB(0x2d2d2d);
            lab1.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab1];
            
               
            UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,87,Width, 1)];
            vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:vi];
               
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
           }
        if (expresstype ==1) {
      //普通配送
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab.text = @"配送方式";
            lab.textColor = UIColorFromRGB(0x2d2d2d);
            lab.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab];
            
        for (int i = 0 ; i<3; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(15+i*(Width-35-84)/3+i*42, 43, (Width-35-84)/3, 29);
            [button setTitle:deliveryarr[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
                [button setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            button.layer.borderWidth = 2;
            button.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            button.layer.cornerRadius = 13;
            button.tag = i+300;
            button.userInteractionEnabled = YES;
            [button addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:button];
            
            if (button.tag == 301) {
                button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
                [button setTitleColor:UIColorFromRGB(0x32cdaa) forState:UIControlStateNormal];
            }
            }
            
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab1.text = @"配送方式";
            lab1.textColor = UIColorFromRGB(0x2d2d2d);
            lab1.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab1];
            
            
           UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,87,Width, 1)];
            vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:vi];
            
           UIView * vi2 = [[UIView alloc]initWithFrame:CGRectMake(0,45+88, Width, 1)];
           vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
           [cell addSubview:vi2];
           
           UILabel *common = [[UILabel alloc]initWithFrame:CGRectMake(15, 14+88, 100, 20)];
           common.text = @"价格";
           common.textColor = UIColorFromRGB(0x2d2d2d);
           common.font = [UIFont systemFontOfSize:15];
           [cell addSubview:common];
           
           UILabel *commonlab = [[UILabel alloc]initWithFrame:CGRectMake(115, 14+88, 50, 20)];
           commonlab.text = @"12元";
           commonlab.textColor = UIColorFromRGB(0x818181);
           commonlab.font = [UIFont systemFontOfSize:15];
           [cell addSubview:commonlab];
            return cell;
            }
            
    if (expresstype == 2) {
    //快递
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

        for (int i = 0 ; i<3; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(15+i*(Width-35-84)/3+i*42, 43, (Width-35-84)/3, 29);
            [button setTitle:deliveryarr[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            button.layer.borderWidth = 2;
            button.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            button.layer.cornerRadius = 13;
            button.tag = i+300;
            button.userInteractionEnabled = YES;
            [button addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:button];
            
            if (button.tag == 302) {
                button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
                [button setTitleColor:UIColorFromRGB(0x32cdaa) forState:UIControlStateNormal];
            }
                }
                
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
            lab1.text = @"配送方式";
            lab1.textColor = UIColorFromRGB(0x2d2d2d);
            lab1.font = [UIFont systemFontOfSize:15];
            [cell addSubview:lab1];
        
    for (int f = 0; f<expressarry.count; f++) {
            UIView * gayvi = [[UIView alloc]initWithFrame:CGRectMake(15,110+f*46, Width-15, 1)];
               gayvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
            [cell addSubview:gayvi];
           }
        
    for (int p = 0; p<3; p++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:expressarr[p] forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            btn.frame = CGRectMake(15+p*(Width-60)/3+p*15,75, (Width-60)/3, 28);
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.layer.cornerRadius = 12;
            btn.tag = p+888;
            [btn addTarget:self action:@selector(btnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btn];
               
           }
           UILabel *express = [[UILabel alloc]initWithFrame:CGRectMake(15, 125, 100, 20)];
           express.text = @"价格";
           express.textColor = UIColorFromRGB(0x2d2d2d);
           express.font = [UIFont systemFontOfSize:15];
           [cell addSubview:express];
           
           UILabel *expresslab = [[UILabel alloc]initWithFrame:CGRectMake(115, 125, 50, 20)];
           expresslab.text = @"12元";
           expresslab.textColor = UIColorFromRGB(0x818181);
           expresslab.font = [UIFont systemFontOfSize:15];
           [cell addSubview:expresslab];
           
           UILabel *scope = [[UILabel alloc]initWithFrame:CGRectMake(15, 170, 100, 20)];
           scope.text = @"范围";
           scope.textColor = UIColorFromRGB(0x2d2d2d);
           scope.font = [UIFont systemFontOfSize:15];
           [cell addSubview:scope];
           
           UILabel *scopelab = [[UILabel alloc]initWithFrame:CGRectMake(115, 170, 50, 20)];
           scopelab.text = @"20KM";
           scopelab.textColor = UIColorFromRGB(0x818181);
           scopelab.font = [UIFont systemFontOfSize:15];
           [cell addSubview:scopelab];
           
        
                
           
           
           
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
               return cell;
            }
        }
    

        if (indexPath.row == 3) {
        UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
               
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
               
  
           UIView *colorvi = [[UIView alloc]init];
           colorvi.tag = 123;
           colorvi.frame =CGRectMake(0, 0, Width,29*colormuarry.count/6+29+45);
           [cell addSubview:colorvi];
           
           
           UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,colorvi.ViewHeight-1, Width, 1)];
           vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
           [colorvi addSubview:vi];
           
           
           UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
           lab.text = @"颜色";
           lab.textColor = UIColorFromRGB(0x2d2d2d);
           lab.font = [UIFont systemFontOfSize:15];
           [colorvi addSubview:lab];
           
           
           
           for (int h = 0 ; h<colormuarry.count; h++) {
               UIButton * colorbtn = [UIButton buttonWithType:UIButtonTypeCustom];
               colorbtn.frame = CGRectMake(15+h%6*55+h%6*3,43+h/6*29,55,29);
               [colorbtn setTitle:colormuarry[h] forState:UIControlStateNormal];
               colorbtn.titleLabel.font = [UIFont systemFontOfSize:13];
               [colorbtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
               colorbtn.layer.borderWidth = 2;
               colorbtn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
               colorbtn.layer.cornerRadius = 13;
               colorbtn.tag = h+400;
               colorbtn.userInteractionEnabled = YES;
               [colorbtn addTarget:self action:@selector(colorbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
               [colorvi addSubview:colorbtn];
               }
               return cell;
     }
    
    
    
       if(indexPath.row == 4) {
  
          UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
              
          cell.selectionStyle = UITableViewCellSelectionStyleNone;

          
          UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,29*materialarry.count/3+75)];
          view1.tag = 987;
          [cell addSubview:view1];
          
          
          
          UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 100, 20)];
          lab.text = @"材质";
          lab.textColor = UIColorFromRGB(0x2d2d2d);
          lab.font = [UIFont systemFontOfSize:15];
          [view1 addSubview:lab];
          
          
          UIView * vi = [[UIView alloc]initWithFrame:CGRectMake(0,view1.ViewHeight-1, Width,1)];
          vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
          [view1 addSubview:vi];
          
          
          
          for (int k = 0 ; k<materialarry.count; k++) {
              UIButton * materialbtn = [UIButton buttonWithType:UIButtonTypeCustom];
              materialbtn.frame = CGRectMake(15+k%3*(Width-35-84)/3+k%3*42,45+k/3*29,(Width-35-84)/3,29);
              [materialbtn setTitle:materialarry[k] forState:UIControlStateNormal];
              materialbtn.titleLabel.font = [UIFont systemFontOfSize:13];
              [materialbtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
              materialbtn.layer.borderWidth = 2;
              materialbtn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
              materialbtn.layer.cornerRadius = 13;
              materialbtn.tag = k+400;
              materialbtn.userInteractionEnabled = YES;
              [materialbtn addTarget:self action:@selector(materialbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
              
              [view1 addSubview:materialbtn];
          }
       
          return cell;
     }
      else{
          static NSString *str = @"cell";
          UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:str];
          
          
          if (!cell) {
              cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
              
              cell.selectionStyle = UITableViewCellSelectionStyleNone;
              
          }
          return cell;
      }
}
-(void)btnCilk:(UIButton *)btn{

    
    
    for (int k = 0; k<3; k++) {
        if (btn.tag == 888+k) {
            
            btn.backgroundColor = UIColorFromRGB(0x31cdaa);
         
        }
        else{
            UIButton *btn2 = (UIButton *)[paymenttabvi viewWithTag:k+888];
           btn2.backgroundColor = UIColorFromRGB(0xffffff);
        }
    }
}

#pragma mark ==立即购买配送方式

-(void)buttonCilk:(UIButton *)button{
    
    if (button.tag == 300) {

        expresstype = 0;
        
    }

    if (button.tag == 301) {
        expresstype = 1;
           }
    if (button.tag == 302) {
        expresstype=2;
  
    }
    for (int w = 0;w<3; w++) {
        if (button.tag == w+300) {
            
            [button setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            button.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
        }
        else{
            UIButton * btn = (UIButton *)[paymenttabvi viewWithTag:300+w];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            btn.layer.borderColor = UIColorFromRGB(0x222222).CGColor;
        }
    }

      [paymenttabvi reloadData];
}

#pragma mark ==  立即购买颜色选择

-(void)colorbtnCilk:(UIButton *)colorbtn{
    
    UIView *vi = (UIView*)[paymenttabvi viewWithTag:123];
    for (int i = 0; i<colormuarry.count; i++) {
        
        if (colorbtn.tag == 400+i) {
            colorbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            colorbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            colorbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            
            
            [colorbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [colorbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [colorbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
           
           
        }
        else{
        UIButton *btn = (UIButton *)[vi viewWithTag:i+400];
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            
            
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        }
    }
}

#pragma mark ==立即购买材质选择


-(void)materialbtnCilk:(UIButton *)materialbtn{
    UIView *vi = (UIView*)[paymenttabvi viewWithTag:987];
    for (int i = 0; i<materialarry.count; i++) {
        
        if (materialbtn.tag == 400+i) {
            materialbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            materialbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            materialbtn.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
            
            
            [materialbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [materialbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            [materialbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
            
            
        }
        else{
            UIButton *btn = (UIButton *)[vi viewWithTag:i+400];
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            btn.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
            
            
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        }
    }

}

#pragma mark ==立即购买数量选择

-(void)SubtractbtnCilk:(UIButton *)Subtractbtn{
    UILabel *numlab = (UILabel *)[paymenttabvi viewWithTag:222];
    amount  = amount-1;
    if (amount <1) {
        amount=1;
    }
    numlab.text = [NSString stringWithFormat:@"%d",amount];
   
}
-(void)addbtnCilk:(UIButton *)addbtn{
    UILabel *numlab = (UILabel *)[paymenttabvi viewWithTag:222];
        amount  = amount+1;
        numlab.text = [NSString stringWithFormat:@"%d",amount];
}

#pragma mark ==scollview偏移量

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    

   
    CGFloat float1 = scrollView.contentOffset.y;
    if (scrollView == ScView)
    {
        if (float1>390) {
            PhotoVC *photovc = [PhotoVC new];
            [self.navigationController pushViewController:photovc animated:YES];
        }  
    }
    
    NSLog(@"%lf",float1);
     //根据scrollView的偏移量来设置pageControl
    page.currentPage=scrollView.contentOffset.x/Width;
    
    number=scrollView.contentOffset.x/Width;
    
    
}

#pragma mark ==立即购买确定按钮

-(void)ensurebtnCilk:(UIButton *)ensurebtn{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.01];
    toolbar.alpha = 0;
    paymentVi.frame = CGRectMake(0, Height+433, Width, 433);
    [UIView commitAnimations];
}
-(void)returnButton:(UIButton *)Btn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)delegationButton:(UIButton *)button{
    NSLog(@"===我要组团===");
    GroupView *GroupVC=[GroupView new];
//    GroupVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:GroupVC animated:YES];
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
    AppraisaVC* appraisa= [AppraisaVC new];
    [self.navigationController pushViewController:appraisa animated:YES];
}
-(void)pullButton:(UIButton *)btn{
    NSLog(@"上拉刷新");
}
-(void)customer_serviceButton:(UIButton *)button{
    NSLog(@"客服");
    ServiceVC* servi = [ServiceVC new];
    [self.navigationController pushViewController:servi animated:YES]
    ;
}
-(void)ShopButton:(UIButton *)button{
    NSLog(@"店铺");
    Shop *shop = [Shop new];
    shop.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:shop animated:YES];
}
-(void)Shopping_cartButton:(UIButton *)button{
    NSLog(@"加入购物车");
}
-(void)Buy_nowButton:(UIButton *)button{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.01];
    toolbar.alpha = .5;
    paymentVi.frame = CGRectMake(0, Height-433, Width, 433);
    [UIView commitAnimations];
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
