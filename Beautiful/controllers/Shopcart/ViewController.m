//
//  ViewController.m
//  购物车
//
//  Created by pro on 17/2/28.
//  Copyright (c) 2017年 yi. All rights reserved.
//

#import "ViewController.h"
#import "Commodity_detailsView.h"
#import "settleView.h"
#import "ShopCartButton.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tab;
    NSInteger zanNum;
    int b;
    
    UIButton *addButton;
    UILabel *Commodity_quantityLabel;
    UIButton *subtractButton;
    
    UILabel *Commodity_nameLabel;
    UILabel *currencyLabel;
    UILabel *priceLabel;
    UILabel * x2Label;
    UILabel *quantityLabel;

    NSDictionary *dictionary;
    UIView *v;
    NSMutableArray *selectArray;
    NSMutableArray *selectSection;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    zanNum=8;
    b=0;
    
    selectArray = [NSMutableArray new];
    selectSection = [NSMutableArray new];
    
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:@"优质雷波脐橙优质雷波脐橙优质雷波",@"葡萄", nil],@"1",[NSArray arrayWithObjects:@"苹果",@"栗子",@"香江",nil],@"2", nil];

    [self setNavigationBar:@"购物车"];
    self.view.backgroundColor = UIColorFromRGB(0xf6f6f6);
  
    tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height)];
    tab.delegate=self;
    tab.dataSource=self;
    tab.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:tab];
    

#pragma mark - -  结算view  － －
    UIView *View=[UIView new];
    View.frame=CGRectMake(0, Height-100, Width, 50);
    View.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:View];
    
    UIButton *chooseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.frame=CGRectMake(15, 13, 23, 23);
    [chooseBtn setImage:[UIImage imageNamed:@"icon_choose_green"] forState:UIControlStateNormal];
    [chooseBtn setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateSelected];
    chooseBtn.selected=NO;
    [chooseBtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    chooseBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [View addSubview:chooseBtn];
    
    UILabel *checkLabel=[UILabel new];
    checkLabel.frame=CGRectMake(45, 15,40, 20);
    checkLabel.text=@"全选";
    checkLabel.font=[UIFont systemFontOfSize:18];
    [View addSubview:checkLabel];
    
    UILabel *totalLabel=[UILabel new];
    totalLabel.frame=CGRectMake(130, 15, 45, 20);
    totalLabel.font=[UIFont systemFontOfSize:15];
    totalLabel.textAlignment= 2;
    totalLabel.text=@"合计：";
    [View addSubview:totalLabel];
    
    UILabel *RMBLabel=[UILabel new];
    RMBLabel.frame=CGRectMake(175, 15, 50, 20);
    RMBLabel.text=@"¥0.00";
    RMBLabel.textColor=UIColorFromRGB(0xf5a81f);
    RMBLabel.font=[UIFont systemFontOfSize:20];
    [View addSubview:RMBLabel];
    
    UILabel *linesLabel=[UILabel new];
    linesLabel.frame=CGRectMake(0, Height-100, Width-140, 1);
    linesLabel.backgroundColor=UIColorFromRGB(0x909082);
    [self.view addSubview:linesLabel];
    
    UILabel *linesLabel2=[UILabel new];
    linesLabel2.frame=CGRectMake(0, Height-50, Width, 1);
    linesLabel2.backgroundColor=UIColorFromRGB(0x909082);
    [self.view addSubview:linesLabel2];
    
    UIButton *settleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    settleBtn.frame=CGRectMake(Width-140, 0, 140, 50);
    settleBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    [settleBtn setTitle:@"结算" forState:UIControlStateNormal];
    [settleBtn addTarget:self action:@selector(settleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    settleBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [View addSubview:settleBtn];
    

}


// 设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}


//标签数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dictionary.allKeys.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    v = nil;

    v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 44)];
v.backgroundColor = UIColorFromRGB(0xffffff);
    UIButton *ChooseBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    ChooseBtn1.tag = section;
    
    ChooseBtn1.frame=CGRectMake(15, 13, 23, 23);
    [ChooseBtn1 setImage:[UIImage imageNamed:@"icon_choose_green"] forState:UIControlStateNormal];
    [ChooseBtn1 setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateSelected];
    ChooseBtn1.selected = [selectSection containsObject:@(section)] ? YES : NO;
    [ChooseBtn1 addTarget:self action:@selector(ChooseBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:ChooseBtn1];
    
    UILabel *NameLabel=[UILabel new];
    NameLabel.frame=CGRectMake(54, 15, 130, 20);
    NameLabel.text=@"成都春熙路旗舰店";
    NameLabel.textColor=UIColorFromRGB(0x222222);
    NameLabel.font=[UIFont systemFontOfSize:16];
    [v addSubview:NameLabel];
    
    
    UIButton *EdiBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    EdiBtn.frame=CGRectMake(Width-50, 15, 35, 20);
    [EdiBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [EdiBtn setTitle:@"完成" forState:UIControlStateSelected];
    [EdiBtn addTarget:self action:@selector(EdiBtn:) forControlEvents:UIControlEventTouchUpInside];
    EdiBtn.selected=NO;
    EdiBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [EdiBtn setTitleColor:UIColorFromRGB(0xa9a9a9) forState:UIControlStateNormal];
    [v addSubview:EdiBtn];

    return v;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[section]];
   return rowArray.count;
}
#pragma mark -- 高 --
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

  return 112;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  //隐藏分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSString *celling=@"cell";
       UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
       if (cell==nil){
           cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
           
           UILabel *linesLab=[UILabel new];
           linesLab.tag=500;
           [cell addSubview:linesLab];
           
           ShopCartButton *chooseBtn2=[ShopCartButton buttonWithType:UIButtonTypeCustom];
           chooseBtn2.tag=510;
           [cell addSubview:chooseBtn2];
           
           UIImageView *pictureImg=[UIImageView new];
           pictureImg.tag=520;
           [cell addSubview:pictureImg];
           
           UILabel *Commodity_nameLab=[UILabel new];
           Commodity_nameLab.tag=530;
           [cell addSubview:Commodity_nameLab];
           
           UILabel *quantityLab=[UILabel new];
           quantityLab.tag=540;
           [cell addSubview:quantityLab];
           
           UIButton *subtractBtn=[UIButton buttonWithType:UIButtonTypeCustom];
           subtractBtn.tag=550;
           [cell addSubview:subtractBtn];
           
           UILabel *totalLab=[UILabel new];
           totalLab.tag=560;
           [cell addSubview:totalLab];
           
           UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeCustom];
           addBtn.tag=570;
           [cell addSubview:addBtn];
           
           UILabel *currencyLab=[UILabel new];
           currencyLab.tag=580;
           [cell addSubview:currencyLab];
           
           UILabel *priceLab=[UILabel new];
           priceLab.tag=590;
           [cell addSubview:priceLab];
           
           
           UILabel *x2Lab=[UILabel new];
           x2Lab.tag=600;
           [cell addSubview:x2Lab];
       
}
        UILabel *LinesLabel=(UILabel *)[cell viewWithTag:500];
        LinesLabel.frame=CGRectMake(15, 0, Width-30, 1);
        LinesLabel.backgroundColor=UIColorFromRGB(0x909082);
        
        NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[indexPath.section]];
    
        ShopCartButton *ChooseBtn2=(ShopCartButton *)[cell viewWithTag:510];
        ChooseBtn2.frame=CGRectMake(15, 38, 23, 23);
        [ChooseBtn2 setImage:[UIImage imageNamed:@"icon_choose_green"] forState:UIControlStateNormal];
        [ChooseBtn2 setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateSelected];
    ChooseBtn2.indexPath = indexPath;
    ChooseBtn2.selected = [selectArray containsObject:rowArray[indexPath.row]] ? YES : NO;
        [ChooseBtn2 addTarget:self action:@selector(ChooseBtn2:) forControlEvents:UIControlEventTouchUpInside];
    
        UIImageView *pictureImg=(UIImageView *)[cell viewWithTag:520];
        pictureImg.frame=CGRectMake(54,15, 74, 74);
        pictureImg.image=[UIImage imageNamed:@"2.jpg"];
        pictureImg.clipsToBounds=YES;
        pictureImg.contentMode  =UIViewContentModeScaleToFill;
        
        Commodity_nameLabel=(UILabel *)[cell viewWithTag:530];
        Commodity_nameLabel.frame=CGRectMake(144, 15, 210, 20);
        Commodity_nameLabel.text=rowArray[indexPath.row];
        Commodity_nameLabel.numberOfLines=0;
        [Commodity_nameLabel sizeToFit];
        Commodity_nameLabel.textColor=UIColorFromRGB(0x222222);
        Commodity_nameLabel.font=[UIFont systemFontOfSize:16];
        
        quantityLabel=(UILabel *)[cell viewWithTag:540];
        quantityLabel.frame=CGRectMake(144, 21, 60, 16);
        quantityLabel.font=[UIFont systemFontOfSize:16];
        quantityLabel.textColor= UIColorFromRGB(0xa9a9a9);
        quantityLabel.text=@"数量";
        quantityLabel.alpha=0;
        
        
        subtractButton=(UIButton *)[cell viewWithTag:550];
        subtractButton.frame=CGRectMake(144,46, 40, 32);
        //    显示边框 颜色和宽 layer.borderColor／layer setBorderWidth
        subtractButton.layer.borderColor = [UIColorFromRGB(0xa9a9a9) CGColor];
        [subtractButton.layer setBorderWidth:1];
        [subtractButton setImage:[UIImage imageNamed:@"icon_choose_green"] forState:UIControlStateNormal];
        [subtractButton addTarget:self action:@selector(subtractBtn:) forControlEvents:UIControlEventTouchUpInside];
        subtractButton.alpha=0;
        [cell addSubview:subtractButton];
        
        
        Commodity_quantityLabel=(UILabel *)[cell viewWithTag:560];
        Commodity_quantityLabel.frame=CGRectMake(184,46, 60, 32);
        Commodity_quantityLabel.textAlignment= 1;
        Commodity_quantityLabel.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
        Commodity_quantityLabel.layer.borderColor = [UIColorFromRGB(0xa9a9a9) CGColor];
        [Commodity_quantityLabel.layer setBorderWidth:1];
        Commodity_quantityLabel.alpha=0;
        [cell addSubview:Commodity_quantityLabel];
        
        
        addButton=(UIButton *)[cell viewWithTag:570];
        addButton.frame=CGRectMake(244,46, 40, 32);
        addButton.layer.borderColor = [UIColorFromRGB(0xa9a9a9) CGColor];
        [addButton.layer setBorderWidth:1];
        [addButton addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        [addButton setImage:[UIImage imageNamed:@"icon_choose_pink"] forState:UIControlStateNormal];
        addButton.alpha=0;
        [cell addSubview:addButton];
        
        
        currencyLabel=(UILabel *)[cell viewWithTag:580];
        currencyLabel.frame=CGRectMake(144,76, 10, 14);
        currencyLabel.textColor=UIColorFromRGB(0xff0000);
        currencyLabel.font=[UIFont systemFontOfSize:16];
        currencyLabel.text=@"¥";
        
        
        priceLabel=(UILabel *)[cell viewWithTag:590];
        priceLabel.text=@"49";
        priceLabel.frame=CGRectMake(154, 73, 25, 20);
        priceLabel.textColor=UIColorFromRGB(0xff0000);
        priceLabel.font=[UIFont systemFontOfSize:20];
        
        
        x2Label=(UILabel *)[cell viewWithTag:600];
        x2Label.text=@"x2";
        x2Label.frame=CGRectMake(Width-34,76, 20, 20);
        x2Label.textColor=UIColorFromRGB(0x222222);
        x2Label.font=[UIFont systemFontOfSize:18];

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
      return cell;

}

-(void)chooseBtn:(UIButton *)chooseBtn{
    NSLog(@"---- 全选 ----");
    
    chooseBtn.selected = !chooseBtn.selected;
    if (chooseBtn.selected)
    {
        [selectSection addObject:@(chooseBtn.tag)];
        NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[chooseBtn.tag]];
        for (int i = 0; i < rowArray.count; i++)
        {
            [selectArray addObject:rowArray[i]];
        }
    }
    else
    {
        [selectSection removeObject:@(chooseBtn.tag)];
        NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[chooseBtn.tag]];
        for (int i = 0; i < rowArray.count; i++)
        {
            [selectArray removeObject:rowArray[i]];
        }
    }
    [tab reloadData];
    
}
-(void)settleBtnClick:(UIButton *)settlebtn{
    
    NSLog(@"--- 结算 ---");
    settleView *settleVC=[settleView new];
    [self.navigationController pushViewController:settleVC animated:YES];
}
-(void)ChooseBtn1:(UIButton *)ChooseBtn{
    ChooseBtn.selected = !ChooseBtn.selected;
    if (ChooseBtn.selected)
    {
        [selectSection addObject:@(ChooseBtn.tag)];
        NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[ChooseBtn.tag]];
        for (int i = 0; i < rowArray.count; i++)
        {
            [selectArray addObject:rowArray[i]];
        }
    }
    else
    {
        [selectSection removeObject:@(ChooseBtn.tag)];
        NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[ChooseBtn.tag]];
        for (int i = 0; i < rowArray.count; i++)
        {
            [selectArray removeObject:rowArray[i]];
        }
    }
    [tab reloadData];

    NSLog(@"---- 店铺选择 ----");

}
-(void)EdiBtn:(UIButton *)EdiBtn{
    NSLog(@"---- 编辑 ----");
    
    EdiBtn.selected = !EdiBtn.selected;
    if (b%2==1) {
      
        
        quantityLabel.alpha=0;
        Commodity_nameLabel.alpha=1;
        subtractButton.alpha=0;
        Commodity_quantityLabel.alpha=0;
        addButton.alpha=0;
        currencyLabel.alpha=1;
        priceLabel.alpha=1;
        x2Label.alpha=1;
        
//        [EdiBtn setTitle:@"编辑" forState:UIControlStateNormal];
    }
    else{
        quantityLabel.alpha=1;
        Commodity_nameLabel.alpha=0;
        subtractButton.alpha=1;
        Commodity_quantityLabel.alpha=1;
        addButton.alpha=1;
        currencyLabel.alpha=0;
        priceLabel.alpha=0;
        x2Label.alpha=0;
        
        
//        [EdiBtn setTitle:@"完成" forState:UIControlStateNormal];
    }
    b++;
}
-(void)ChooseBtn2:(ShopCartButton *)chooseBtn2{
    
    chooseBtn2.selected = !chooseBtn2.selected;
    NSArray *rowArray = (NSArray *)dictionary[dictionary.allKeys[chooseBtn2.indexPath.section]];
    
    if (chooseBtn2.selected)
    {
        [selectArray addObject:rowArray[chooseBtn2.indexPath.row]];
    }
    else
    {
        [selectArray removeObject:rowArray[chooseBtn2.indexPath.row]];
    }
    
    //判断是否全部选中
    BOOL is_choose = YES;
    for (NSString *str in rowArray)
    {
        if (![selectArray containsObject:str])
        {
            is_choose = NO;
            break;
        }
    }
    
    if (is_choose)
    {
        [selectSection addObject:@(chooseBtn2.indexPath.section)];
    }
    else
    {
        [selectSection removeObject:@(chooseBtn2.indexPath.section)];
    }
    [tab reloadData];
    

}

-(void)subtractBtn:(UIButton *)subtractbtn{
    NSLog(@"--- 点击减1 ---");
    zanNum=zanNum-1;
   Commodity_quantityLabel.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
}
-(void)addBtn:(UIButton *)addbtn{
    NSLog(@"--- 点击加1 ---");
    zanNum=zanNum+1;
    Commodity_quantityLabel.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
}

//删除 写了这个方法 就是滑动删除效果
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [Array removeObjectAtIndex:indexPath.row];
//    [tableView reloadData];
}
//编辑表的单元格编辑状态
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing)//通过表视图是否处于编辑状态来选择是左滑删除，还是多选删除。
    {
        //当表视图处于没有未编辑状态时选择多选删除
        return UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
    }
    else
    {
        //当表视图处于没有未编辑状态时选择左滑删除
        return UITableViewCellEditingStyleDelete;
    }
    
}
//改变 delete 文字
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
    
}

//点击单元格选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
    Commodity_detailsView *Commodity_detailsVC=[Commodity_detailsView new];
        [self.navigationController pushViewController:Commodity_detailsVC animated:YES];
         NSLog(@"xxxxxx");
  
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
