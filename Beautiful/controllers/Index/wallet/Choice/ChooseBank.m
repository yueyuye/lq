//
//  ChooseBank.m
//  Beautiful
//
//  Created by pro on 17/3/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ChooseBank.h"
#import "SDAutoLayout.h"
#import "AddBank.h"
@interface ChooseBank ()<UITableViewDataSource,UITableViewDelegate>
{

    NSInteger current;
    
    NSString *labtext;
    
    NSString *tel;
}

@end

@implementation ChooseBank
-(void)viewWillAppear:(BOOL)animated{
 
    if (_arry != nil) {
       [_arrBank addObjectsFromArray:_arry];
        NSLog(@"zzzz %@",_arrBank);
        NSLog(@"count %ld",_arrBank.count);
        [_banktableview reloadData];
    }
   
    
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _arrBank = [NSMutableArray new];
    _arrBank = [NSMutableArray arrayWithObjects:@"中国建设银行",@"中国工商银行",@"中国农业银行",@"中国邮政银行",nil];
    _arry = [NSArray new];
    [self setNavigationBar:@"选择银行卡"];
    [self addBackButton];
    [self arrbank];
    
    [self turnPageUp];
   
    
    _banktableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, 200) style:UITableViewStylePlain];
    _banktableview.delegate = self;
    _banktableview.dataSource = self;
    _banktableview.rowHeight = 93;
    _banktableview.separatorStyle = NO;
    _banktableview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_banktableview];
//    if (_arrBank.count*93+64>Height) {
//        _banktableview.scrollEnabled = YES;
//    }else{
//        _banktableview.scrollEnabled = NO;
//    }
    
}

-(void)turnPageUp{
   
    
    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnAdd setImage:[UIImage imageNamed:@"icon_add"] forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(addBankID) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    btnAdd.sd_layout
    .rightSpaceToView(self.view,15)
    .topSpaceToView(self.view,32.5)
    .widthIs(16)
    .heightIs(16);
    
    
}


-(void)addBankID{
    AddBank *addbank = [[AddBank alloc]init];
    [self.navigationController pushViewController:addbank animated:YES];
}


- (void)arrbank{
    
    
    labtext = @"315 7899 8322 2321 234";
    tel= [labtext stringByReplacingCharactersInRange:NSMakeRange(3,12) withString:@" **** **** **** "];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrBank.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        UIView *view = [UIView new];
        view.backgroundColor =UIColorFromRGB(0xf6f6f6);
        [cell addSubview:view];
        view.sd_layout.widthIs(Width).heightIs(10).topSpaceToView(cell,0).leftSpaceToView(cell,0);
        
    UIImageView *imgIco = [[UIImageView alloc]init];
        imgIco.image = [UIImage imageNamed:@"header"];
        imgIco.frame =CGRectMake(15,34, 37, 37);
        [cell addSubview:imgIco];
    
    UILabel *labBank = [[UILabel alloc]init];
        labBank.text = _arrBank[indexPath.row];
        labBank.font = [UIFont systemFontOfSize:16];
        labBank.textAlignment = NSTextAlignmentLeft;
        labBank.textColor = UIColorFromRGB(0x222222);
        labBank.frame = CGRectMake(57, 34, 100, 16);
        [cell addSubview:labBank];
    
        
        
    UILabel *labID = [[UILabel alloc]init];
        labID.text =tel;
        labID.font = [UIFont systemFontOfSize:11];
        labID.frame = CGRectMake(65, 60, 188, 11);
        labID.textAlignment = NSTextAlignmentLeft;
        labID.textColor = UIColorFromRGB(0x7a7a7a);
        labID.tag = 333;
        [cell addSubview:labID];
        
    UIImageView *imgTurn;
        imgTurn = [[UIImageView alloc]init];
        imgTurn.image = [UIImage imageNamed:@"icon_choose_green"];
        imgTurn.frame = CGRectMake(Width-35, 42, 20, 20);
        imgTurn.tag =10+indexPath.row;
        imgTurn.hidden = YES;
        [cell addSubview:imgTurn];
    }
    cell.backgroundColor = UIColorFromRGB(0xffffff);
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    current=indexPath.row;
    [_banktableview reloadData];
}

#pragma mark -- 对cell打勾

- (UITableViewCellAccessoryType)tableView:(UITableView*)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath*)indexPath
{
    UILabel *idLab = (UILabel *)[_banktableview viewWithTag:333];
    UIImageView * img = (UIImageView *)[_banktableview viewWithTag:10+indexPath.row];
    if(current==indexPath.row)
    {   img.hidden = NO;
        idLab.text = labtext;
        return UITableViewCellAccessoryNone;
    }
    else
    {
        img.hidden = YES;
        idLab.text = tel;
        return UITableViewCellAccessoryNone;
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
