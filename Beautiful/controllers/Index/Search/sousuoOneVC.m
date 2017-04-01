//
//  sousuoOneVC.m
//  Beautiful
//
//  Created by mac on 17/3/3.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "sousuoOneVC.h"
#import "SouSuoVC.h"
#import "SDAutoLayout.h"
#import "Search_Historycell.h"
@interface sousuoOneVC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIView *titelview;
    
    NSMutableArray *ssmuarry;
    
    int num;
    
    int abc;
    
    UITableView * tablevi;
    
    UITextField * titifield;
    
    NSMutableArray *arry;

    UIView *view;
    
    NSUserDefaults *userDefaults;
}
@end

@implementation sousuoOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ssmuarry = [[NSMutableArray alloc]init];
    arry = [[NSMutableArray alloc]init];
    
    
    titelview = [UIView new];
    titelview.frame = CGRectMake(0, 0, Width, 64);
    titelview.backgroundColor = UIColorFromRGB(0x31cdaa);
    [self.view addSubview:titelview];
    [self.view bringSubviewToFront:titelview];
    
    UIView *ssview = [[UIView alloc]initWithFrame:CGRectMake(15, 28, Width - 77, 29)];
    ssview.backgroundColor = [UIColor whiteColor];
    ssview.layer.cornerRadius = 29/2;
    [titelview addSubview:ssview];
    
    UIButton *ssbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ssbtn.frame = CGRectMake(15,7, 15, 15);
    [ssbtn setImage:[UIImage imageNamed:@"icon_serach"] forState:UIControlStateNormal];
    [ssbtn addTarget:self action:@selector(ssbtn:) forControlEvents:UIControlEventTouchUpInside];
    [ssview addSubview:ssbtn];
    
    titifield = [[UITextField alloc]initWithFrame:CGRectMake(37, 7, ssview.frame.size.width-40,17)];
    titifield.placeholder = @"请输入关键字";
    titifield.delegate = self;
    titifield.clearButtonMode = UITextFieldViewModeAlways;
    [ssview addSubview:titifield];
    
    
    
    
    UIButton *cancelbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelbtn.frame = CGRectMake(Width-46, 35, 32, 14);
    [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelbtn addTarget:self action:@selector(cancelbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [cancelbtn.titleLabel sizeToFit];
    cancelbtn.titleLabel.numberOfLines=0;
    cancelbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    cancelbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [titelview addSubview:cancelbtn];
    
    
    UIButton *deletebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deletebtn.frame = CGRectMake(Width-36,84,15,15);
    [deletebtn setImage:[UIImage imageNamed:@"icon_dustbin"] forState:UIControlStateNormal];
    [deletebtn addTarget:self action:@selector(deletebtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deletebtn];

    
    UILabel *historylab = [[UILabel alloc]initWithFrame:CGRectMake(13,84,70,15)];
    historylab.text =@"历史搜索";
    historylab.textAlignment =NSTextAlignmentCenter;
    historylab.font = [UIFont systemFontOfSize:15];
    historylab.textColor =UIColorFromRGB(0x31cdaa);
    [self.view addSubview:historylab];
    
    tablevi =[UITableView new];
    tablevi.delegate =self;
    tablevi.dataSource =self;
    tablevi.rowHeight = Height-105;
    [self.view addSubview:tablevi];
    tablevi.separatorStyle = NO;
    tablevi.scrollEnabled =NO;
    tablevi.sd_layout.topSpaceToView(self.view,105).leftSpaceToView(self.view,0).bottomSpaceToView(self.view,0).widthIs(Width).heightIs(Height-105);
   
    
    [self Recognizer];
    [self saveNSUserDefaults];  //调用此方法将各种数据存储到NSUserDefautls中，在下面定义
    [self readNSUserDefaults];  //调用此方法从NSUserDefautls中读取各种数据，在下面定义
}
-(void)saveNSUserDefaults{
    userDefaults = [NSUserDefaults standardUserDefaults];
   
    [userDefaults setObject:ssmuarry forKey:@"ssmuarry"];
     [userDefaults synchronize];
}
-(void)readNSUserDefaults{
    NSArray *myArray = [userDefaults arrayForKey:@"ssmuarry"];
    NSString *myArrayString = [[NSString alloc] init];
    for(NSString *str in myArray)
    {
        NSLog(@"str= %@",str);
        myArrayString = [NSString stringWithFormat:@"%@  %@", myArrayString, str];
        [myArrayString stringByAppendingString:str];
       
        NSLog(@"myArrayString=%@",myArrayString);
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"status";
   
       Search_Historycell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
      if (cell == nil) {
        cell = [[Search_Historycell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
          
          cell = [[Search_Historycell alloc]initWithFrame:CGRectMake(10, 0, Width - 20,Height-150) dataArr:ssmuarry];
        [cell btnClickBlock:^(NSInteger index) {
            
              
          }];
          [self.view addSubview:cell];
    }
    cell.backgroundColor = UIColorFromRGB(0xf6f6f6);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)ssbtn:(UIButton *)ssbtn{
    
    SouSuoVC *sousuo = [SouSuoVC new];
    sousuo.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sousuo animated:YES];
    
    [ssmuarry addObject:titifield.text];
    //数组倒序排列
    ssmuarry=(NSMutableArray *)[[ssmuarry reverseObjectEnumerator] allObjects];
    [tablevi reloadData];
    
                
 }

-(void)deletebtnCilk:(UIButton *)deletebtn{
    [ssmuarry removeAllObjects];

    [tablevi reloadData];
    
}
-(void)cancelbtnCilk:(UIButton *)cancelbtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];// 1
    [titifield becomeFirstResponder];// 2
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
