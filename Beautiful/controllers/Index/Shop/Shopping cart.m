//
//  Shopping cart.m
//  xiupin
//
//  Created by mac on 17/2/16.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "Shopping cart.h"

@interface Shopping_cart ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tab;
    NSArray *array;
    NSMutableArray *Array;
    NSMutableArray *getArray;
    UIButton *editBtn;
    UIButton *subtractButton;
    UIButton *addButton;
    UILabel *totalLab;
    NSInteger zanNum;
    NSInteger zanNum2;
    
    UILabel *nameLabel;
    UILabel *quantityLab;
    UILabel *currencyLabel;
    UILabel *priceLabel;
    UILabel *x2Label;
    
    UIButton *subtractButton2;
    UIButton *addButton2;
    UILabel *totalLab2;
    UILabel *nameLabel2;
    UILabel *quantityLab2;
    UILabel *currencyLabel2;
    UILabel *priceLabel2;
    UILabel *x2Label2;
}

@end

@implementation Shopping_cart

- (void)viewDidLoad {
    [super viewDidLoad];
    zanNum=8;
    zanNum2=4;
   array=@[@"一天",@"二天",@"三天"];
    getArray=[NSMutableArray array];
    Array=[NSMutableArray arrayWithObjects:@"1",@"2",@"3",nil];
    // Do any additional setup after loading the view from its nib.
    UIView *View=[UIView new];
    View.frame=CGRectMake(0, 0, Width, 64);
    View.backgroundColor=UIColorFromRGB(0x31cdaa);
    [self.view addSubview:View];
    
    UILabel *shoppingLabel=[UILabel new];
    shoppingLabel.text=@"购物车";
    shoppingLabel.textColor=[UIColor whiteColor];
    shoppingLabel.frame=CGRectMake(152.5, 20,100, 50);
    shoppingLabel.font=[UIFont systemFontOfSize:24];
    [View addSubview:shoppingLabel];
    
    tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, 617)];
    tab.delegate=self;
    tab.dataSource=self;
    tab.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:tab];
    
    UILongPressGestureRecognizer *longGp=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGPClick:)];
    [tab addGestureRecognizer:longGp];
#pragma mark - -  结算view  － －
    UIView *View1=[UIView new];
    View1.frame=CGRectMake(0, 567, Width, 50);
    View1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:View1];
    
    UILabel *checkLabel1=[UILabel new];
    checkLabel1.frame=CGRectMake(15, 10, 50, 30);
    checkLabel1.text=@"全选";
    checkLabel1.font=[UIFont systemFontOfSize:18];
    [View1 addSubview:checkLabel1];
    
    UILabel *totalLabel2=[UILabel new];
    totalLabel2.frame=CGRectMake(140, 5, 55, 40);
    totalLabel2.textAlignment= 2;
    totalLabel2.text=@"合计：";
    [View1 addSubview:totalLabel2];
    
    UILabel *RMBLabel3=[UILabel new];
    RMBLabel3.frame=CGRectMake(190, 5, 80, 40);
    RMBLabel3.text=@"¥0.00";
    RMBLabel3.textColor=UIColorFromRGB(0xf5a81f);
    RMBLabel3.font=[UIFont systemFontOfSize:18];
    [View1 addSubview:RMBLabel3];
    
    UILabel *linesLabel4=[UILabel new];
    linesLabel4.frame=CGRectMake(0, 567, Width-125, 1);
    linesLabel4.backgroundColor=UIColorFromRGB(0x909082);
    [self.view addSubview:linesLabel4];
    
    UILabel *linesLabel5=[UILabel new];
    linesLabel5.frame=CGRectMake(0, 617, Width-125, 1);
    linesLabel5.backgroundColor=UIColorFromRGB(0x909082);
    [self.view addSubview:linesLabel5];
   
    UIButton *settleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    settleBtn.frame=CGRectMake(250, 0, 125, 50);
    settleBtn.backgroundColor=UIColorFromRGB(0x31cdaa);
    [settleBtn setTitle:@"结算" forState:UIControlStateNormal];
    [settleBtn addTarget:self action:@selector(settleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [View1 addSubview:settleBtn];
#pragma mark - -  中view  －－
   
}

#pragma mark -- 长按Cell --
//长按
-(void)longGPClick:(UILongPressGestureRecognizer *)longgp
{//长按状态的判断
    if (longgp.state==UIGestureRecognizerStateBegan) {
        //获取tableview 点击的位置
        CGPoint point=[longgp locationInView:tab];
        //获取位置所在的行
        NSIndexPath *indexPath=[tab indexPathForRowAtPoint:point];
        if (indexPath==nil)
        {
            return;
        }
        tab.editing=!tab.editing;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return Array.count;
}
#pragma mark -- 高 --
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return Height*0.2;
    NSString *type=[array objectAtIndex:indexPath.row];
    if([type isEqualToString:@"一天"]){
        return 50;
    }
    if([type isEqualToString:@"二天"]){
        return 138;
    }
    else {
        return 138;
    }
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *type=[array objectAtIndex:indexPath.row];
    if([type isEqualToString:@"一天"]){
    NSString *celling=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
    if (cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
        UILabel *headingLabel=[UILabel new];
        headingLabel.tag=100;
        headingLabel.frame=CGRectMake(15, 8, 200, 34);
        [cell addSubview:headingLabel];
        
        UIButton *headingButton=[UIButton buttonWithType:UIButtonTypeCustom];
        headingButton.tag=110;
        [cell addSubview:headingButton];
    }
        UILabel *headingLab=(UILabel *)[cell viewWithTag:100];
        headingLab.text=@"成都春熙路旗舰店";
        
        editBtn=(UIButton *)[cell viewWithTag:110];
        editBtn.frame=CGRectMake(320, 8, 40, 34);
        [editBtn setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
        [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [editBtn addTarget:self action:@selector(editBtn:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
    if([type isEqualToString:@"二天"]){
        NSString *celling=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
        if (cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
            UIImageView *TpImgView1=[UIImageView new];
            TpImgView1.clipsToBounds=YES;
            TpImgView1.contentMode  =UIViewContentModeScaleToFill;
            TpImgView1.tag=200;
            [cell addSubview:TpImgView1];
            
            nameLabel=[UILabel new];
            nameLabel.text=@"优质雷波脐橙优质雷波脐橙优质雷波脐橙";
            nameLabel.tag=210;
            nameLabel.alpha=1;
            [cell addSubview:nameLabel];
            
            quantityLab=[UILabel new];
            quantityLab.frame=CGRectMake(130, 20, 40, 40);
            quantityLab.text=@"数量";
            quantityLab.alpha=0;
            [cell addSubview:quantityLab];
            
            subtractButton=[UIButton buttonWithType:UIButtonTypeCustom];
            subtractButton.frame=CGRectMake(130, 70, 40, 35);
            [subtractButton setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            //    显示边框 颜色和宽 layer.borderColor／layer setBorderWidth
            subtractButton.layer.borderColor = [[UIColor blackColor] CGColor];
            [subtractButton.layer setBorderWidth:1];
            [subtractButton setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
            [subtractButton addTarget:self action:@selector(subtractBtn:) forControlEvents:UIControlEventTouchUpInside];
            subtractButton.alpha=0;
            [cell addSubview:subtractButton];
            
            totalLab=[UILabel new];
            totalLab.frame=CGRectMake(170, 70, 60, 35);
            totalLab.textAlignment= 1;
            totalLab.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
            totalLab.layer.borderColor = [[UIColor blackColor] CGColor];
            [totalLab.layer setBorderWidth:1];
            totalLab.layer.borderColor = [[UIColor blackColor]CGColor];
            totalLab.alpha=0;
            [cell addSubview:totalLab];
            
            addButton=[UIButton buttonWithType:UIButtonTypeCustom];
            addButton.frame=CGRectMake(230, 70, 40, 35);
            [addButton setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            addButton.layer.borderColor = [[UIColor blackColor] CGColor];
            [addButton.layer setBorderWidth:1];
            [addButton addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
            [addButton setImage:[UIImage imageNamed:@"icon_query"] forState:UIControlStateNormal];
            addButton.alpha=0;
            [cell addSubview:addButton];
            
            currencyLabel=[UILabel new];
            currencyLabel.text=@"¥";
            currencyLabel.tag=220;
            currencyLabel.alpha=1;
            [cell addSubview:currencyLabel];
            
            priceLabel=[UILabel new];
            priceLabel.text=@"49";
            priceLabel.tag=230;
            priceLabel.alpha=1;
            [cell addSubview:priceLabel];
            
            x2Label=[UILabel new];
            x2Label.text=@"x2";
            x2Label.tag=240;
            x2Label.alpha=1;
            [cell addSubview:x2Label];
            
                    }
        UIImageView *TpImg1=(UIImageView *)[cell viewWithTag:200];
        TpImg1.frame=CGRectMake(15,20, 100, 100);
        TpImg1.image=[UIImage imageNamed:@"banner"];
        
        UILabel *nameLab=(UILabel *)[cell viewWithTag:210];
        nameLab.frame=CGRectMake(130, 20, 230, 25);
        nameLab.numberOfLines=0;
        [nameLab sizeToFit];
        nameLab.font=[UIFont systemFontOfSize:16];
        nameLab.textColor=UIColorFromRGB(0x222222);
        
        UILabel *currencyLab=(UILabel *)[cell viewWithTag:220];
        currencyLab.frame=CGRectMake(130, 100, 10, 20);
        currencyLab.textColor=UIColorFromRGB(0xff0000);
        currencyLab.font=[UIFont systemFontOfSize:16];
        
        UILabel *priceLab=(UILabel *)[cell viewWithTag:230];
        priceLab.frame=CGRectMake(140, 98, 25, 25);
        priceLab.textColor=UIColorFromRGB(0xff0000);
        priceLab.font=[UIFont systemFontOfSize:20];
        
        UILabel *x2Lab=(UILabel *)[cell viewWithTag:240];
        x2Lab.frame=CGRectMake(340, 100, 20, 20);
        x2Lab.textColor=UIColorFromRGB(0x222222);
        x2Lab.font=[UIFont systemFontOfSize:18];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        NSString *celling=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celling];
        if (cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celling];
            UIImageView *TpImgView2=[UIImageView new];
            TpImgView2.clipsToBounds=YES;
            TpImgView2.contentMode  =UIViewContentModeScaleToFill;
            TpImgView2.tag=300;
            [cell addSubview:TpImgView2];
            
            nameLabel2=[UILabel new];
            nameLabel2.text=@"优质雷波脐橙优质雷波脐橙优质雷波脐橙";
            nameLabel2.tag=310;
            nameLabel2.alpha=1;
            [cell addSubview:nameLabel2];
            
            quantityLab2=[UILabel new];
            quantityLab2.frame=CGRectMake(130, 20, 40, 40);
            quantityLab2.text=@"数量";
            quantityLab2.alpha=0;
            [cell addSubview:quantityLab2];
            
            subtractButton2=[UIButton buttonWithType:UIButtonTypeCustom];
            subtractButton2.frame=CGRectMake(130, 70, 40, 35);
            [subtractButton2 setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            //    显示边框 颜色和宽 layer.borderColor／layer setBorderWidth
            subtractButton2.layer.borderColor = [[UIColor blackColor] CGColor];
            [subtractButton2.layer setBorderWidth:1];
            [subtractButton2 setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
            [subtractButton2 addTarget:self action:@selector(subtractBtn2:) forControlEvents:UIControlEventTouchUpInside];
            subtractButton2.alpha=0;
            [cell addSubview:subtractButton2];
            
            totalLab2=[UILabel new];
            totalLab2.frame=CGRectMake(170, 70, 60, 35);
            totalLab2.textAlignment= 1;
            totalLab2.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
            totalLab2.layer.borderColor = [[UIColor blackColor] CGColor];
            [totalLab2.layer setBorderWidth:1];
            totalLab2.layer.borderColor = [[UIColor blackColor]CGColor];
            totalLab2.alpha=0;
            [cell addSubview:totalLab2];
            
            addButton2=[UIButton buttonWithType:UIButtonTypeCustom];
            addButton2.frame=CGRectMake(230, 70, 40, 35);
            [addButton2 setTitleColor:UIColorFromRGB(0x222222) forState:UIControlStateNormal];
            addButton2.layer.borderColor = [[UIColor blackColor] CGColor];
            [addButton2.layer setBorderWidth:1];
            [addButton2 addTarget:self action:@selector(addBtn2:) forControlEvents:UIControlEventTouchUpInside];
            [addButton2 setImage:[UIImage imageNamed:@"icon_query"] forState:UIControlStateNormal];
            addButton2.alpha=0;
            [cell addSubview:addButton2];
            
            currencyLabel2=[UILabel new];
            currencyLabel2.text=@"¥";
            currencyLabel2.tag=320;
            currencyLabel2.alpha=1;
            [cell addSubview:currencyLabel2];
            
            priceLabel2=[UILabel new];
            priceLabel2.text=@"49";
            priceLabel2.tag=330;
            priceLabel2.alpha=1;
            [cell addSubview:priceLabel2];
            
            x2Label2=[UILabel new];
            x2Label2.text=@"x2";
            x2Label2.tag=340;
            x2Label2.alpha=1;
            [cell addSubview:x2Label2];
            
        }
        UIImageView *TpImg1=(UIImageView *)[cell viewWithTag:300];
        TpImg1.frame=CGRectMake(15,20, 100, 100);
        TpImg1.image=[UIImage imageNamed:@"banner"];
        
        UILabel *nameLab=(UILabel *)[cell viewWithTag:310];
        nameLab.frame=CGRectMake(130, 20, 230, 25);
        nameLab.numberOfLines=0;
        [nameLab sizeToFit];
        nameLab.font=[UIFont systemFontOfSize:16];
        nameLab.textColor=UIColorFromRGB(0x222222);
        
        UILabel *currencyLab=(UILabel *)[cell viewWithTag:320];
        currencyLab.frame=CGRectMake(130, 100, 10, 20);
        currencyLab.textColor=UIColorFromRGB(0xff0000);
        currencyLab.font=[UIFont systemFontOfSize:16];
        
        UILabel *priceLab=(UILabel *)[cell viewWithTag:330];
        priceLab.frame=CGRectMake(140, 98, 25, 25);
        priceLab.textColor=UIColorFromRGB(0xff0000);
        priceLab.font=[UIFont systemFontOfSize:20];
        
        UILabel *x2Lab=(UILabel *)[cell viewWithTag:340];
        x2Lab.frame=CGRectMake(340, 100, 20, 20);
        x2Lab.textColor=UIColorFromRGB(0x222222);
        x2Lab.font=[UIFont systemFontOfSize:18];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }

}
-(void)editBtn:(UIButton *)btn{
    NSLog(@"编辑");
    
    
    nameLabel.alpha=0;
    quantityLab.alpha=1;
    subtractButton.alpha=1;
    totalLab.alpha=1;
    addButton.alpha=1;
    currencyLabel.alpha=0;
    priceLabel.alpha=0;
    x2Label.alpha=0;
    
    nameLabel2.alpha=0;
    quantityLab2.alpha=1;
    subtractButton2.alpha=1;
    totalLab2.alpha=1;
    addButton2.alpha=1;
    currencyLabel2.alpha=0;
    priceLabel2.alpha=0;
    x2Label2.alpha=0;
    
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    btn.frame=CGRectMake(220, 8, 40, 34);
     btn.layer.borderColor = [[UIColor blackColor] CGColor];
    [btn.layer setBorderWidth:1];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [tab reloadData];

}
-(void)certainBtn:(UIButton *)certainbtn{
    UIView *certainView=[self.view viewWithTag:10000];
    [certainView removeFromSuperview];
    NSLog(@"certain-----");
}
-(void)subtractBtn:(UIButton *)subtractbtn{
    zanNum=zanNum-1;
    totalLab.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
}
-(void)addBtn:(UIButton *)addbtn{
    zanNum=zanNum+1;
    totalLab.text=[NSString stringWithFormat:@"%ld",(long)zanNum] ;
}
-(void)subtractBtn2:(UIButton *)subtractbtn{
    zanNum2=zanNum2-1;
    totalLab2.text=[NSString stringWithFormat:@"%ld",(long)zanNum2] ;
}
-(void)addBtn2:(UIButton *)addbtn{
    zanNum2=zanNum2+1;
    totalLab2.text=[NSString stringWithFormat:@"%ld",(long)zanNum2] ;
}
-(void)settleBtnClick:(UIButton *)settlebtn{
   
        NSLog(@"结算");
//        [Array removeObjectsInArray:getArray];
    nameLabel.alpha=1;
    quantityLab.alpha=0;
    subtractButton.alpha=0;
    totalLab.alpha=0;
    addButton.alpha=0;
    currencyLabel.alpha=1;
    priceLabel.alpha=1;
    x2Label.alpha=1;
    
    nameLabel2.alpha=1;
    quantityLab2.alpha=0;
    subtractButton2.alpha=0;
    totalLab2.alpha=0;
    addButton2.alpha=0;
    currencyLabel2.alpha=1;
    priceLabel2.alpha=1;
    x2Label2.alpha=1;
    
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [tab reloadData];
//        [getArray removeAllObjects];
//        tab.editing=!tab.editing;
    
}
//删除 写了这个方法 就是滑动删除效果
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Array removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
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
    [getArray addObject:[Array objectAtIndex:indexPath.row]];
        NSLog(@"zzzzz");
}
//点击以被选中的单元格
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [getArray removeObject:[Array objectAtIndex:indexPath.row]];
    NSLog(@"gggg");
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
