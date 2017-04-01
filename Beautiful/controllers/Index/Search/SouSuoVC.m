//
//  SouSuoVC.m
//  xiupin
//
//  Created by mac on 17/2/21.
//  Copyright (c) 2017年 mac. All rights reserved.
//
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

#import "SouSuoVC.h"

@interface SouSuoVC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIView *ssview;
    UIView *threeview;
    
    CGFloat frame;
    NSArray *arry;
  
    
    NSArray *jiagearry;
    NSArray *juliarry;
    
    
    NSArray *resettingarry;
    
    NSMutableArray *selectedArray;
    
    NSMutableArray *tableviCellmuarray;
    NSMutableArray *screentableviewCellmuarray;
    NSMutableArray *allscreenmuarry;
    
    NSMutableArray *pinpaimuarray;
    NSMutableArray *mumorescreenarry;
    
    NSMutableArray *brandalparry;
    NSMutableArray *fuwuarray;
    NSMutableArray *alpmuarry;
    
    
    int number;
    int num;
    int count;
    int aaa;
    
    UIButton *morebtntu;
    
    UIImageView *imgvi;
    
    
    UIView *shaixuanview;
    UIView*screenview;
    UIView *boorview;
    UIView *brandview;
    UIView *alpview;
    UIView *brandalpview;
    UIView *coloralpview;
    UIView *phongalpview;
    UIView *shipmentsview;
    
    
    
    
    UILabel *screenlab;
    
    
    UITableView *tablevi;
    UITableView *screentableview;
    
    int priceStaus;
    int selectedButton;
    
    
    UIScrollView * scroll;
    
    UIView *screentitiview;
    
    
}
@end

@implementation SouSuoVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNavigationBar:@""];
    [self addBackButton];
    [self Recognizer];
    
    tablevi = [[UITableView alloc]initWithFrame:CGRectMake(0, 115, Width, Height-115) style:UITableViewStylePlain];
    tablevi.dataSource =self;
    tablevi.delegate = self;
   
    tablevi.separatorStyle = NO;
    tablevi.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tablevi];
    
    
    [self array];
    [self titil];
    [self screenview];
    
    [self scrollview];
    
    [self scrollviewVi];
//    [self tableview];

    [self slphaview];
   
}



#pragma mark --数组



-(void)array{
    arry = @[@"",@"销量",@"团购",@"促销"];
    mumorescreenarry=[[NSMutableArray alloc]initWithObjects:@"免费配送",@"有现货",@"正在营业",nil];
    brandalparry=[[NSMutableArray alloc]initWithObjects:@"123",@"321",@"231",@"213",@"3443",@"543",@"43634",@"54363", nil ];
    alpmuarry=[[NSMutableArray alloc]initWithObjects:@"123",@"321",@"231",@"213",@"3443",@"543",@"43634",@"54363",@"5345346",@"1231234",@"12314",@"12312",@"423123",@"231214",@"3123",@"21421", nil ];
    
    
    allscreenmuarry=[[NSMutableArray alloc]initWithObjects:pinpaimuarray,nil];
    fuwuarray =[[NSMutableArray alloc]initWithObjects:@"更多服务",@"价格区间(元)",@"远近距离(KM)",nil];
    pinpaimuarray=[[NSMutableArray alloc]initWithObjects:@"品牌",@"颜色",@"材质",@"发货地",nil];
    
    
    jiagearry=@[@"最低价",@"最高价"];
    juliarry=@[@"最近距离",@"最远距离"];
    resettingarry =@[@"重置",@"确定"];
    selectedArray = [NSMutableArray new];
    
    
    tableviCellmuarray =[[NSMutableArray alloc]initWithObjects:@"",@"销量",@"团购",@"促销",nil];
    screentableviewCellmuarray=[[NSMutableArray alloc]initWithObjects:@"销量",@"团购",@"促销",nil];
}



#pragma mark --控件
-(void)scrollview{
    scroll =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width-75, Height-50)];
    scroll.delegate=self;
    scroll.contentSize = CGSizeMake(0, fuwuarray.count*94+(pinpaimuarray.count)*94+20+10*(allscreenmuarry.count+1));
    scroll.showsVerticalScrollIndicator = NO;
    scroll.backgroundColor =UIColorFromRGB(0xf6f6f6);
    scroll.showsHorizontalScrollIndicator = NO;
    [screenview addSubview:scroll];
    
    
    
}
-(void)slphaview{
    
    //更多服务隐藏起来的vi
    alpview =[UIView new];
    alpview.frame = CGRectMake(0, 114, Width - 75,alpmuarry.count/3*30+alpmuarry.count/3*15);
    alpview.backgroundColor = UIColorFromRGB(0xffffff);
    alpview.alpha =0;
    [screentitiview addSubview:alpview];
    
    UIView *alpvi=[[UIView alloc]initWithFrame:CGRectMake(0,alpmuarry.count/3*30+alpmuarry.count/3*15-1,Width-75, 1)];
    alpvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [alpview addSubview:alpvi];
    
    
    
    for (int ok = 0; ok<3; ok++) {
        for (int ko = 0; ko<alpmuarry.count/3; ko++) {
            number++;
            UIButton *alpbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [alpbtn setTitle:[alpmuarry objectAtIndex:ko] forState:UIControlStateNormal];
            alpbtn.frame = CGRectMake(16+ok*((Width-75)-16*4)/3+16*ok, ko*30+ko*15-5, ((Width-75)-16*4)/3, 30);
            [alpbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
            [alpbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
            alpbtn.layer.borderWidth = 2;
            alpbtn.layer.cornerRadius = 5;
            alpbtn.tag = number%alpmuarry.count+50;
            
            alpbtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
            alpbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [alpbtn addTarget:self action:@selector(morebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [alpview addSubview:alpbtn];
            
        }
    }

    
    
    //品牌隐藏起来的vi
    brandalpview =[UIView new];
    brandalpview.frame = CGRectMake(0, 94, Width - 75,brandalparry.count/3*30+brandalparry.count/3*15);
    brandalpview.backgroundColor = UIColorFromRGB(0xffffff);
    brandalpview.alpha =0;
    [brandview addSubview:brandalpview];
    
    
    UIView *brandalpvi=[[UIView alloc]initWithFrame:CGRectMake(0,brandalparry.count/3*30+brandalparry.count/3*15-1,Width-75, 1)];
    brandalpvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [brandalpview addSubview:brandalpvi];
    
    
    for (int o = 0; o<3; o++) {
        for (int k = 0; k<brandalparry.count/3; k++) {
            number++;
            UIButton *brandalpbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [brandalpbtn setTitle:[brandalparry objectAtIndex:k] forState:UIControlStateNormal];
            brandalpbtn.frame = CGRectMake(16+o*((Width-75)-16*4)/3+16*o, k*30+k*15-5, ((Width-75)-16*4)/3, 30);
            [brandalpbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
            [brandalpbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
            brandalpbtn.layer.borderWidth = 2;
            brandalpbtn.layer.cornerRadius = 5;
            brandalpbtn.tag = number%brandalparry.count+50;
            
            brandalpbtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
            brandalpbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [brandalpbtn addTarget:self action:@selector(morebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [brandalpview addSubview:brandalpbtn];
            
        }
    }
    
    
    //颜色隐藏起来的vi
    coloralpview=[UIView new];
    coloralpview.frame = CGRectMake(0, 94*2, Width - 75,brandalparry.count/3*30+brandalparry.count/3*15);
    coloralpview.backgroundColor = UIColorFromRGB(0xffffff);
    coloralpview.alpha =0;
    [brandview addSubview:coloralpview];
    
    
    UIView *coloralpvi=[[UIView alloc]initWithFrame:CGRectMake(0,brandalparry.count/3*30+brandalparry.count/3*15-1,Width-75, 1)];
    coloralpvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [coloralpview addSubview:coloralpvi];
    
    
    for (int o = 0; o<3; o++) {
        for (int k = 0; k<brandalparry.count/3; k++) {
            number++;
            UIButton *coloralpbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [coloralpbtn setTitle:[brandalparry objectAtIndex:k] forState:UIControlStateNormal];
            coloralpbtn.frame = CGRectMake(16+o*((Width-75)-16*4)/3+16*o, k*30+k*15-5, ((Width-75)-16*4)/3, 30);
            [coloralpbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
            [coloralpbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
            coloralpbtn.layer.borderWidth = 2;
            coloralpbtn.layer.cornerRadius = 5;
            coloralpbtn.tag = number%brandalparry.count+50;
            
            coloralpbtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
            coloralpbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [coloralpbtn addTarget:self action:@selector(morebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [coloralpview addSubview:coloralpbtn];
            
        }
    }

    //材质隐藏起来的vi
    phongalpview=[UIView new];
    phongalpview.frame = CGRectMake(0, 94*3, Width - 75,brandalparry.count/3*30+brandalparry.count/3*15);
    phongalpview.backgroundColor = UIColorFromRGB(0xffffff);
    phongalpview.alpha =0;
    [brandview addSubview:phongalpview];

    
    
    UIView *phongalpvi=[[UIView alloc]initWithFrame:CGRectMake(0,brandalparry.count/3*30+brandalparry.count/3*15-1,Width-75, 1)];
    phongalpvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [phongalpview addSubview:phongalpvi];
    
    for (int p = 0; p<3; p++) {
        for (int q = 0; q<brandalparry.count/3; q++) {
            number++;
            UIButton *phongalpbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [phongalpbtn setTitle:[brandalparry objectAtIndex:q] forState:UIControlStateNormal];
            phongalpbtn.frame = CGRectMake(16+p*((Width-75)-16*4)/3+16*p, q*30+q*15, ((Width-75)-16*4)/3, 30);
            [phongalpbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
            [phongalpbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
            phongalpbtn.layer.borderWidth = 2;
            phongalpbtn.layer.cornerRadius = 5;
            phongalpbtn.tag = number%brandalparry.count+50;
            
            phongalpbtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
            phongalpbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [phongalpbtn addTarget:self action:@selector(morebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [phongalpview addSubview:phongalpbtn];
            
        }
    }
    
    //发货地隐藏起来的vi
    shipmentsview=[UIView new];
    shipmentsview.frame = CGRectMake(0, 94*3, Width - 75,brandalparry.count/3*30+brandalparry.count/3*15);
    shipmentsview.backgroundColor = UIColorFromRGB(0xffffff);
    shipmentsview.alpha =0;
    [brandview addSubview:shipmentsview];
    
    
    
    UIView * shipmentsvi=[[UIView alloc]initWithFrame:CGRectMake(0,brandalparry.count/3*30+brandalparry.count/3*15-1,Width-75, 1)];
    shipmentsvi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [shipmentsview addSubview:shipmentsvi];
    
    for (int p = 0; p<3; p++) {
        for (int q = 0; q<brandalparry.count/3; q++) {
            number++;
            UIButton *shipmentsbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [shipmentsbtn setTitle:[brandalparry objectAtIndex:q] forState:UIControlStateNormal];
            shipmentsbtn.frame = CGRectMake(16+p*((Width-75)-16*4)/3+16*p, q*30+q*15, ((Width-75)-16*4)/3, 30);
            [shipmentsbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
            [shipmentsbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
            shipmentsbtn.layer.borderWidth = 2;
            shipmentsbtn.layer.cornerRadius = 5;
            shipmentsbtn.tag = number%brandalparry.count+50;
            
            shipmentsbtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
            shipmentsbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [shipmentsbtn addTarget:self action:@selector(morebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [shipmentsview addSubview:shipmentsbtn];
            
        }
    }

}

-(void)scrollviewVi{
    
    screentitiview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Width-75, 93 * 3)];
    screentitiview.backgroundColor =UIColorFromRGB(0xffffff);
    [scroll addSubview:screentitiview];
    
 
    for (int i = 0; i<3; i++) {
     
        threeview = [UIView new];
        threeview.frame = CGRectMake(0, 20 + i * 94, Width - 75, 93);
        threeview.backgroundColor = UIColorFromRGB(0xffffff);
        threeview.tag = i + 1;
        [screentitiview addSubview:threeview];
        
        UILabel *morelab = [[UILabel alloc]init];
        morelab.text = [fuwuarray objectAtIndex:i];
        morelab.frame = CGRectMake(15, 10, 100, 31);
        morelab.textColor =UIColorFromRGB(0x959595);
        morelab.font = [UIFont systemFontOfSize:14];
        [threeview addSubview:morelab];
        
        UIView *vi = [[UIView alloc]init];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        vi.frame = CGRectMake(0, 93, Width-75, 1);
        vi.tag = i+30;
        [threeview addSubview:vi];
        
        
    if (i == 0) {
        

        morebtntu = [UIButton buttonWithType:UIButtonTypeCustom];
        morebtntu.frame=CGRectMake(Width-103,22, 13, 8);
        [morebtntu setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
        [morebtntu addTarget:self action:@selector(morebtnimgCilk:) forControlEvents:UIControlEventTouchUpInside];
        [threeview addSubview:morebtntu];
            
       
        
    for (int k=0; k<mumorescreenarry.count; k++) {
            for (int l = 0; l<mumorescreenarry.count/3; l++) {
                    
        UIButton *morebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [morebtn setTitle:[mumorescreenarry objectAtIndex:k] forState:UIControlStateNormal];
        morebtn.frame = CGRectMake(16+k*((Width-75)-16*4)/3+16*k, 42+10*l+l*31, ((Width-75)-16*4)/3, 31);
        [morebtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
        [morebtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
        morebtn.layer.borderWidth = 2;
        morebtn.layer.cornerRadius = 5;
        morebtn.tag = k+50;
        morebtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
        morebtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [morebtn addTarget:self action:@selector(morebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [threeview addSubview:morebtn];
        [threeview addSubview:vi];
               }
            }
         }

   
        
        
    else {

  
    for (int i=0; i<2; i++) {
        
       
        UITextField *kmfield = [[UITextField alloc]init];
        
        kmfield.frame = CGRectMake(16+i*((Width-75)-16*2-29)/2+29*i, 48, ((Width-75)-16*2-29)/2, 31);
        kmfield.layer.borderWidth = 2;
        kmfield.layer.cornerRadius = 5;
        kmfield.tag = i+100;
        kmfield.delegate=self;
        kmfield.textAlignment = NSTextAlignmentCenter;
        kmfield.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
        kmfield.placeholder =[juliarry objectAtIndex:i];
        kmfield.font = [UIFont systemFontOfSize:14];
        [threeview addSubview:kmfield];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake((Width-75)/2-7, 62, 14, 2)];
        vi.backgroundColor = UIColorFromRGB(0xc0c0c0);
        [threeview addSubview:vi];
    
        
    if (screentitiview.tag== 2) {
        
        kmfield.placeholder = [jiagearry objectAtIndex:i];
              }

           }

        }
        
     }
    
    
    
    brandview=[[UIView alloc]initWithFrame:CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*4)];
    brandview.clipsToBounds = YES;
    [scroll addSubview:brandview];
    
    for (int op = 0; op<4; op++) {
        
        //品牌 价格 材质 发货地 view
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,op*94, Width-75, 94)];
        view.backgroundColor =UIColorFromRGB(0xffffff);
        view.tag =op+10;
        
        [brandview addSubview:view];
        
        
        
        UIView *vi = [[UIView alloc]init];
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        vi.frame = CGRectMake(0, 93, Width, 1);
        vi.tag = op+150;
        [view addSubview:vi];
        
        
        UIButton *brandbtntu = [UIButton buttonWithType:UIButtonTypeCustom];
        brandbtntu.frame=CGRectMake(Width-100,22, 20, 10);
        [brandbtntu setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
        [brandbtntu addTarget:self action:@selector(brandbtntuCilk:) forControlEvents:UIControlEventTouchUpInside];
        brandbtntu.tag = op+600;
        [view addSubview:brandbtntu];
        
        
        
        
        
        
        UILabel *brandlab = [[UILabel alloc]init];
        brandlab.text = [pinpaimuarray objectAtIndex:op];
        brandlab.frame = CGRectMake(15, 10, 100, 31);
        brandlab.textColor =UIColorFromRGB(0x959595);
        brandlab.font = [UIFont systemFontOfSize:14];
        [view addSubview:brandlab];
        
        
        
        
        
        for (int k=0; k<mumorescreenarry.count; k++) {
            for (int l = 0; l<mumorescreenarry.count/3; l++) {
                
                UIButton *brandbtn = [UIButton buttonWithType:UIButtonTypeCustom];
                [brandbtn setTitle:[mumorescreenarry objectAtIndex:k] forState:UIControlStateNormal];
                brandbtn.frame = CGRectMake(16+k*((Width-75)-16*4)/3+16*k, 42+10*l+l*31, ((Width-75)-16*4)/3, 31);
                [brandbtn setTitleColor:UIColorFromRGB(0xa7a7a7) forState:UIControlStateNormal];
                //  被选中状态颜色
                [brandbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateSelected];
                brandbtn.layer.borderWidth = 2;
                brandbtn.layer.cornerRadius = 5;
                brandbtn.tag = k+300;
                brandbtn.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                brandbtn.titleLabel.font = [UIFont systemFontOfSize:14];
                [brandbtn addTarget:self action:@selector(brandbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:brandbtn];
                
                
         if (op == mumorescreenarry.count) {
            
             
                brandbtn.frame = CGRectMake(16+(k-1)*((Width-75)-16*4)/3+16*(k-1), 42+10*l, ((Width-75)-16*4)/3, 31);
             
             
                   }
                }
             }
          }
      }







-(void)titil{
    ssview = [[UIView alloc]initWithFrame:CGRectMake(82, 25, Width - 15 - 20 -  20 - 80, 29)];
    ssview.backgroundColor = [UIColor whiteColor];
    ssview.layer.cornerRadius = 29/2;
    [self.titleview addSubview:ssview];
    
    
    UITextField * titifield = [[UITextField alloc]initWithFrame:CGRectMake(37, 7, ssview.frame.size.width-40,14)];
    titifield.placeholder = @"请输入关键字";
    titifield.delegate = self;
    titifield.clearButtonMode = UITextFieldViewModeAlways;
    [ssview addSubview:titifield];
    
    UIButton *ssbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ssbtn.frame = CGRectMake(15,7, 15, 15);
    [ssbtn setImage:[UIImage imageNamed:@"icon_serach"] forState:UIControlStateNormal];
//    [ssbtn addTarget:self action:@selector(ssbtn:) forControlEvents:UIControlEventTouchUpInside];
    [ssview addSubview:ssbtn];
    
    
    UIButton *coordinatebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    coordinatebtn.frame = CGRectMake(Width - 15 - 20, 30, 20, 22);
    coordinatebtn.backgroundColor = [UIColor clearColor];
    [coordinatebtn setImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
//    [coordinatebtn addTarget:self action:@selector(coordinatebtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleview addSubview:coordinatebtn];
}



-(void)screenview{
    shaixuanview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, (Width-48)/4*3+48, 50)];
    shaixuanview.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:shaixuanview];
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake((Width-48)/4*3+48, 64, 1, 50)];
    vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [self.view addSubview:vi];
    
    
    UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, 114, Width, 1)];
    vi2.backgroundColor = UIColorFromRGB(0xe9e9e9);
    [self.view addSubview:vi2];
    
    UIView *screenvi = [[UIView alloc]initWithFrame:CGRectMake((Width-48)/4*3+48+1, 64,(Width-48)/4, 50)];
    screenvi.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:screenvi];
    
    
    
    for (int i =0; i<4; i++) {
        UIButton *screenbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        screenbtn.frame = CGRectMake(24+i*(Width-48)/4*3/4+i*24/4, 11,(Width-48)/4*3/4, 28);
        [screenbtn setTitle:[arry objectAtIndex:i] forState:UIControlStateNormal];
        [screenbtn setTitleColor:UIColorFromRGB(0x818181) forState:UIControlStateNormal];
        screenbtn.layer.cornerRadius = 14;
        screenbtn.clipsToBounds = YES;
        screenbtn.layer.borderWidth =2;
        screenbtn.layer.borderColor = [UIColor clearColor].CGColor;
        screenbtn.tag =i+10;
        screenbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [screenbtn addTarget:self action:@selector(screenbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [shaixuanview addSubview:screenbtn];
        
        if (i == 0) {
            imgvi = [[UIImageView alloc]initWithFrame:CGRectMake((Width-48)/4*3/4/1.4, screenbtn.frame.size.height/2-6, 10, 12)];
            
            [screenbtn addSubview:imgvi];
            
            screenlab = [[UILabel alloc]initWithFrame:CGRectMake((Width-48)/4*3/4/5, screenbtn.frame.size.height/2-8, 40, 17)];
            screenlab.text=@"价格";
            screenlab.textColor =UIColorFromRGB(0x818181);
            screenlab.font = [UIFont systemFontOfSize:15];
            
            [screenbtn addSubview:screenlab];
        }
    }
    

    
    UIButton *screenbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    screenbtn.frame = CGRectMake(7, 0,screenvi.ViewWidth/2, 50);
    [screenbtn setTitle:@"筛选" forState:UIControlStateNormal];
    [screenbtn setTitleColor:UIColorFromRGB(0x818181) forState:UIControlStateNormal];
    screenbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [screenbtn addTarget:self action:@selector(screenbtn:) forControlEvents:UIControlEventTouchUpInside];
    [screenvi addSubview:screenbtn];
    
    UIButton *screenbtntu = [UIButton buttonWithType:UIButtonTypeCustom];
    screenbtntu.frame = CGRectMake((screenvi.ViewWidth-15)/2+15, 0,(screenvi.ViewWidth-30)/2, 50);
    [screenbtntu setImage:[UIImage imageNamed:@"icon_filter"] forState:UIControlStateNormal];
    [screenbtntu addTarget:self action:@selector(screenbtn:) forControlEvents:UIControlEventTouchUpInside];
    [screenvi addSubview:screenbtntu];
    
    
    screenview = [[UIView alloc]initWithFrame:CGRectMake(Width, 0, Width-75, Height)];
    screenview.backgroundColor = UIColorFromRGB(0xffffff);
    
    [self.view addSubview:screenview];
    
    
    boorview = [[UIView alloc]initWithFrame:CGRectMake(0,0, 75, Height)];
    boorview.alpha = 0;
    boorview.backgroundColor = [UIColor blackColor];
    [self.view addSubview:boorview];
    
    
    
    
    
    
    for (int m=0; m<2; m++) {
        UIButton *resettingbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        resettingbtn.frame = CGRectMake(m*(Width-75)/2, Height-50,(Width-75)/2,50);
        [resettingbtn setTitle:[resettingarry objectAtIndex:m] forState:UIControlStateNormal];
        resettingbtn.tag = m+100;
        [resettingbtn addTarget:self action:@selector(resettingbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
        [screenview addSubview:resettingbtn];
        
        

        
        
        if (m==0) {
            [resettingbtn setTitleColor:UIColorFromRGB(0x494949) forState:UIControlStateNormal];
            resettingbtn.backgroundColor = UIColorFromRGB(0xe4e4e4);
            
        }else
            
        {[resettingbtn setTitleColor:UIColorFromRGB(0xfcfdfd) forState:UIControlStateNormal];
        resettingbtn.backgroundColor = UIColorFromRGB(0x31cdaa);
    }
}
}

#pragma mark --buttonCilk


-(void)screenbtn:(UIButton *)screenbtnCilk{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.1];
    boorview.alpha=.25;
    screenview.frame=CGRectMake(75, 0, Width-75, Height);
    
    [UIView commitAnimations];
    
    

}
-(void)morebtnCilk:(UIButton*)morebtnCilk{

    morebtnCilk.selected = !morebtnCilk.selected;
    if (morebtnCilk.selected)
    {
        morebtnCilk.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
    }
    else
    {

        morebtnCilk.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
    }
}

-(void)morebtnimgCilk:(UIButton*)morebtnCilk{
    UIView *vi = (UIView *)[screenview viewWithTag:30];
    vi.backgroundColor = [UIColor clearColor];
    morebtnCilk.selected = !morebtnCilk.selected;
    
//    alpview
    
    CGFloat orginY = morebtnCilk.selected ? scroll.contentSize.height + alpview.ViewHeight : scroll.contentSize.height - alpview.ViewHeight;
    scroll.contentSize = CGSizeMake(scroll.ViewWidth, orginY);
    
    if (morebtnCilk.selected)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.1];
        
        
        
        [morebtnCilk setImage:[UIImage imageNamed:@"icon_next_up png"] forState:UIControlStateNormal];
        screentitiview.frame=CGRectMake(0, 0, Width-75, 93 * 3+alpview.frame.size.height);
       
        alpview.alpha=1;
        
        float orginQ = brandalpview.alpha ==0 ? 0 : brandalpview.frame.size.height;
        float orginW = coloralpview.alpha == 0 ? orginQ :  coloralpview.ViewHeight + orginQ;
        float oringT = phongalpview.alpha == 0 ?  orginW : orginW+phongalpview.frame.size.height;
        float orginY = shipmentsview.alpha ==0 ? oringT : oringT +shipmentsview.frame.size.height;
         brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*4+orginY);
        
        for (int i=0; i<3; i++) {
            UIView *view = [screentitiview viewWithTag:i+1];
            
            if (view.tag == 2) {
                
                view.frame=CGRectMake(0, 114+alpview.frame.size.height, Width-75, 94);
            }
            if (view.tag == 3) {
                view.frame=CGRectMake(0, 114+alpview.frame.size.height+94, Width-75, 94);
            }
        }
        
        

        [UIView commitAnimations];
    }
    else
    {
        [morebtnCilk setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.1];
        
        vi.backgroundColor = UIColorFromRGB(0xe9e9e9);
        screentitiview.frame=CGRectMake(0, 0, Width-75, 93 * 3);
        
        float orginQ = brandalpview.alpha ==0 ? 0 : brandalpview.frame.size.height;
        float orginW = coloralpview.alpha == 0 ? orginQ :  coloralpview.ViewHeight + orginQ;
        float oringT = phongalpview.alpha == 0 ?  orginW : orginW+phongalpview.frame.size.height;
        float orginY = shipmentsview.alpha ==0 ? oringT : oringT +shipmentsview.frame.size.height;
        brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*4+orginY);
        
        
        
        
        alpview.alpha=0;
        
        for (int i=0; i<3; i++) {
            UIView *view = [screentitiview viewWithTag:i+1];
            
            if (view.tag == 2) {
                
                view.frame=CGRectMake(0, 114, Width-75, 94);
            }
            if (view.tag == 3) {
                view.frame=CGRectMake(0, 114+94, Width-75, 94);
            }
        }
        [UIView commitAnimations];
    }
}
-(void)brandbtntuCilk:(UIButton*)brandbtntu{
  //灰色的线
    UIView *vi1 = (UIView *)[brandview viewWithTag:150];
    UIView *vi2 = (UIView *)[brandview viewWithTag:151];
    UIView *vi3 = (UIView *)[brandview viewWithTag:153];
    brandbtntu.selected = !brandbtntu.selected;
    if (brandbtntu.tag ==600) {
       
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.1];
        
        if (brandbtntu.selected) {
            vi1.backgroundColor = [UIColor clearColor];
        }
        else{
            vi1.backgroundColor = UIColorFromRGB(0xe9e9e9);
        }
        [brandbtntu setImage:[UIImage imageNamed:brandbtntu.selected ? @"icon_next_up png" : @"icon_next_gray"] forState:UIControlStateNormal];
        brandalpview.alpha = brandbtntu.selected ? 1 : 0;
        
        float view_height = brandbtntu.selected ? scroll.contentSize.height + brandalpview.ViewHeight : scroll.contentSize.height - brandalpview.ViewHeight;
        scroll.contentSize = CGSizeMake(scroll.ViewWidth, view_height);
        
        for (int i=0; i<4; i++) {
            UIView *view = [brandview viewWithTag:i+10];
            if (view.tag == 11) {
               
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? 94 : 94 + brandalpview.ViewHeight, Width-75, 94);
                
            }
            if (view.tag == 12) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94+ coloralpview.ViewHeight;
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? orginY + 94 : orginY + brandalpview.ViewHeight + 94, Width-75, 94);
                
                
            }
            if (view.tag == 13) {

                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                float orginX = brandalpview.alpha ==0 ? 94 :94+brandalpview.frame.size.height;
                view.frame=CGRectMake(0, phongalpview.alpha == 0 ? 94 + orginX + orginY : 94 + orginX + orginY + phongalpview.ViewHeight, Width-75, 94);
            }
            
        }
        
     
        
        CGRect colorframe =coloralpview.frame;
        colorframe.origin.y = brandalpview.alpha == 0 ? 94*2: 94*2 + brandalpview.ViewHeight;
        coloralpview.frame = colorframe;
        
        CGRect phongframe = phongalpview.frame;
        float orginX = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginY = coloralpview.alpha == 0 ? 94 + orginX : 94 + coloralpview.ViewHeight + orginX;
        phongframe.origin.y = phongalpview.alpha == 0 ? orginY+94 : orginY + phongalpview.ViewHeight;
        phongalpview.frame = phongframe;
        
        
        CGRect shipmentframe = shipmentsview.frame;
        
        float orginQ = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginW = coloralpview.alpha == 0 ? 94 + orginQ : 94 + coloralpview.ViewHeight + orginQ;
        float oringT = phongalpview.alpha == 0 ? 94 + orginW : 94+orginW+phongalpview.frame.size.height;
        shipmentframe.origin.y = shipmentsview.alpha == 0 ?94 +  oringT : 94+ oringT ;
        shipmentsview.frame = shipmentframe;
        
       
        
        float orgin_height = brandalpview.alpha == 0 ? 0 : brandalpview.ViewHeight;
        float orgin_colorheight = coloralpview.alpha == 0 ?
        orgin_height : orgin_height+coloralpview.ViewHeight;
        float orgin_phohaheight = phongalpview.alpha == 0 ? orgin_colorheight :phongalpview.frame.size.height+orgin_colorheight;
        float orgin_shipmentheight = shipmentsview.alpha == 0 ? orgin_phohaheight : orgin_phohaheight +shipmentsview.frame.size.height;
        brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*5+orgin_shipmentheight);

        [UIView commitAnimations];
    }
    
    if (brandbtntu.tag ==601) {
       
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.1];
        
        if (brandbtntu.selected) {
            vi2.backgroundColor = [UIColor clearColor];
           
        }
        else{
            vi2.backgroundColor = UIColorFromRGB(0xe9e9e9)
            ;        }
        if (brandbtntu.selected)
        {
            
            [brandbtntu setImage:[UIImage imageNamed:@"icon_next_up png"] forState:UIControlStateNormal];
            coloralpview.alpha=1;
            
            
            
            
            scroll.contentSize = CGSizeMake(scroll.ViewWidth, scroll.contentSize.height + coloralpview.ViewHeight);
            
            }
        else{
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDelay:.1];
            [brandbtntu setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
            coloralpview.alpha=0;
            
            scroll.contentSize = CGSizeMake(scroll.ViewWidth, scroll.contentSize.height - coloralpview.ViewHeight);
            
    }
        
        for (int i=0; i<4; i++) {
            UIView *view = [brandview viewWithTag:i+10];
            if (view.tag == 11) {
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? 94 : 94 + brandalpview.ViewHeight, Width-75, 94);
                
            }
            if (view.tag == 12) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? orginY + 94 : orginY + brandalpview.ViewHeight + 94, Width-75, 94);
            }
            if (view.tag == 13) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                float orginX = brandalpview.alpha ==0 ? 94 :94+brandalpview.frame.size.height;
                view.frame=CGRectMake(0, phongalpview.alpha == 0 ? 94 + orginX + orginY : 94 + orginX + orginY + phongalpview.ViewHeight, Width-75, 94);
            }
        }
        
        CGRect colorframe = coloralpview.frame;
        colorframe.origin.y = brandalpview.alpha == 0 ? 94 * 2 : 94 * 2 + brandalpview.ViewHeight;
        coloralpview.frame = colorframe;
        
        
        CGRect phongframe = phongalpview.frame;
        float orginX = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginY = coloralpview.alpha == 0 ? 94 + orginX : 94 + coloralpview.ViewHeight + orginX;
        phongframe.origin.y = phongalpview.alpha == 0 ? orginY+94 : orginY + phongalpview.ViewHeight;
        phongalpview.frame = phongframe;
        
        
       
        
        CGRect shipmentframe = shipmentsview.frame;
        
        float orginQ = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginW = coloralpview.alpha == 0 ? 94 + orginQ : 94 + coloralpview.ViewHeight + orginQ;
        float oringT = phongalpview.alpha == 0 ? 94 + orginW : 94+orginW+phongalpview.frame.size.height;
        shipmentframe.origin.y = shipmentsview.alpha == 0 ?94 +  oringT : 94+ oringT ;
        shipmentsview.frame = shipmentframe;
        
        float orgin_height = brandalpview.alpha == 0 ? 0 : brandalpview.ViewHeight;
        float orgin_colorheight = coloralpview.alpha == 0 ?
        orgin_height : orgin_height+coloralpview.ViewHeight;
        float orgin_phohaheight = phongalpview.alpha == 0 ? orgin_colorheight :phongalpview.frame.size.height+orgin_colorheight;
        float orgin_shipmentheight = shipmentsview.alpha == 0 ? orgin_phohaheight : orgin_phohaheight +shipmentsview.frame.size.height;
        brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*5+orgin_shipmentheight);
        
        [UIView commitAnimations];


        
    }
    if (brandbtntu.tag ==602) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.1];
        
        if (brandbtntu.selected)
        {
            
            [brandbtntu setImage:[UIImage imageNamed:@"icon_next_up png"] forState:UIControlStateNormal];
            phongalpview.alpha=1;
            
            
            scroll.contentSize = CGSizeMake(scroll.ViewWidth, scroll.contentSize.height + phongalpview.ViewHeight);
            
            ;
        }
        else{
            
            
            [brandbtntu setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
            phongalpview.alpha=0;
            
            scroll.contentSize = CGSizeMake(scroll.ViewWidth, scroll.contentSize.height - phongalpview.ViewHeight);
        }
        
        for (int i=0; i<4; i++) {
            UIView *view = [brandview viewWithTag:i+10];
            if (view.tag == 11) {
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? 94 : 94 + brandalpview.ViewHeight, Width-75, 94);
               
                
            }
            if (view.tag == 12) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? orginY + 94 : orginY + brandalpview.ViewHeight + 94, Width-75, 94);
            }
            if (view.tag == 13) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                float orginX = brandalpview.alpha ==0 ? 94 :94+brandalpview.frame.size.height;
                view.frame=CGRectMake(0, phongalpview.alpha == 0 ? 94 + orginX + orginY : 94 + orginX + orginY + phongalpview.ViewHeight, Width-75, 94);
            }
        }
        
        
        CGRect phongframe = phongalpview.frame;
        float orginX = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginY = coloralpview.alpha == 0 ? 94 + orginX : 94 + coloralpview.ViewHeight + orginX;
        phongframe.origin.y = phongalpview.alpha == 0 ? orginY+74 : orginY + phongalpview.ViewHeight;
        phongalpview.frame = phongframe;
        
 
        CGRect shipmentframe = shipmentsview.frame;
        
        float orginQ = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginW = coloralpview.alpha == 0 ? 94 + orginQ : 94 + coloralpview.ViewHeight + orginQ;
        float oringT = phongalpview.alpha == 0 ? 94 + orginW : 94+orginW+phongalpview.frame.size.height;
        shipmentframe.origin.y = shipmentsview.alpha == 0 ?94 +  oringT : 94+ oringT ;
        shipmentsview.frame = shipmentframe;
        
        
        float orgin_height = brandalpview.alpha == 0 ? 0 : brandalpview.ViewHeight;
        float orgin_colorheight = coloralpview.alpha == 0 ?
        orgin_height : orgin_height+coloralpview.ViewHeight;
        float orgin_phohaheight = phongalpview.alpha == 0 ? orgin_colorheight :phongalpview.frame.size.height+orgin_colorheight;
        float orgin_shipmentheight = shipmentsview.alpha == 0 ? orgin_phohaheight : orgin_phohaheight +shipmentsview.frame.size.height;
        brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*5+orgin_shipmentheight);
        
        
        [UIView commitAnimations];
    }
    if (brandbtntu.tag ==603) {
        
        if (brandbtntu.selected) {
            vi3.backgroundColor = [UIColor clearColor];
        }
        else{
            vi3.backgroundColor = UIColorFromRGB(0xe9e9e9);
        }

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.1];
        
        if (brandbtntu.selected)
        {
            
            [brandbtntu setImage:[UIImage imageNamed:@"icon_next_up png"] forState:UIControlStateNormal];
            shipmentsview.alpha=1;
            scroll.contentSize = CGSizeMake(scroll.ViewWidth, scroll.contentSize.height + shipmentsview.ViewHeight);
            
            ;
        }
        else{
            
            
            [brandbtntu setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
            shipmentsview.alpha=0;
            
            scroll.contentSize = CGSizeMake(scroll.ViewWidth, scroll.contentSize.height - shipmentsview.ViewHeight);
        }
        
        for (int i=0; i<4; i++) {
            UIView *view = [brandview viewWithTag:i+10];
            if (view.tag == 11) {
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? 94 : 94 + brandalpview.ViewHeight, Width-75, 94);
                
                
            }
            if (view.tag == 12) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? orginY + 94 : orginY + brandalpview.ViewHeight + 94, Width-75, 94);
            }
            if (view.tag == 13) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                float orginX = brandalpview.alpha ==0 ? 94 :94+brandalpview.frame.size.height;
                view.frame=CGRectMake(0, phongalpview.alpha == 0 ? 94 + orginX + orginY : 94 + orginX + orginY + phongalpview.ViewHeight, Width-75, 94);
            }
        }
        
      
        CGRect shipmentframe = shipmentsview.frame;
        
        float orginQ = brandalpview.alpha ==0 ? 94 : 94+brandalpview.frame.size.height;
        float orginW = coloralpview.alpha == 0 ? 94 + orginQ : 94 + coloralpview.ViewHeight + orginQ;
        float oringT = phongalpview.alpha == 0 ? 94 + orginW : 94+orginW+phongalpview.frame.size.height;
        shipmentframe.origin.y = shipmentsview.alpha == 0 ?94 +  oringT : 94+ oringT ;
        shipmentsview.frame = shipmentframe;
        
        float orgin_height = brandalpview.alpha == 0 ? 0 : brandalpview.ViewHeight;
        float orgin_colorheight = coloralpview.alpha == 0 ?
        orgin_height : orgin_height+coloralpview.ViewHeight;
        float orgin_phohaheight = phongalpview.alpha == 0 ? orgin_colorheight :phongalpview.frame.size.height+orgin_colorheight;
        float orgin_shipmentheight = shipmentsview.alpha == 0 ? orgin_phohaheight : orgin_phohaheight +shipmentsview.frame.size.height;
        brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*5+orgin_shipmentheight);
        
        
        [UIView commitAnimations];
    }
}

-(void)brandbtnCilk:(UIButton *)brandbtnCilk{
    brandbtnCilk.selected = !brandbtnCilk.selected;
    if (brandbtnCilk.selected)
    {
        [selectedArray addObject:@(brandbtnCilk.tag)];
        brandbtnCilk.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
    }
    else
    {
        [selectedArray removeObject:@(brandbtnCilk.tag)];
        brandbtnCilk.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
    }
}
-(void)screenbtnCilk:(UIButton*)screenbtnCilk{
    
   
    UIButton *Pricebtn =(UIButton *)[shaixuanview viewWithTag:10];
    UIButton *Salesbtn =(UIButton *)[shaixuanview viewWithTag:11];
    UIButton *Group_buyingbtn =(UIButton *)[shaixuanview viewWithTag:12];
    UIButton *Promotionbtn =(UIButton *)[shaixuanview viewWithTag:13];
        
    Pricebtn.layer.borderColor =UIColorFromRGB(0x31cdaa).CGColor;
    Salesbtn.layer.borderColor = [UIColor clearColor].CGColor;
    Group_buyingbtn.layer.borderColor = [UIColor clearColor].CGColor;
    Promotionbtn.layer.borderColor = [UIColor clearColor].CGColor;
    
    [Salesbtn setTitleColor:UIColorFromRGB(0x818181) forState:UIControlStateNormal];
    [Group_buyingbtn setTitleColor:UIColorFromRGB(0x818181) forState:UIControlStateNormal];
    [Pricebtn setTitleColor:UIColorFromRGB(0x818181) forState:UIControlStateNormal];
    [Promotionbtn setTitleColor:UIColorFromRGB(0x818181) forState:UIControlStateNormal];
    
    if(screenbtnCilk.tag ==10)
    {
        screenlab.textColor =UIColorFromRGB(0x31cdaa);
        if (selectedButton == 0)
        {
            priceStaus += 1;
            screenlab.textAlignment = NSTextAlignmentLeft;
        }
        selectedButton = 0;
        if (priceStaus > 2)
        {screenlab.textAlignment = NSTextAlignmentLeft;
            priceStaus = 0;
        }
        if (priceStaus == 2) {
            
            imgvi.image = [UIImage imageNamed:@"icon_price_top"];
            screenlab.frame = CGRectMake((Width-48)/4*3/4/7, screenbtnCilk.frame.size.height/2-8, 40, 17);
            screenlab.textAlignment = NSTextAlignmentLeft;
            
        }
        else if (priceStaus == 1) {
            imgvi.image = [UIImage imageNamed:@"icon_price_down"];
            screenlab.frame = CGRectMake((Width-48)/4*3/4/7, screenbtnCilk.frame.size.height/2-8, 40, 17);
            
            
        }
        else if (priceStaus ==0){
            
            imgvi.image = [UIImage imageNamed:@""];
            screenlab.frame =CGRectMake(screenbtnCilk.frame.size.width/2-20,screenbtnCilk.frame.size.height/2-8.5, 40, 17);
            screenlab.textAlignment = NSTextAlignmentCenter;

        }
        return;
    }
    
    if (screenbtnCilk.tag ==11) {
       
        selectedButton = 1;
        Pricebtn.layer.borderColor = [UIColor clearColor].CGColor;
        screenlab.textColor =UIColorFromRGB(0x818181);
        screenlab.textAlignment = NSTextAlignmentLeft;
        
        imgvi.image = [UIImage imageNamed:@""];
        screenlab.frame =CGRectMake(screenbtnCilk.frame.size.width/2-20,screenbtnCilk.frame.size.height/2-8.5, 40, 17);
        
        
        Salesbtn.layer.borderColor =UIColorFromRGB(0x31cdaa).CGColor;
        
        [Salesbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        
    }
    if (screenbtnCilk.tag ==12) {
        selectedButton = 2;
        Pricebtn.layer.borderColor = [UIColor clearColor].CGColor;
        screenlab.textColor =UIColorFromRGB(0x818181);
        screenlab.textAlignment = NSTextAlignmentLeft;
        imgvi.image = [UIImage imageNamed:@""];
        screenlab.frame =CGRectMake(screenbtnCilk.frame.size.width/2-20,screenbtnCilk.frame.size.height/2-8.5, 40, 17);
        
        Group_buyingbtn.layer.borderColor =UIColorFromRGB(0x31cdaa).CGColor;
        [Group_buyingbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        
    }
    if (screenbtnCilk.tag ==13) {
        selectedButton = 3;
        Pricebtn.layer.borderColor = [UIColor clearColor].CGColor;
        screenlab.textColor =UIColorFromRGB(0x818181);
        screenlab.textAlignment = NSTextAlignmentLeft;
        
        imgvi.image = [UIImage imageNamed:@""];
        screenlab.frame =CGRectMake(screenbtnCilk.frame.size.width/2-20, screenbtnCilk.frame.size.height/2-8.5, 40, 17);
        
        Promotionbtn.layer.borderColor =UIColorFromRGB(0x31cdaa).CGColor;
        [Promotionbtn setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
        
    }
}
-(void)resettingbtnCilk:(UIButton *)resettingbtn{
    if (resettingbtn.tag==100) {
   
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:.1];
    
    screentitiview.frame=CGRectMake(0, 0, Width-75, 93 * 3);
    
    brandview.frame= CGRectMake(0,30+screentitiview.frame.size.height, Width-75, 94*4);
    
    
    scroll.contentSize = CGSizeMake(0, fuwuarray.count*94+(pinpaimuarray.count)*94+20+10*(allscreenmuarry.count+1));
    
    alpview.alpha = 0;
    brandalpview.alpha = 0;
    coloralpview.alpha = 0;
    phongalpview.alpha = 0;
    shipmentsview.alpha = 0;
       
        
        
    for (int i=0; i<4; i++) {
            UIView *view = [brandview viewWithTag:i+10];
            if (view.tag == 11) {
                
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? 94 : 94 + brandalpview.ViewHeight, Width-75, 94);
                
            }
            if (view.tag == 12) {
                float orginY = coloralpview.alpha == 0 ? 94 : 94+ coloralpview.ViewHeight;
                view.frame=CGRectMake(0, brandalpview.alpha == 0 ? orginY + 94 : orginY + brandalpview.ViewHeight + 94, Width-75, 94);
                
                
            }
            if (view.tag == 13) {
                
                float orginY = coloralpview.alpha == 0 ? 94 : 94 + coloralpview.ViewHeight;
                float orginX = brandalpview.alpha ==0 ? 94 :94+brandalpview.frame.size.height;
                view.frame=CGRectMake(0, phongalpview.alpha == 0 ? 94 + orginX + orginY : 94 + orginX + orginY + phongalpview.ViewHeight, Width-75, 94);
            }
            
        }
    
    for (int i=0; i<3; i++) {
        UIView *view = [screentitiview viewWithTag:i+1];
        
        if (view.tag == 2) {
            
            view.frame=CGRectMake(0, 114, Width-75, 94);
        }
        if (view.tag == 3) {
            view.frame=CGRectMake(0, 114+94, Width-75, 94);
        }
    }
    [UIView commitAnimations];
    
    
    for (int i = 0; i < 3; i++)
    {
        id object = [screentitiview viewWithTag:i + 1];
        if ([object isKindOfClass:[UIView class]])
        {
            UIView *view = (UIView *)object;
            for (int j = 0;j < mumorescreenarry.count;j++)
            {
                UIButton *button = (UIButton *)[view viewWithTag:j + 50];
                if ([button isKindOfClass:[UIButton class]])
                {
                    button.selected = NO;
                    button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                }
            }
            
            for (int io = 0; io<2; io++){
                UITextField*field = (UITextField *)[view viewWithTag:100+io];
                if ([field isKindOfClass:[UITextField class]])
                {
                    field.text=@"";
                }
            }
        }
    }
    for (int op = 0; op < 4; op++)
    {
        id object = [brandview viewWithTag:op + 10];
        if ([object isKindOfClass:[UIView class]])
        {
            UIView *view = (UIView *)object;
            for (int j = 0;j < mumorescreenarry.count;j++)
            {
                UIButton *button = (UIButton *)[view viewWithTag:j + 300];
                if ([button isKindOfClass:[UIButton class]])
                {
                    button.selected = NO;
                    button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                }
            }
        }
    }
   
        id object = alpview;
        if ([object isKindOfClass:[UIView class]])
        {
            UIView *view = (UIView *)object;
            for (int kk=0; kk<alpmuarry.count; kk++) {
            
            UIButton *button = (UIButton *)[view viewWithTag:kk+50];
                if ([button isKindOfClass:[UIButton class]])
                {
                    button.selected = NO;
                    button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                    }
                }
            }
        
        
    for (int h = 0; h<brandalparry.count; h++) {
            
        id object = brandalpview;
        if ([object isKindOfClass:[UIView class]])
        {
            UIView *view = (UIView *)object;
            UIButton *button = (UIButton *)[view viewWithTag:h+50];
            if ([button isKindOfClass:[UIButton class]])
                {
                    button.selected = NO;
                    button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                }
            }
        }
    
        for (int A = 0; A<brandalparry.count;A++) {
            
            id object = coloralpview;
            if ([object isKindOfClass:[UIView class]])
            {
                UIView *view = (UIView *)object;   
                UIButton *button = (UIButton *)[view viewWithTag:A+50];
                if ([button isKindOfClass:[UIButton class]])
                    {
                        button.selected = NO;
                        button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                    }
                }
            }
    
       for (int S = 0;S<brandalparry.count;S++) {
            
            id object =phongalpview ;
            if ([object isKindOfClass:[UIView class]])
            {
                UIView *view = (UIView *)object;
                UIButton *button = (UIButton *)[view viewWithTag:S+50];
                    if ([button isKindOfClass:[UIButton class]])
                    {
                        button.selected = NO;
                        button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                    }
                }
            }
        
        for (int W = 0; W<brandalparry.count; W++) {
            
            id object = shipmentsview;
            if ([object isKindOfClass:[UIView class]])
            {
                UIView *view = (UIView *)object;
                UIButton *button = (UIButton *)[view viewWithTag:W+50];
                if ([button isKindOfClass:[UIButton class]])
                    {
                        button.selected = NO;
                        button.layer.borderColor = UIColorFromRGB(0xc0c0c0).CGColor;
                    }
                }
            }
        
    [morebtntu setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
        
        for (int pp = 0; pp<4; pp++) {
            UIButton *button = (UIButton *)[brandview viewWithTag:600+pp];
            if (button.selected) {
                 [button setImage:[UIImage imageNamed:@"icon_next_gray"] forState:UIControlStateNormal];
                button.selected=!button.selected;
            }

        }
    }
    else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:.05];
        screenview.frame =CGRectMake(Width, 0, Width-75, Height);
        boorview.alpha=0;
        [UIView commitAnimations];
        }
}
#pragma mark --表的方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        
    return [tableviCellmuarray count];
    return ((NSArray *)[tableviCellmuarray objectAtIndex:section]).count;
        

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

    static NSString *str = @"cell";
    UITableViewCell *cell = [tablevi dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        
        UIView* tuijianview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,278/2)];
        
        tuijianview.backgroundColor = [UIColor whiteColor];
        [cell addSubview:tuijianview];
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 278/2, Width,1)];
        vi1.backgroundColor = UIColorFromRGB(0xe9e9e9);
        [cell addSubview:vi1];
        
        
        
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
        return cell;
    }




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    
    [tablevi deselectRowAtIndexPath:indexPat animated:YES];
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 278/2;
   
    
}


#pragma mark --textField-Return
-(void)Recognizer{
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    
    
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}
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
