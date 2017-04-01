

//
//  AddBank.m
//  Beautiful
//
//  Created by pro on 17/3/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AddBank.h"
#import "SDAutoLayout.h"
#import "ChooseBank.h"
@interface AddBank ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *arr;
    NSArray *arrTF;
    
    UICollectionView *collectionVi;
}

@end

@implementation AddBank

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"添加银行卡"];
    [self addBackButton];
    
    [self arrclik];
    [self bank];
}

- (void)arrclik{
    arr = [[NSArray alloc]initWithObjects:@"选择银行",@"持卡人",@"银行卡号", nil];
    arrTF = [[NSArray alloc]initWithObjects:@"请输入持卡人姓名",@"请输入卡号", nil];
}


- (void)btnturn{
    // MY * myturn = [[MY alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)bank{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //列距
    flowLayout.minimumInteritemSpacing = 0;
    //行距
    flowLayout.minimumLineSpacing = 0;
    //item大大小
    flowLayout.itemSize = CGSizeMake(Width, 111/2);
    //初始化
    collectionVi = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 74.5, Width, Height) collectionViewLayout:flowLayout];
    //设置代理
    collectionVi.dataSource = self;
    collectionVi.delegate = self;
    //设置背景颜色
    collectionVi.backgroundColor = UIColorFromRGB(0xf6f6f6);
    //添加视图显示
    [self.view addSubview:collectionVi];
    
    //注册时用UICollectionViewCell
    [collectionVi registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    UILabel *labRemark =[[UILabel alloc]init];
    labRemark.frame = CGRectMake(15, 502/2, Width/2.2455, 12);
    labRemark.text = @"* 请绑定本人真实有效的银行卡";
    labRemark.textColor = UIColorFromRGB(0xff0101);
    labRemark.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:labRemark];
    
    
    UIButton *btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.backgroundColor = UIColorFromRGB(0x31cdaa);
    [btnSave setTitle:@"保存" forState:UIControlStateNormal];
    btnSave.titleLabel.font = [UIFont systemFontOfSize:17];
    btnSave.layer.cornerRadius = 5;
    btnSave.clipsToBounds = YES;
    [btnSave addTarget:self action:@selector(btnSaveCilk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
    btnSave.sd_layout
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .centerYIs(364)
    .heightIs(44);
    
    
    
}
-(void)btnSaveCilk:(UIButton *)btnSave{
   
    UITextField *namefiled =(UITextField *)[collectionVi viewWithTag:101];
    UITextField *numberfiled =(UITextField *)[collectionVi viewWithTag:102];
    
    if (numberfiled.text.length == 0) {
        _orSelf = NO;;
    }else{
        _orSelf = YES;
    }
    if (namefiled.text.length == 0) {
        _orSelf = NO;
    }else{
        _orSelf = YES;
    }

    ChooseBank * bankvi;
    for (bankvi in self.navigationController.viewControllers) {
        if ([bankvi isKindOfClass:[ChooseBank class]])
        {
            NSArray *arry = [NSArray arrayWithObjects:namefiled.text,numberfiled.text, nil];
            bankvi.arry = arry;
            [bankvi.banktableview reloadData];
            [self.navigationController popToViewController:bankvi  animated:YES];
            
            }
        }
    }
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 3;
}

//创建item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    cell.backgroundColor = UIColorFromRGB(0xffffff);
    
        UIView *viewStriping = [[UIView alloc]init];
        viewStriping.backgroundColor = UIColorFromRGB(0xf6f6f6);
        viewStriping.frame = CGRectMake(15, 109.5/2, Width-30, 1);
        [cell addSubview:viewStriping];
    
    
        UILabel *labID = [[UILabel alloc]init];
        labID.frame = CGRectMake(15, 19.5, Width/5.7692, 16);
        labID.textAlignment = NSTextAlignmentLeft;
        labID.font = [UIFont systemFontOfSize:16];
        labID.text = arr[indexPath.row];
        labID.textColor = UIColorFromRGB(0x222222);
        [cell addSubview:labID];
        
    
    if (indexPath.row==0) {
        UILabel *labchoose = [[UILabel alloc]init];
        labchoose.frame = CGRectMake(Width-Width/3.658536, 22, Width/5.1724, 14);
        labchoose.text = @"请选择银行";
        labchoose.font = [UIFont systemFontOfSize:14];
        labchoose.textColor = UIColorFromRGB(0x7a7a7a);
        [cell addSubview:labchoose];
        
        UIImageView *imgchoose = [[UIImageView alloc]init];
        imgchoose.frame = CGRectMake(Width- Width/15, 22, Width/37.5, 13);
        imgchoose.image = [UIImage imageNamed:@"icon_next_right"];
        [cell addSubview:imgchoose];
    }
    else{
        NSString *strTF = [arrTF objectAtIndex:indexPath.row-1];
        UITextField *textfield = [[UITextField alloc]init];
        textfield.frame = CGRectMake(Width/3.261, 22, Width/1.6, 20);
        textfield.placeholder = strTF;
        textfield.clearButtonMode = UITextFieldViewModeAlways;
        textfield.tag =100+indexPath.row;
        [textfield setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
        [textfield setValue:UIColorFromRGB(0x7a7a7a) forKeyPath:@"_placeholderLabel.Color"];
        [cell addSubview:textfield];
        if (indexPath.row == 2) {
            textfield.keyboardType = UIKeyboardTypeNumberPad;
        }
    }

    
    return cell;
}
#pragma mark - cell的点击事件 -
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (indexPath.row==0) {
        NSLog(@"选择银行");
    }

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
