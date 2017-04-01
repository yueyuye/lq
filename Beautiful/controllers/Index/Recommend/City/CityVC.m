//
//  CityVC.m
//  Beautiful
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CityVC.h"

@interface CityVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *scrollvi;
    
    UITableView *tablevi;
    NSArray *arry;
    NSArray *letterarry;
}
@end

@implementation CityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"选择城市"];
    [self addBackButton];
    
    
    scrollvi = [UIScrollView new];
    scrollvi.showsVerticalScrollIndicator = NO;
    scrollvi.contentSize = CGSizeMake(Width, 10000);
    [self.view addSubview:scrollvi];
    scrollvi.sd_layout.topSpaceToView(self.view,64).leftSpaceToView(self.view,0).widthIs(Width).heightIs(Height-64);
    
    tablevi = [[UITableView alloc]initWithFrame:CGRectMake(0, 320, Width, 5000) style:UITableViewStyleGrouped];
    tablevi.delegate = self;
    tablevi.dataSource =self;
    tablevi.scrollEnabled =NO;
    tablevi.separatorStyle = NO;
    tablevi.rowHeight = 45;
    [scrollvi addSubview:tablevi];
    
    [self nsarry];
    [self CurveCity];
    [self hotCity];
}
-(void)nsarry{
    arry = @[@"北京",@"上海",@"重庆",@"浙江",@"辽宁",@"广东"];
    letterarry=@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",];
}
-(void)CurveCity{
    UIView *searchvi = [UIView new];
    searchvi.backgroundColor = UIColorFromRGB(0xffffff);
    searchvi.layer.borderColor = UIColorFromRGB(0xe3e3e3).CGColor;
    searchvi.layer.borderWidth = 2;
    searchvi.layer.cornerRadius = 15;
    searchvi.clipsToBounds = YES;
    [scrollvi addSubview:searchvi];
    searchvi.sd_layout.leftSpaceToView(scrollvi,15).rightSpaceToView(scrollvi,15).topSpaceToView(scrollvi,15).heightIs(35);
    
    UIButton *searchbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [searchbutton setImage:[UIImage imageNamed:@"icon_serach"] forState:UIControlStateNormal];
    [searchbutton addTarget:self action:@selector(searchbuttonCilk:) forControlEvents:UIControlEventTouchUpInside];
    [searchvi addSubview:searchbutton];
    searchbutton.sd_layout.widthIs(15).heightIs(15).topSpaceToView(searchvi,10).leftSpaceToView(searchvi,95);
    
    
    UITextField *field = [UITextField new];
    field.placeholder = @"请输入你要搜索的城市";
    field.clearButtonMode = UITextFieldViewModeAlways;
    [field setValue:[UIFont boldSystemFontOfSize:14]forKeyPath:@"_placeholderLabel.font"];
    [searchvi addSubview:field];
    field.sd_layout.widthIs(Width/2).heightIs(20).topSpaceToView(searchvi,10).leftSpaceToView(searchvi,115);
    
    
    UILabel *lab = [UILabel new];
    lab.text =@"当前定位城市";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor =UIColorFromRGB(0xb4b4b4);
    lab.font = [UIFont systemFontOfSize:14];
    [scrollvi addSubview:lab];
    lab.sd_layout.widthIs(85).heightIs(20).topSpaceToView(scrollvi,70).leftSpaceToView(scrollvi,15);
    
    
    UIView *view = [UIView new];
    view.backgroundColor =UIColorFromRGB(0xd8d8d8);
    [scrollvi addSubview:view];
    view.sd_layout.rightSpaceToView(scrollvi,15).heightIs(.5).centerYEqualToView(lab).leftSpaceToView(lab,10);
    
    UIButton *Curvebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Curvebutton setTitle:@" 成都市" forState:UIControlStateNormal];
    Curvebutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [Curvebutton setTitleColor:UIColorFromRGB(0x31cdaa) forState:UIControlStateNormal];
    Curvebutton.layer.borderColor = UIColorFromRGB(0x31cdaa).CGColor;
    Curvebutton.layer.borderWidth = 2;
    Curvebutton.layer.cornerRadius = 5;
    Curvebutton.clipsToBounds = YES;
    [Curvebutton setImage:[UIImage imageNamed:@"icon_site_green"] forState:UIControlStateNormal];
    [Curvebutton addTarget:self action:@selector(CurvebuttonCilk:) forControlEvents:UIControlEventTouchUpInside];
    [scrollvi addSubview:Curvebutton];
    Curvebutton.sd_layout.widthIs(106).heightIs(42).topSpaceToView(scrollvi,100).leftSpaceToView(scrollvi,15);
}
-(void)hotCity{
    UILabel *lab = [UILabel new];
    lab.text =@"热门城市";
    lab.textAlignment = NSTextAlignmentLeft;
    lab.textColor =UIColorFromRGB(0xb4b4b4);
    lab.font = [UIFont systemFontOfSize:14];
    [scrollvi addSubview:lab];
    lab.sd_layout.widthIs(60).heightIs(20).topSpaceToView(scrollvi,157).leftSpaceToView(scrollvi,15);
    
    
    UIView *view = [UIView new];
    view.backgroundColor =UIColorFromRGB(0xd8d8d8);
    [scrollvi addSubview:view];
    view.sd_layout.rightSpaceToView(scrollvi,15).heightIs(.5).centerYEqualToView(lab).leftSpaceToView(lab,10);
    
    
    for (int i = 0; i<arry.count; i++) {
        UIButton *hotbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        hotbutton.frame = CGRectMake(15+i%3*((Width-60)/3+15), i/3*(42+15)+200, (Width-60)/3, 42);
        [hotbutton setTitle:arry[i] forState:UIControlStateNormal];
        [hotbutton setTitleColor:UIColorFromRGB(0x656565) forState:UIControlStateNormal];
        hotbutton.layer.cornerRadius = 5;
        hotbutton.clipsToBounds = YES;
        hotbutton.layer.borderWidth = 2;
        hotbutton.titleLabel.font =[UIFont systemFontOfSize:15];
        hotbutton.layer.borderColor = UIColorFromRGB(0xe3e3e3).CGColor;
        [hotbutton addTarget:self action:@selector(hotbuttonCilk:) forControlEvents:UIControlEventTouchUpInside];
        [scrollvi addSubview:hotbutton];
      
        
        
        UIView *view = [UIView new];
        view.backgroundColor =UIColorFromRGB(0xd8d8d8);
        [scrollvi addSubview:view];
        view.sd_layout.rightSpaceToView(scrollvi,0).heightIs(.5).topSpaceToView(scrollvi,320).leftSpaceToView(scrollvi,0);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)searchbuttonCilk:(UIButton *)buttonCilk{
    NSLog(@"搜索你想要的城市");
    
}
-(void)CurvebuttonCilk:(UIButton *)buttonCilk{
    NSLog(@"当前城市");
}
-(void)hotbuttonCilk:(UIButton *)buttonCilk{
    NSLog(@"热门城市");
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return letterarry.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *string = letterarry[section];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,Width,30)];
    view.backgroundColor =UIColorFromRGB(0xf6f6f6);
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15,8,15,15);
    label.textColor = UIColorFromRGB(0xb4b4b4);
    label.font = [UIFont systemFontOfSize:12.0];
    label.text = string;
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    return view;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
     return 0.001;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *string =letterarry[section];
    
    return string;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str= @"cell";
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!Cell) {
        Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        UIView *view = [UIView new];
        view.frame = CGRectMake(0,43, Width, .5);
        view.backgroundColor =UIColorFromRGB(0xd8d8d8);
        [Cell addSubview:view];
        
    }
    return Cell;
}

@end
