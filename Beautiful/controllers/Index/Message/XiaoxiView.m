//
//  XiaoxiView.m
//  xiupin
//
//  Created by mac on 17/2/20.
//  Copyright (c) 2017年 mac. All rights reserved.
//

#import "XiaoxiView.h"
#import "NeiRongVC.h"
@interface XiaoxiView ()<UITableViewDataSource,UITableViewDelegate>
{

    
    
    UITapGestureRecognizer *tapGesture;
    UITableView *xiaoxitableview;
  
    
    NSMutableArray *xiaoximuarry;
    NSMutableArray *shijianarry;
    NSMutableArray *neirongarry;
    NSMutableArray *imgarry;
    
    int count;
}

@end

@implementation XiaoxiView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self array];
    [self setNavigationBar:@"消息"];
    [self addBackButton];
    
    [self GestureRecognizer];
  
    [self tableview];
}
-(void)array{
    xiaoximuarry =[[NSMutableArray alloc]initWithObjects:@"系统消息",@"订单消息",@"缺货消息",@"缺货消息",nil];
    shijianarry =[[NSMutableArray alloc]initWithObjects:@"19:48",@"19:40",@"19:70",@"19:50",nil];
    neirongarry = [[NSMutableArray alloc]initWithObjects:@"内容消息内容消息内容消息内容消息内容消息内容消息",@"内容消息内容消息内容消息内容消息内容消息内容消息",@"内容消息内容消息内容消息内容消息内容消息内容消息",@"内容消息内容消息内容消息内容消息内容消息内容消息",nil];
    imgarry = [[NSMutableArray alloc]initWithObjects:@"icon_message_system",@"icon_message_nothing",@"icon_message_order",@"icon_message_order",nil];
}
-(void)tableview{
    xiaoxitableview =[[UITableView alloc]initWithFrame:CGRectMake(0,64, Width, xiaoximuarry.count*84-1) style:UITableViewStylePlain];
    xiaoxitableview.delegate =self;
    xiaoxitableview.dataSource =self;
    xiaoxitableview.rowHeight = 84;
    xiaoxitableview.backgroundColor = UIColorFromRGB(0xf6f6f6);
    xiaoxitableview.scrollEnabled = NO;
    [self.view addSubview:xiaoxitableview];
    
    
    
    

}


#pragma mark -- 表的方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return xiaoximuarry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   
    
       UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        UIView *xiaoxiview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 83)];
        [cell addSubview:xiaoxiview];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0,83 , Width,1)];
        vi.backgroundColor = UIColorFromRGB(0xa7a7a7);
        [xiaoxiview addSubview:vi];

    
       UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, 14, 56, 56)];
        img.image = [UIImage imageNamed:imgarry[indexPath.row]];
            [cell addSubview:img];
    
    
            UILabel *xitong = [[UILabel alloc]initWithFrame:CGRectMake(86, 20, 100, 20)];
            xitong.font = [UIFont systemFontOfSize:15];
            xitong.text = [xiaoximuarry objectAtIndex:indexPath.row];
            [cell addSubview:xitong];
    
    
    
            UILabel *neirong = [[UILabel alloc]initWithFrame:CGRectMake(86, 45,Width-100, 20)];
            neirong.font = [UIFont systemFontOfSize:12];
            neirong.textColor =UIColorFromRGB(0x828282);
            neirong.text = [neirongarry objectAtIndex:indexPath.row];
            [cell addSubview:neirong];
    
    
    
            UILabel *shijian = [[UILabel alloc]initWithFrame:CGRectMake(Width-48, 20,33, 20)];
    
            shijian.font = [UIFont systemFontOfSize:12];
            shijian.textColor =UIColorFromRGB(0x828282);
            shijian.text =[shijianarry objectAtIndex:indexPath.row];
            [cell addSubview:shijian];
       
        
    
        return cell;
    
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.editing ==NO) {
       
        
        NeiRongVC *nr =[[NeiRongVC alloc]init];
        [self.navigationController pushViewController:nr animated:YES];
        
    }
    else {
        NSLog(@"fafaafa");
    }
    
  
   
}




- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(void)GestureRecognizer{
   UISwipeGestureRecognizer *SwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeGesture:)];
    [self.view addGestureRecognizer:SwipeGesture];
    

}
-(void)SwipeGesture:(UITapGestureRecognizer*)Swipe{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//根据不同的editingstyle执行数据删除操作（点击左滑删除按钮的执行的方法）
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        [xiaoximuarry removeObjectAtIndex:indexPath.row];
        [shijianarry removeObjectAtIndex:indexPath.row];
        [neirongarry removeObjectAtIndex:indexPath.row];
        [imgarry removeObjectAtIndex:indexPath.row];
        xiaoxitableview.separatorStyle = NO;
        [xiaoxitableview reloadData];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

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
