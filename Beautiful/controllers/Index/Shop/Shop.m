//
//  shop.m
//  xiupin
//
//  Created by mac on 17/2/23.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "Shop.h"
#import "ServiceVC.h"

@interface Shop ()<UIScrollViewDelegate>
{
    UIScrollView *allscrollview;
    UIScrollView *scrollview;
    
    CGFloat frame;
    
    
    NSMutableArray *muarray;
    NSMutableArray *daohangmuarry;
    
    UIAlertAction *alert1;
    
    int number;
    
    UIPageControl *page;
    
    NSTimer *timer;
    
    NSArray *daohangArry;
    NSMutableArray *tuijianViNumber;
    
    UIView *phoneView;
    UIView *tuijianview;
    CGFloat tuijianframe;
    
    
    
}

@end

@implementation Shop

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"彭老板开的店"]; 
    [self addBackButton];
    
    [self array];
    
    
    allscrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Width, Height)];
    allscrollview.delegate = self;
    allscrollview.showsVerticalScrollIndicator = NO;
    allscrollview.showsHorizontalScrollIndicator = NO;
    allscrollview.bounces=NO;
    allscrollview.contentSize = CGSizeMake(0, (tuijianViNumber.count+.5) *139+320);
    allscrollview.delegate = self;
    
    [self.view addSubview:allscrollview];
    
    
    
    
    UIView *tailview = [[UIView alloc]initWithFrame:CGRectMake(0, (tuijianViNumber.count+.4) *139+320, Width, allscrollview.frame.size.height-((tuijianViNumber.count+.4) *139+320))];
    tailview.backgroundColor = UIColorFromRGB(0xffffff);
    [allscrollview addSubview:tailview];
    ;
    
    
    
    
    timer =[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerun:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    
    
    
    
    [self scrollw];
    [self phoneView];
    [self tuijianview];
    
}
-(void)array{
    muarray = [[NSMutableArray alloc]initWithObjects:@"banner",@"icon_home_now", nil];
    daohangArry=@[@"开始导航",@"在线客服"];
    
    tuijianViNumber = [[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
    
     
    daohangmuarry = [[NSMutableArray alloc]init];
}
-(void)phoneView{
    phoneView= [[UIView alloc ]initWithFrame:CGRectMake(0, 150, Width, 150)];
    phoneView.backgroundColor = UIColorFromRGB(0xffffff);
    [allscrollview addSubview:phoneView];
    
    
    UIView *vi =[[UIView alloc ]initWithFrame:CGRectMake(Width-99, 9, 1, 62)];
    vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [phoneView addSubview:vi];
    
    
    UIView *vi2 =[[UIView alloc ]initWithFrame:CGRectMake(15, 83, Width-30, 1)];
    vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [phoneView addSubview:vi2];
    
    
    UIView *vi3 =[[UIView alloc ]initWithFrame:CGRectMake(227, 116, 1, 16)];
    vi3.backgroundColor = UIColorFromRGB(0x222222);
    [phoneView addSubview:vi3];
    
    
    
    UIView *vi4 =[[UIView alloc ]initWithFrame:CGRectMake(15, 149,Width-30, 1)];
    vi4.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [phoneView addSubview:vi4];
    
    
    
    for (int i = 0 ; i<2; i++) {
        UIButton *buttn= [UIButton buttonWithType:UIButtonTypeCustom];
        buttn.frame = CGRectMake(15+i*80+i*25, 38, 80, 31);
        buttn.tag = i+200;
        [buttn setTitle:[daohangArry objectAtIndex:i] forState:UIControlStateNormal];
        [buttn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        //  被选中状态颜色
        [buttn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
        buttn.layer.borderColor =UIColorFromRGB(0x31cdaa).CGColor;
        buttn.layer.borderWidth = 2;
        buttn.layer.cornerRadius = 6;
        buttn.clipsToBounds = YES;
        
        [buttn addTarget:self action:@selector(buttonCilk:) forControlEvents:UIControlEventTouchUpInside];
        [phoneView addSubview:buttn];
    }
   
    UILabel *iplab = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, Width-85, 15)];
    iplab.text=@"店铺地址：成都市春熙路234-1号";
    iplab.textAlignment=NSTextAlignmentLeft;
    iplab.textColor = UIColorFromRGB(0x7777777);
    iplab.font = [UIFont systemFontOfSize:14];
    [phoneView addSubview:iplab];
    
    
    
    UIButton *buttn= [UIButton buttonWithType:UIButtonTypeCustom];
    buttn.frame = CGRectMake(Width-100+35, 12, 30, 30);
    [buttn setImage:[UIImage imageNamed:@"icon_call"] forState:UIControlStateNormal];
    [buttn addTarget:self action:@selector(buttnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [phoneView addSubview:buttn];
    
    
    
    
    UILabel *phonelab = [[UILabel alloc]initWithFrame:CGRectMake(Width-100, 47,100, 15)];
    phonelab.text=@"028-4568289";
    phonelab.textColor = UIColorFromRGB(0x7777777);
    phonelab.textAlignment = NSTextAlignmentCenter;
    phonelab.font = [UIFont systemFontOfSize:12];
    [phoneView addSubview:phonelab];
 
    
    
    
    UIImageView *timeimg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 99, 18, 18)];
    timeimg.image = [UIImage imageNamed:@"icon_time"];
    [phoneView addSubview:timeimg];
    
    
    UILabel *timelab =[[UILabel alloc]initWithFrame:CGRectMake(39, 99,63, 18)];
    timelab.text=@"营业时间:";
    timelab.textColor = UIColorFromRGB(0x222222);
    timelab.textAlignment = NSTextAlignmentLeft;
    timelab.font = [UIFont systemFontOfSize:14];
    [phoneView addSubview:timelab];
    
    
    UILabel *timelable =[[UILabel alloc]initWithFrame:CGRectMake(39, 116,Width/2, 18)];
    timelable.text=@"周一到周五 09:00--22:00";
    timelable.textColor = UIColorFromRGB(0x222222);
    timelable.textAlignment = NSTextAlignmentLeft;
    timelable.font = [UIFont systemFontOfSize:14];
    [phoneView addSubview:timelable];
    
    
    UILabel *statuslab =[[UILabel alloc]initWithFrame:CGRectMake(247, 116,Width/3, 18)];
    statuslab.text=@"正在营业";
    statuslab.textColor = UIColorFromRGB(0x222222);
    statuslab.textAlignment = NSTextAlignmentLeft;
    statuslab.font = [UIFont systemFontOfSize:14];
    [phoneView addSubview:statuslab];
    
    
}

-(void)scrollw{
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
    
    
    page = [[UIPageControl alloc]initWithFrame:CGRectMake(Width/2-40, 150-28, 80, 20)];
    page.numberOfPages = muarray.count;
    page.hidesForSinglePage = YES;
    page.currentPage = 0;
    page.currentPageIndicatorTintColor= UIColorFromRGB(0x31cdaa);
    page.pageIndicatorTintColor = UIColorFromRGB(0xd1d1d1);
    [page addTarget:self action:@selector(page:) forControlEvents:UIControlEventTouchUpInside];
    [allscrollview addSubview:page];
    
    
    
    
}
-(void)tuijianview{
    for (int i=0; i<tuijianViNumber.count; i++) {
        tuijianview = [[UIView alloc]initWithFrame:CGRectMake(0, 310+i*(278/2), Width,278/2)];
        tuijianview.tag = 10+i;
        tuijianview.backgroundColor =UIColorFromRGB(0xffffff);
        [allscrollview addSubview:tuijianview];
        
        
        tuijianframe = tuijianview.frame.size.height;
       
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 310+278/2*(i+1), Width,1)];
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


#pragma  mark --tapgestureCilk

-(void)tapgestureCilk:(UITapGestureRecognizer*)tapgestureCilk{
    
}


#pragma  mark --buttonCilk


-(void)buttnCilk:(UIButton *)buttn{


    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"028-4568289" preferredStyle:UIAlertControllerStyleAlert];
    
    //修改按钮的颜色
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        NSLog(@"呼叫110");
    }];
    
    
    [defaultAction setValue:UIColorFromRGB(0x31cdaa) forKey:@"_titleTextColor"];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        
        NSLog(@"挂断");

            }];
    
    [cancelAction setValue:UIColorFromRGB(0xaaaaaa) forKey:@"_titleTextColor"];
    
    [alertController addAction:defaultAction];
    [alertController addAction:cancelAction];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
    


}

-(void)buttonCilk:(UIButton *)buttonCilk{
    UIButton*btn = (UIButton *)[phoneView viewWithTag:200];
    UIButton*btn2 = (UIButton *)[phoneView viewWithTag:201];
    if (buttonCilk.tag ==200
        ) {
         btn.backgroundColor = UIColorFromRGB(0x31cdaa);
         btn2.backgroundColor = UIColorFromRGB(0xffffff);
        
         NSLog(@"111");
        
        [btn2 setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        
        [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    }
    else
    {
    
       
        btn2.backgroundColor = UIColorFromRGB(0x31cdaa);
        btn.backgroundColor = UIColorFromRGB(0xffffff);
        
        
        
        [btn2 setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        
        [btn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        
        
        ServiceVC *kefuvc = [[ServiceVC alloc]init];
        [self.navigationController pushViewController:kefuvc animated:YES];
           }
}


#pragma  mark -- 定时器
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
