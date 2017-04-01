//
//  Home Page.m
//  xiupin
//
//  Created by mac on 17/2/16.
//  Copyright (c) 2017年 mac. All rights reserved.
//
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

#import "UIView+down.h"
#import "Home Page.h"
#import "PageControl.h"
#import "XiaoxiView.h"
#import "SouSuoOneVC.h"
#import "Shop.h"
#import "Sales_Promotion.h"
#import "Neck_RollVC.h"
#import "goodsView.h"
#import "GroupVC.h"
#import "NearbyVC.h"
#import "RecommendVC.h"
#import "CityVC.h"
#import "Commodity details.h"
@interface Home_Page ()<UIScrollViewDelegate,UITextFieldDelegate>
{
//    UIView *titilview;
    UIView *ssview;
    
    UIView *whietView;
    UIView *whietView2;
    UIView *whietView3;
    UIView *yellowView;
    UIView *tuijianview;
    UIView *xiaoxiview;
    
    
    
    int number;
    int headerNumber;
    
    NSMutableArray *muarray;
    NSMutableArray *toutiaomuarr;
    
    NSArray *btnimgarr;
    NSArray *btntitarr;
    NSArray *tongyongjuanarr;
    
    CGFloat frame;
    
    NSTimer *timer;
    NSTimer *headerTimer;
    
    
    UIScrollView *toutiaoscroll;
    UIScrollView *allscrollview;
    UIScrollView *scrollview;
    UIScrollView *scroll;
    PageControl *page;
    
    UITableView *xiaoxitableview;
    UILabel * dianlab;
    UILabel * titillab;
    
    
    UIButton * diqubtn ;
    UIButton * diqubtn2;
    UIButton *xxbtn;
    UIImageView *ssimg;
    UIButton *returnbtn;
}

@end

@implementation Home_Page

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@""];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
    
    allscrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Width, Height)];
    allscrollview.delegate = self;
    allscrollview.showsVerticalScrollIndicator = NO;
    allscrollview.showsHorizontalScrollIndicator = NO;
    allscrollview.bounces=NO;
    allscrollview.contentSize = CGSizeMake(0, 442+5.85*(278/2));
    allscrollview.delegate = self;

    [self.view addSubview:allscrollview];
    

    
    
    
    timer =[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerun:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    headerTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer2:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:headerTimer forMode:NSRunLoopCommonModes];
    
    [self muarray];
    [self nsarray];
    
    [self titilview];
    [self titilbtnn];
    [self titillable];
    
    [self sceollw];
    
    [self whietView];
    [self whietbtnn];
    [self whietlable];
    
    
    
    [self tuijianview];
    
    
    [self Recognizer];
    
    

    
}



#pragma mark -- 数组



-(void)nsarray{
   
    btnimgarr = @[@"icon_ling",@"icon_qiang",@"icon_cuxiao",@"icon_tuangou",@"icon_fujin"];
    
    btntitarr=@[@"领卷",@"抢购",@"促销",@"团购",@"附近"];
    tongyongjuanarr = @[@"彭老板的店",@"满200可用",@"2017-03-01到期"];
    
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}
-(void)muarray{
   muarray = [[NSMutableArray alloc]initWithObjects:@"banner",@"icon_home_now", nil];
    
   toutiaomuarr =[[NSMutableArray alloc]initWithObjects:@"秀品全新上线秀品全新上线",@"icon_home_now",@"icon_home_now", nil];
}




#pragma mark -- 手势
-(void)Recognizer{

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    

    
}
-(void)tapgestureCilk:(UITapGestureRecognizer *)tapgestureCilk{
    Shop * shop = [[Shop alloc]init];
    shop.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shop animated:YES];
}


#pragma mark -- 控件



-(void)titilbtnn{
    
    diqubtn = [UIButton buttonWithType:UIButtonTypeCustom];
    diqubtn.frame = CGRectMake(15, 35, 40, 15);
    diqubtn.backgroundColor = [UIColor clearColor];
    [diqubtn setTitle:@"成都" forState:UIControlStateNormal];
    [diqubtn addTarget:self action:@selector(diqubtn:) forControlEvents:UIControlEventTouchUpInside];
    [diqubtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    
    
    
    diqubtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    diqubtn2.frame = CGRectMake(55,35, 15,15);
    diqubtn2.backgroundColor = [UIColor clearColor];
    [diqubtn2 setImage:[UIImage imageNamed:@"icon_home_next"] forState:UIControlStateNormal];
    [diqubtn2 addTarget:self action:@selector(diqubtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleview addSubview:diqubtn];
    [self.titleview addSubview:diqubtn2];
    
    
    xxbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    xxbtn.frame = CGRectMake(Width - 15 - 20, 30, 20, 22);
    xxbtn.backgroundColor = [UIColor clearColor];
    [xxbtn setImage:[UIImage imageNamed:@"icon_message"] forState:UIControlStateNormal];
    [xxbtn addTarget:self action:@selector(xxbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleview addSubview:xxbtn];
    
    
    ssimg = [UIImageView new];
    ssimg.frame = CGRectMake(15,7, 15, 15);
    ssimg.image = [UIImage imageNamed:@"icon_serach"];
    [ssview addSubview:ssimg];
    
   
   
    
}
-(void)titilview{
    
    ssview = [[UIView alloc]initWithFrame:CGRectMake(82, 25, Width - 15 - 20 -  20 - 80, 29)];
    ssview.backgroundColor = [UIColor whiteColor];
    ssview.layer.cornerRadius = 29/2;
    [self.titleview addSubview:ssview];
    
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesCilk)];
    [ssview addGestureRecognizer:tapges];
    }

-(void)titillable{
    dianlab = [[UILabel alloc]initWithFrame:CGRectMake(Width-20, 28, 10,10)];
    dianlab.backgroundColor = [UIColor redColor];
    dianlab.layer.cornerRadius = 10/2;
    dianlab.clipsToBounds = YES;
    [self.titleview addSubview:dianlab];
    
    
    UILabel * titilab = [[UILabel alloc]initWithFrame:CGRectMake(37, 7, ssview.frame.size.width-40,14)];
    titilab.text = @"请输入关键字";
    titilab.textColor = UIColorFromRGB(0xc7c8ce);
    [ssview addSubview:titilab];
    
    
    
}
-(void)sceollw{
    scrollview= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, 150)];
    
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.pagingEnabled = YES;
    scrollview.bounces=NO;
    scrollview.contentSize = CGSizeMake(Width*muarray.count, 0);
    scrollview.delegate = self;
    [allscrollview addSubview:scrollview];
    
    
    for (int i=0; i<muarray.count; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*Width, 0, Width, 150)];
        img.userInteractionEnabled = YES;
        img.tag =100+i;
        img.image= [UIImage imageNamed:muarray[i]];
        [scrollview addSubview:img];
        
        UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgestureCilk:)];
        [img addGestureRecognizer:tapgesture];
        
    }

    
    page = [[PageControl alloc]initWithFrame:CGRectMake(Width/2-40, 150-28, 80, 20)];
    page.numberOfPages = muarray.count;
    page.hidesForSinglePage = YES;
    page.currentPage = 0;
    page.currentPageIndicatorTintColor= UIColorFromRGB(0x31cdaa);
    page.pageIndicatorTintColor = UIColorFromRGB(0xd1d1d1);
    [page addTarget:self action:@selector(page:) forControlEvents:UIControlEventTouchUpInside];
    [allscrollview addSubview:page];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 361, Width, 35)];
    vi.backgroundColor = [UIColor whiteColor];
    [allscrollview addSubview:vi];
   
    
    toutiaoscroll = [[UIScrollView alloc]initWithFrame:CGRectMake(91,0, Width-91, 35)];
    toutiaoscroll.showsVerticalScrollIndicator = NO;
    toutiaoscroll.showsHorizontalScrollIndicator = NO;
//    toutiaoscroll.pagingEnabled = YES;
    toutiaoscroll.bounces=NO;
    toutiaoscroll.contentSize = CGSizeMake(Width/2*toutiaomuarr.count, 0);
    toutiaoscroll.delegate = self;
    [vi addSubview:toutiaoscroll];
   
    for (int i=0; i<toutiaomuarr.count; i++) {
 
        UIImageView *toutiao = [[UIImageView alloc]initWithFrame:CGRectMake(16, vi.frame.size.height/2-7.5, 75, 15)];
        toutiao.image = [UIImage imageNamed:@"icon_toutiao"];
        [vi addSubview:toutiao];
        
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(i*(Width-91)+5, 0, Width/2,35)];
        lab.text=@"秀品全新上线秀品全新上线";
        lab.font = [UIFont systemFontOfSize:13];
        lab.textColor =UIColorFromRGB(0x4e4e4e);
        [toutiaoscroll addSubview:lab];
        
    }
    
    

}

-(void)whietView{
    whietView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, Width, 100)];
    whietView.backgroundColor =[UIColor whiteColor];
    [allscrollview addSubview:whietView];
    
    yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 260, Width, 100)];
    yellowView.backgroundColor =[UIColor whiteColor];
    [allscrollview addSubview:yellowView];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 360, Width,1)];
    vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [allscrollview addSubview:vi];
    
    
    
   
    whietView3 = [[UIView alloc]initWithFrame:CGRectMake(0,406, Width, 35)];
    whietView3.backgroundColor = [UIColor whiteColor];
    [allscrollview addSubview:whietView3];
    
    
   
    UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, 451, Width,1)];
    vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [allscrollview addSubview:vi2];
}

-(void)whietbtnn{
    for (int i=0; i<5; i++) {
        
        UIButton * whietbtnn = [UIButton buttonWithType:UIButtonTypeCustom];
        whietbtnn.frame = CGRectMake(i*44+i*(Width-38-44*5)/4+19,18,44, 44);
        whietbtnn.tag = 300+i;
        [whietbtnn addTarget:self action:@selector(whietbtnnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [whietbtnn setImage:[UIImage imageNamed:[btnimgarr objectAtIndex:i]] forState:UIControlStateNormal];
        [whietView addSubview:whietbtnn];
    
    }
    
    for (int i=0; i<5; i++) {
        UIButton * labtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
        labtn.frame = CGRectMake(i*44+i*(Width-38-44*5)/4+19,62,44, 20);
        [labtn setTitle:[btntitarr objectAtIndex:i] forState:UIControlStateNormal];
        [labtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        labtn.tag = 300+i;
        [labtn addTarget:self action:@selector(whietbtnnCilk:) forControlEvents:UIControlEventTouchUpInside];
        labtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [whietView addSubview:labtn];
    }
    
    
    
    UIButton * lingqubtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    lingqubtn.frame =CGRectMake(0, 10, Width, 80);
    [lingqubtn setBackgroundImage:[UIImage imageNamed:@"icon_coupon"] forState:UIControlStateNormal];
    
    [yellowView addSubview:lingqubtn];
    

    
    UIButton *tuijianbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tuijianbtn.frame =CGRectMake(Width-75, 35/2-7.5, 55,15 );
    [tuijianbtn setTitle:@"更多" forState:UIControlStateNormal];
    tuijianbtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [tuijianbtn setTitleColor:UIColorFromRGB(0xb1b1b1) forState:UIControlStateNormal];
    [tuijianbtn addTarget:self action:@selector(tuijianbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [whietView3 addSubview:tuijianbtn];
    
    
    UIButton *tuijianbtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    tuijianbtn2.frame =CGRectMake(Width-35, 35/2-5, 10,10 );
    [tuijianbtn2 addTarget:self action:@selector(tuijianbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [tuijianbtn2 setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
    [whietView3 addSubview:tuijianbtn2];
    
    
    UIButton *tuijianbtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    tuijianbtn3.frame =CGRectMake(Width-30, 35/2-5, 10,10 );
   
     [tuijianbtn3 setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
    [whietView3 addSubview:tuijianbtn3];
}

-(void)whietlable{

    

    
    UILabel * numlab= [[UILabel alloc]initWithFrame:CGRectMake(44,20,70, 65)];
    numlab.text =@"10";
    numlab.textColor =UIColorFromRGB(0xff718d);
    numlab.font = [UIFont systemFontOfSize:58];
    [yellowView addSubview:numlab];
    
    
    for (int i = 0; i<tongyongjuanarr.count; i++) {
        UILabel * riqilab= [[UILabel alloc]initWithFrame:CGRectMake(125,20+i*20,90, 20)];
        riqilab.text =[tongyongjuanarr objectAtIndex:i];
        riqilab.textColor =UIColorFromRGB(0x7a7a6f);
        if (i == 0) {
             riqilab.font = [UIFont systemFontOfSize:17];
        }
        if (i == 1) {
            riqilab.textColor = UIColorFromRGB(0xff718d);
            riqilab.font = [UIFont systemFontOfSize:12];
        }
        else{
             riqilab.font = [UIFont systemFontOfSize:12];
        }
        [yellowView addSubview:riqilab];
    }
    
    UILabel * huanglab= [[UILabel alloc]initWithFrame:CGRectMake(16, 8, 3,20)];
    huanglab.backgroundColor =UIColorFromRGB(0xf5a81f);
    [whietView3 addSubview:huanglab];
    
    
    UILabel * tuijianlab= [[UILabel alloc]initWithFrame:CGRectMake(29, 35/2-7.5, Width/3,15 )];
    tuijianlab.text = @"为您推荐";
    tuijianlab.textColor =  UIColorFromRGB(0xf5a81f);
    [whietView3 addSubview:tuijianlab];
}





-(void)tuijianview{
    for (int i=0; i<5; i++) {
        tuijianview = [[UIView alloc]initWithFrame:CGRectMake(0, 442+i*(278/2), Width,278/2)];
        tuijianview.tag = 10+i;
        tuijianview.backgroundColor = [UIColor whiteColor];
        [allscrollview addSubview:tuijianview];
        
        UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCilk:)];
        [tuijianview addGestureRecognizer:tapges];
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 442+278/2*i, Width,1)];
        vi1.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [allscrollview addSubview:vi1];
      
        
       
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 100/Width*Width, 100)];
        img.image = [UIImage imageNamed:@"chengzi"];
        [tuijianview addSubview:img];
        
        frame =img.frame.origin.x+100/Width*Width;
        
        for (int j = 0; j<2; j++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, j*15+22+j*8, Width/2, 15)];
            [tuijianview addSubview:lab];
            
            
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
        [tuijianview addSubview:lab];
        
        
        
        UILabel *jiagelab = [[UILabel alloc]initWithFrame:CGRectMake(frame+30, 66, 50, 15)];
        jiagelab.text = @"49";
        jiagelab.textColor =UIColorFromRGB(0xff0000);
        jiagelab.font = [UIFont systemFontOfSize:16];
        [tuijianview addSubview:jiagelab];
        
        
        UILabel *mendianjiagelab = [[UILabel alloc]initWithFrame:CGRectMake(frame+80, 66, 80, 15)];
        mendianjiagelab.text = @"门店价：￥99";
        mendianjiagelab.textColor =UIColorFromRGB(0xa7a7a7);
        mendianjiagelab.font = [UIFont systemFontOfSize:12];
        [tuijianview addSubview:mendianjiagelab];
        
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(50, mendianjiagelab.frame.size.height/2, 20,1)];
        vi.backgroundColor = UIColorFromRGB(0xa7a7a7);
        [mendianjiagelab addSubview:vi];

        
        UILabel *youhuilab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 83, Width/1.55, 20)];
        youhuilab.text = @"在满300的基础上再享优惠抵扣卷50元";
        youhuilab.textColor =UIColorFromRGB(0x616161);
        youhuilab.font = [UIFont systemFontOfSize:11];
        youhuilab.textAlignment = NSTextAlignmentLeft;
        [tuijianview addSubview:youhuilab];
        
        
        UILabel * KMlab = [[UILabel alloc]initWithFrame:CGRectMake(frame+15, 105, Width/8, 15)];
        KMlab.font = [UIFont systemFontOfSize:12];
        KMlab.textColor =UIColorFromRGB(0xa7a7a7);
        KMlab.text = @"12KM";
        [tuijianview addSubview:KMlab];
        
        for (int k = 0; k<2; k++) {
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(k*Width/5+frame+Width/6, 105, Width/5, 15)];
            lab.font = [UIFont systemFontOfSize:12];
            lab.textColor =UIColorFromRGB(0xa7a7a7);
            [tuijianview addSubview:lab];
            
            
            if (k == 0) {
                lab.text = @"203个评价";

            }
            else{
                lab.text = @"好评率98%";

            }
        }

    }
    
    
   
}




#pragma mark -- page 定时器



-(void)timerun:(NSTimer *)timer{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    scrollview.contentOffset=CGPointMake(Width*number, 0);
    page.currentPage=number;
    if (number==muarray.count-1)
    {
        number=-1;
    }
    number++;
    [UIView commitAnimations];

}

-(void)page:(UIPageControl *)page1{
    scrollview.contentOffset = CGPointMake(Width *page.currentPage, 0);
    number = (int)page.currentPage;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //根据scrollView的偏移量来设置pageControl
    
    page.currentPage=scrollView.contentOffset.x/Width;
    
    number=scrollView.contentOffset.x/Width;
    [timer fire];
    
}
-(void)timer2:(NSTimer *)timer2{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    toutiaoscroll.contentOffset=CGPointMake((Width-91)*headerNumber, 0);
    if (headerNumber==toutiaomuarr.count-1)
    {
        headerNumber = -1;
    }
    headerNumber++;
    [UIView commitAnimations];
}

#pragma mark --btn点击
-(void)tapCilk:(UITapGestureRecognizer *)tapges{
    Commodity_details *commodity = [Commodity_details new];
    commodity.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:commodity animated:YES];
}
-(void)diqubtn:(UIButton*)diqubtnn{
    CityVC *city =[CityVC new];
    city.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:city animated:YES];
}
-(void)tuijianbtnCilk:(UIButton *)tuijianbtn{
    RecommendVC *recommend = [RecommendVC new];
    recommend.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recommend animated:YES];
}
-(void)xxbtn:(UIButton*)xxbtnn{
    
    XiaoxiView *xiaoxiVC = [[XiaoxiView alloc]init];
    xiaoxiVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:xiaoxiVC animated:YES
    ];
}
-(void)returnbtn:(UIButton*)returnbtnn{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)tapgesCilk{
    sousuoOneVC *ssVC = [[sousuoOneVC alloc]init];
    ssVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ssVC animated:YES];
}

-(void)whietbtnnCilk:(UIButton *)whietbtnn{
    if (whietbtnn.tag ==300) {
        Neck_RollVC *roll = [Neck_RollVC new];
        roll.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:roll animated:YES];
    }
    if (whietbtnn.tag ==301) {
        goodsView *good=[goodsView new];
        good.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:good animated:YES];
    }
    if (whietbtnn.tag ==302) {
        Sales_Promotion *cuxiao = [Sales_Promotion new];
        cuxiao.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:cuxiao animated:YES];
        
        
        
    }
    if (whietbtnn.tag ==303) {
        GroupVC *group = [GroupVC new];
        group.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:group animated:YES];
    }
    if (whietbtnn.tag ==304) {
        NearbyVC *nea = [NearbyVC new];
        nea.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:nea animated:YES];
    }
    
}
#pragma mark --textField-Return
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
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
