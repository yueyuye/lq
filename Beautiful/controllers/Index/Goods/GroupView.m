//
//  GroupView.m
//  xiupin
//
//  Created by pro on 17/2/24.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "GroupView.h"

@interface GroupView ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    UITableView *tableview;
    
    NSMutableArray *imgmuarry1;
    NSMutableArray *imgmuarry;
    
    
    
    NSMutableArray *imgmuarr1;
    NSMutableArray *imgmuarr;
}

@end

@implementation GroupView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:@"我要组团/求购"];
    [self addBackButton];
    imgmuarry = [NSMutableArray arrayWithObjects:@"icon_add_pic",@"icon_add_pic",@"icon_add_pic",@"icon_add_pic",@"icon_add_pic", nil];
    imgmuarry1 = [NSMutableArray arrayWithObjects:@"icon_add_pic",@"icon_add_pic",@"icon_add_pic",@"icon_add_pic",@"icon_add_pic",nil];
    
    
    
    
    tableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-114) style:UITableViewStyleGrouped];
    tableview.dataSource =self;
    tableview.delegate = self;
    tableview.separatorStyle = NO;
    tableview.showsVerticalScrollIndicator = NO;
    tableview.backgroundColor = UIColorFromRGB(0xf6f6f6);
    [self.view addSubview:tableview];
    
    UIButton *publishbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    publishbtn.frame = CGRectMake(0,Height-50, Width, 50);
    publishbtn.backgroundColor = UIColorFromRGB(0x31cdaa);
    [publishbtn addTarget:self action:@selector(publishbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
    [publishbtn setTitle:@"确定发布" forState:UIControlStateNormal];
    [self.view addSubview:publishbtn];
    
    [self Recognizer];
}
-(void)publishbtnCilk:(UIButton *)publishbtn{
    NSLog(@"确定发布");
}

#pragma  mark == 表的方法

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }
    else{
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }
    else{
        return .1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 2;
    }
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            return 122;
        }
        return 257;
    }
    return 56;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 //第一区 -- 求购名称，数量，人数
    if (indexPath.section == 0) {
        
        UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(15, 55, Width-30, 1)];
        vi.backgroundColor = UIColorFromRGB(0xf2f2f2);
        [cell addSubview:vi];
    if (indexPath.row ==0) {
        UILabel *nameLabel=[UILabel new];
        nameLabel.frame=CGRectMake(15,18, 150, 20);
        nameLabel.text=@"组团/求购名称";
        nameLabel.textColor=UIColorFromRGB(0x222222);
        nameLabel.font=[UIFont systemFontOfSize:16];
        [cell addSubview:nameLabel];
        
        UITextField *typelab=[UITextField new];
        typelab.frame=CGRectMake(130, 20, Width-165, 20);
        typelab.delegate = self;
        typelab.clearButtonMode = UITextFieldViewModeAlways;
        typelab.placeholder = @"苹果5斤组团";
        [typelab setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        typelab.textColor=UIColorFromRGB(0x7a7a7a);
        [cell addSubview:typelab];
        
        
        }
    if(indexPath.row==1){
        
       
        UILabel *Unit_PriceLabel=[UILabel new];
        Unit_PriceLabel.frame=CGRectMake(15,18, 150, 20);
        Unit_PriceLabel.text=@"组团/求购单价";
        Unit_PriceLabel.textColor=UIColorFromRGB(0x222222);
        Unit_PriceLabel.font=[UIFont systemFontOfSize:15];
        [cell addSubview:Unit_PriceLabel];
        
        
        UITextField *Unit_PriceField=[UITextField new];
        Unit_PriceField.frame=CGRectMake(130, 20, Width-130, 20);
        Unit_PriceField.delegate = self;
        Unit_PriceField.clearButtonMode = UITextFieldViewModeAlways;
        Unit_PriceField.placeholder = @"求购时不知单价可填“请商家报价”";
        [Unit_PriceField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        Unit_PriceField.textColor=UIColorFromRGB(0x7a7a7a);
        [cell addSubview:Unit_PriceField];
        
        }
    if(indexPath.row==2){
        
        
        UILabel *numberLabel=[UILabel new];
        numberLabel.frame=CGRectMake(15,18, 150, 20);
        numberLabel.text=@"组团/求购人数";
        numberLabel.textColor=UIColorFromRGB(0x222222);
        numberLabel.font=[UIFont systemFontOfSize:16];
        [cell addSubview:numberLabel];
        
        UITextField *numberField=[UITextField new];
        numberField.frame=CGRectMake(130, 20, Width-165, 20);
        numberField.delegate = self;
        numberField.clearButtonMode = UITextFieldViewModeAlways;
        numberField.textColor=UIColorFromRGB(0x7a7a7a);
        [cell addSubview:numberField];
        
        vi.frame =CGRectMake(0, 55, Width, 1);
        }
    
        return cell;
    }
    //第一区 -- 求购期限，配送方式
    if (indexPath.section == 1) {
        
       UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 55, Width, 1)];
        
        vi.backgroundColor = UIColorFromRGB(0xf2f2f2);
        [cell addSubview:vi];
        if (indexPath.row == 0) {

            UILabel *termLabel=[UILabel new];
            termLabel.frame=CGRectMake(15,18, 150, 20);
            termLabel.text=@"截止日期";
            termLabel.textColor=UIColorFromRGB(0x222222);
            termLabel.font=[UIFont systemFontOfSize:16];
            [cell addSubview:termLabel];
                
            UILabel *termlab=[UILabel new];
            termlab.frame=CGRectMake(100, 18, Width-165, 20);
            termlab.text = @"以当前日期开始，最长期限为7天";
            termlab.font =  [UIFont systemFontOfSize:14];
            termlab.textColor=UIColorFromRGB(0x7a7a7a);
            [cell addSubview:termlab];
            
            
            UIButton *termbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            termbtn.frame = CGRectMake(Width-30, 20, 8, 13);
            [termbtn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
            [cell addSubview:termbtn];
           }
    if (indexPath.row == 1){
        
        
        UILabel *deliverylab=[UILabel new];
        deliverylab.frame=CGRectMake(15,18,150, 20);
        deliverylab.text=@"配送方式";
        deliverylab.textColor=UIColorFromRGB(0x222222);
        deliverylab.font=[UIFont systemFontOfSize:16];
        [cell addSubview:deliverylab];
        
        UILabel *distributionlab=[UILabel new];
        distributionlab.frame=CGRectMake(130,20,Width-165, 20);
        distributionlab.text=@"";
        distributionlab.textColor=UIColorFromRGB(0x222222);
        distributionlab.font=[UIFont systemFontOfSize:14];
        [cell addSubview:distributionlab];
        
  //请选择 >
        UIButton *termbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        termbtn.frame = CGRectMake(Width-30, 22, 8, 13);
        [termbtn setImage:[UIImage imageNamed:@"icon_next_right"] forState:UIControlStateNormal];
        [cell addSubview:termbtn];
        
        UIButton *selectbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        selectbtn.frame = CGRectMake(Width-110, 18, 100, 20);
        [selectbtn setTitle:@"请选择"forState:UIControlStateNormal];
        selectbtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [selectbtn setTitleColor:UIColorFromRGB(0x7a7a7a) forState:UIControlStateNormal];
        [cell addSubview:selectbtn];
        
        }
        return cell;
    }
    else {
        UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(15, 256, Width-30, 1)];
        vi.backgroundColor = UIColorFromRGB(0xf2f2f2);
        [cell addSubview:vi];
        
    if (indexPath.row == 0) {
        UILabel *Unit_PriceLabel=[UILabel new];
        Unit_PriceLabel.frame=CGRectMake(15,18, 150, 20);
        Unit_PriceLabel.text=@"商品图片";
        Unit_PriceLabel.textColor=UIColorFromRGB(0x222222);
        Unit_PriceLabel.font=[UIFont systemFontOfSize:15];
        [cell addSubview:Unit_PriceLabel];

    for (int m = 0; m<imgmuarry1.count; m++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(50+m%3*(Width-134)/3+m%3*17,56+m/3*(Width-134)/3+m/3*16, (Width-134)/3, (Width-134)/3)];
        img.image = [UIImage imageNamed:imgmuarry1[m]];
        img.tag = m+300;
        [img setUserInteractionEnabled:YES];
        [cell addSubview:img];
        
        
        UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgtapgesCilk:)];
        [img addGestureRecognizer:tapges];
        
        UIButton *minusbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        minusbtn.frame = CGRectMake(40+m%3*(Width-134)/3+m%3*17+(Width-134)/3,46+m/3*(Width-134)/3+m/3*16, 20, 20);
        [minusbtn setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
        minusbtn.tag = m+600;
        [minusbtn addTarget:self action:@selector(minusbuttonCilk:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:minusbtn];
                    
                }
            }
    

    if (indexPath.row == 1) {
        UILabel *Unit_PriceLabel=[UILabel new];
        Unit_PriceLabel.frame=CGRectMake(15,18, 150, 20);
        Unit_PriceLabel.text=@"文字描述";
        Unit_PriceLabel.textColor=UIColorFromRGB(0x222222);
        Unit_PriceLabel.font=[UIFont systemFontOfSize:15];
        [cell addSubview:Unit_PriceLabel];
        
        
        UITextView *textvi = [[UITextView alloc]init];
        textvi.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        textvi.text=@"请输入文字介绍";
        textvi.delegate =self;
        textvi.tag = 909;
        textvi.font= [UIFont systemFontOfSize:14];
        textvi.textColor = UIColorFromRGB(0x7a7a7a);
        [cell addSubview:textvi];
        
        CGRect frame = textvi.frame;
        frame.origin.x = 15;
        frame.origin.y = 40;
        frame.size.width = (Width/1.3);
        textvi.frame = frame;
        
    }
    if (indexPath.row == 2){
        UILabel *Unit_PriceLabel=[UILabel new];
        Unit_PriceLabel.frame=CGRectMake(15,18, 150, 20);
        Unit_PriceLabel.text=@"详情图";
        Unit_PriceLabel.textColor=UIColorFromRGB(0x222222);
        Unit_PriceLabel.font=[UIFont systemFontOfSize:15];
        [cell addSubview:Unit_PriceLabel];
        
        for (int m = 0; m<imgmuarry.count; m++) {
            UIImageView *imge = [[UIImageView alloc]initWithFrame:CGRectMake(50+m%3*(Width-134)/3+m%3*17,56+m/3*(Width-134)/3+m/3*16, (Width-134)/3, (Width-134)/3)];
            imge.tag = m + 200;
            [imge setUserInteractionEnabled:YES];
            imge.image = [UIImage imageNamed:imgmuarry[m]];
            [cell addSubview:imge];
            
            UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgtapCilk:)];
            [imge addGestureRecognizer:tapges];
            
            UIButton *minusbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            minusbtn.frame = CGRectMake(40+m%3*(Width-134)/3+m%3*17+(Width-134)/3,46+m/3*(Width-134)/3+m/3*16, 20, 20);
            minusbtn.tag =m+500;
            [minusbtn setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
            [minusbtn addTarget:self action:@selector(minusbtnCilk:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:minusbtn];
            
        }
    }
        return cell;
    }
}
-(void)imgtapgesCilk:(UITapGestureRecognizer *)imgtapges{
    for (int k = 0; k < imgmuarry1.count; k++) {
        
        if (imgtapges.view.tag == k+300) {
            [imgmuarry1 replaceObjectAtIndex:k withObject:@"icon_my_services"];
            
        }
        
    }
    [tableview reloadData];
}
-(void)minusbuttonCilk:(UIButton *)minusbutton{
    for (int k = 0; k < imgmuarry1.count+1; k++) {
        
        if (minusbutton.tag == k+600) {
            [imgmuarry1 replaceObjectAtIndex:k withObject:@"icon_add_pic"];
        }
        
    }
    [tableview reloadData];
}

//详情图片点击方法

-(void)imgtapCilk:(UITapGestureRecognizer*)imgtap{
    
    
    for (int k = 0; k < imgmuarry.count+1; k++) {
        
        if (imgtap.view.tag == k+200) {
            [imgmuarry replaceObjectAtIndex:k withObject:@"icon_my_services"];
           
        }
        
    }
    [tableview reloadData];
}

-(void)minusbtnCilk:(UIButton *)minusbtn{
   
    for (int k = 0; k < imgmuarry.count; k++) {
       
        if (minusbtn.tag == k+500) {
    [imgmuarry replaceObjectAtIndex:k withObject:@"icon_add_pic"];
        }
       
    }
    [tableview reloadData];
}
#pragma  mark == textview代理

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    textView.text = @"";
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
