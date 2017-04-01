//
//  AppraisaVC.m
//  Beautiful
//
//  Created by mac on 17/3/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AppraisaVC.h"

@interface AppraisaVC ()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat framefl;
    CGFloat frameX;
    CGFloat frame;
    CGFloat cellHeightfloat;
    
    
    NSDictionary *Diccell;
    
    UITableView *Appraisatable;
    
    NSMutableArray *CellMuArry;
    
    NSArray *AppraisaimgArry;
}
@end

@implementation AppraisaVC

- (void)viewDidLoad {
    CellMuArry =[NSMutableArray new];
    Diccell = [NSDictionary new];
    [super viewDidLoad];
    [self setNavigationBar:@"评价"];
    [self addBackButton];
    AppraisaimgArry = @[@"banner-1",@"banner",@"head"];
    
    [self Appraisatableview];
}

-(void)Appraisatableview{
    Appraisatable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-64)style:UITableViewStylePlain];
    Appraisatable.delegate =self;
    Appraisatable.dataSource =self;
    Appraisatable.showsVerticalScrollIndicator = NO;
    Appraisatable.separatorStyle = NO;
    [self.view addSubview:Appraisatable];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *lab =(UILabel *)[Appraisatable viewWithTag:111];
    UIImageView *img = (UIImageView *)[Appraisatable viewWithTag:123];
    if (indexPath.row == 0) {
        return 60;
    }
   
    cellHeightfloat =lab.ViewHeight+94.00+(AppraisaimgArry.count+2)/3*(Width-105)/3+(AppraisaimgArry.count+2)/3*11.00+img.ViewHeight;
    return cellHeightfloat+20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    if (indexPath.row == 0) {
        framefl =Width*.12+Width*.23+Width*.19+Width*.16;
        frameX = (Width-framefl-30)/3;
            
        UIButton* totalBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        totalBtn.frame=CGRectMake(15, 15,Width*.12, 25);
        totalBtn.backgroundColor=UIColorFromRGB(0xadebdd);
        totalBtn.layer.cornerRadius = 10;
        [totalBtn setTitle:@"全部" forState:UIControlStateNormal];
        [totalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        totalBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [totalBtn addTarget:self action:@
        selector(totalButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:totalBtn];
        frame = totalBtn.ViewWidth+frameX+15;
            
            
        UIButton* goodBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        goodBtn.frame=CGRectMake(frame, 15,Width*.23, 25);
        goodBtn.backgroundColor=UIColorFromRGB(0xadebdd);
        goodBtn.layer.cornerRadius = 10;
        [goodBtn setTitle:@"好评(999+)" forState:UIControlStateNormal];
        [goodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        goodBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [goodBtn addTarget:self action:@selector(goodButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:goodBtn];
        frame += goodBtn.ViewWidth+frameX;
            
        UIButton* centreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        centreBtn.frame=CGRectMake(frame, 15,Width*.19, 25);
        centreBtn.backgroundColor=UIColorFromRGB(0xadebdd);
        centreBtn.layer.cornerRadius = 10;
        [centreBtn setTitle:@"中评(20)" forState:UIControlStateNormal];
        [centreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        centreBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [centreBtn addTarget:self action:@selector(centreButton:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:centreBtn];
        frame += centreBtn.ViewWidth+frameX;
            
            
        UIButton* mistakeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        mistakeBtn.frame=CGRectMake(frame,15,Width*.16,25);
        mistakeBtn.backgroundColor=UIColorFromRGB(0xdbdbdb);
        mistakeBtn.layer.cornerRadius = 12.0f;
        [mistakeBtn setTitle:@"差评(3)" forState:UIControlStateNormal];
        [mistakeBtn setTitleColor:UIColorFromRGB(0x6c6c6c) forState:UIControlStateNormal];
        mistakeBtn.titleLabel.font=[UIFont systemFontOfSize:13];            [mistakeBtn addTarget:self action:@selector(mistakeButton:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:mistakeBtn];
            
        
        UIView *view = [UIView new];
        view.backgroundColor =UIColorFromRGB(0xd8d8d8);
        view.frame = CGRectMake(15,59, Width-30, .5);
        [cell addSubview:view];
       
                    }
   
    else {
        
        
        UIButton *headBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        headBtn.frame=CGRectMake(15, 20, 42, 42);
        [headBtn setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
        [headBtn addTarget:self action:@selector(headBtn:)forControlEvents:UIControlEventTouchUpInside];
        headBtn.layer.cornerRadius=20.5;
        headBtn.layer.cornerRadius = 21;
        headBtn.clipsToBounds =YES;
        headBtn.layer.masksToBounds=YES;
        [cell addSubview:headBtn];
    
        UILabel *nameLab=[UILabel new];
        nameLab.frame=CGRectMake(66, 20, 46, 15);
        nameLab.text=@"甜蜜儿";
        nameLab.textColor=UIColorFromRGB(0x656565);
        nameLab.font=[UIFont systemFontOfSize:15];
        [cell addSubview:nameLab];
        
    for (int i=0; i<4; i++) {
        UIImageView *speckImg=[UIImageView new];
        speckImg.frame=CGRectMake(66+12*i, 44, 13, 13);
        speckImg.image=[UIImage imageNamed:@"icon_star_yellow"];
        [cell addSubview:speckImg];
    
        UIImageView *speckImg2=[UIImageView new];
        speckImg2.frame=CGRectMake(114, 44, 13, 13);
        speckImg2.image=[UIImage imageNamed:@"icon_star_gray"];
        [cell addSubview:speckImg2];
        
        UILabel *timlab = [UILabel new];
        timlab.text =@"8月14日 15:43";
        timlab.textAlignment = NSTextAlignmentRight;
        timlab.textColor =UIColorFromRGB(0xa4a4a4);
        timlab.font = [UIFont systemFontOfSize:10];
        [cell addSubview:timlab];
        timlab.sd_layout.widthIs(88).heightIs(15).topSpaceToView
        (cell,20).rightSpaceToView(cell,15);
        
        UILabel *fair_evaluationLabel=[UILabel new];
        fair_evaluationLabel.tag = 111;
        fair_evaluationLabel.frame=CGRectMake(66,71, Width-81, 20);
        fair_evaluationLabel.text=@"宝贝很好，服务很到位，物流很好！！！宝贝很好，服务很到位，物流很好！！！宝贝很好，服务很到位，物流很好！！！";
        fair_evaluationLabel.textColor=UIColorFromRGB(0x222222);
        fair_evaluationLabel.font = [UIFont systemFontOfSize:14];
        fair_evaluationLabel.numberOfLines=0;
        [fair_evaluationLabel sizeToFit];
        [cell addSubview:fair_evaluationLabel];
           
           
    for (int i = 0 ; i < AppraisaimgArry.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(66+i%3*(Width-105)/3+i%3*11, (66+fair_evaluationLabel.ViewHeight+15)+i/3*(Width-105)/3+i/3*11, (Width-105)/3, (Width-105)/3)];
        image.userInteractionEnabled = YES;
        image.image = [UIImage imageNamed:AppraisaimgArry[i]];
        [cell addSubview:image];
           }
        
        
        UIButton *replybutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [replybutton setTitle:@" 回复" forState:UIControlStateNormal];
        [replybutton setTitleColor:UIColorFromRGB(0xa8a8a8) forState:UIControlStateNormal];
        [replybutton setImage:[UIImage imageNamed:@"icon_reply"] forState:UIControlStateNormal];
        replybutton.titleLabel.textAlignment = NSTextAlignmentLeft;
        replybutton.titleLabel.font = [UIFont systemFontOfSize:11];
//        [replybutton addTarget:self action:@selector(replybuttonCilk:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:replybutton];
        replybutton.sd_layout.widthIs(43).heightIs(15).topSpaceToView(cell,fair_evaluationLabel.ViewHeight+85.00+(AppraisaimgArry.count+2)/3*(Width-105)/3+(AppraisaimgArry.count+2)/3*11.00).rightSpaceToView(cell,8);
        
        
        
        
        UIImage *img =[UIImage imageNamed:@"bg_reply"];
        UIImageView *replyImageView = [[UIImageView alloc] initWithImage:[img stretchableImageWithLeftCapWidth:floorf(img.size.width-32) topCapHeight:floorf(img.size.height)]];
        replyImageView.tag = 123;
        
        [cell addSubview:replyImageView];
        
        UILabel *Shopkeeperlab = [UILabel new];
        Shopkeeperlab.text =@"掌柜：";
        Shopkeeperlab.textAlignment = NSTextAlignmentCenter;
        Shopkeeperlab.textColor =UIColorFromRGB(0x606060);
        Shopkeeperlab.font = [UIFont systemFontOfSize:12];
        [replyImageView addSubview:Shopkeeperlab];
        Shopkeeperlab.sd_layout.widthIs(40).heightIs(15).topSpaceToView(replyImageView,13).leftSpaceToView(replyImageView,15);
        
        UILabel *lab = [UILabel new];
        lab.text =@"谢谢亲的赞美~~";
        lab.textAlignment = NSTextAlignmentLeft;
        lab.textColor =UIColorFromRGB(0x606060);
        lab.font = [UIFont systemFontOfSize:12];
        lab.frame = CGRectMake(Shopkeeperlab.ViewWidth+15, 13, Width-96-Shopkeeperlab.ViewWidth, 15);
        lab.numberOfLines = 0;
        [lab sizeToFit];
        [replyImageView addSubview:lab];
       
        
        
        replyImageView.sd_layout.leftSpaceToView(cell,66).rightSpaceToView(cell,15).topSpaceToView(cell,fair_evaluationLabel.ViewHeight+71+(AppraisaimgArry.count+2)/3*(Width-105)/3+(AppraisaimgArry.count+2)/3*11+15+replybutton.ViewHeight).heightIs(lab.ViewHeight+20);
        
        cellHeightfloat =fair_evaluationLabel.ViewHeight+94.00+(AppraisaimgArry.count+2)/3*(Width-105)/3+(AppraisaimgArry.count+2)/3*11.00+replyImageView.ViewHeight;
        
        
        UIView *view = [UIView new];
        view.backgroundColor =UIColorFromRGB(0xdbdbdb);
        view.frame = CGRectMake(15, cellHeightfloat+19, Width-30, .5);
        [cell addSubview:view];
          }
    }
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        cell.backgroundColor = UIColorFromRGB(0xffffff);
        return cell;
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
-(void)headBtn:(UIButton *)headBtn{
    NSLog(@" 个人头像 ");
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
