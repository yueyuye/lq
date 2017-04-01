


#import "ServiceVC.h"
#import "IQKeyboardManager.h"
#import "IQKeyboardReturnKeyHandler.h"
@interface ServiceVC ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
     UILabel *bubbleText;
     
     NSArray *arry;
     
     UITextField *field;
     
     UIToolbar *toobview;
     
     UIButton *smiliesbtn;
     
     UITableView *tableview;
}
@end

@implementation ServiceVC

- (void)viewDidLoad
{
    [super viewDidLoad];
     
     
    [self setNavigationBar:@"彭老板的店"];
    [self addBackButton];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"weixin",@"name",@"您好，请问有什么可以帮您。请问有什么可以帮您？",@"content", nil];

    _resultArray = [NSMutableArray arrayWithObjects:dict, nil];
     
     arry = @[@"icon_face",@"icon_add_more"];

    tableview = [UITableView new];
    tableview.delegate = self;
    tableview.dataSource =self;
    tableview.separatorStyle = NO;
    tableview.backgroundColor = UIColorFromRGB(0xf6f6f6);
   [self.view addSubview:tableview];
    
    tableview.sd_layout.topSpaceToView(self.view,64).leftSpaceToView(self.view,0).widthIs(Width).heightIs(Height-120);
    [self toolbar];
    [self Recognizer];
     
}
-(void)toolbar{
     
    
     
     toobview = [UIToolbar new];
     [self.view addSubview:toobview];
     toobview.sd_layout.bottomSpaceToView(self.view,0).leftSpaceToView(self.view,0).widthIs(Width).heightIs(56);

    UIButton *phonebtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [phonebtn setImage:[UIImage imageNamed:@"icon_voice"] forState:UIControlStateNormal];
     phonebtn.clipsToBounds = YES;
     phonebtn.layer.cornerRadius = 15;
     [toobview addSubview:phonebtn];
     phonebtn.sd_layout.topSpaceToView(toobview,15).leftSpaceToView(toobview,15).widthIs(30).heightIs(30);
     
     
     for (int k =0; k < 2; k++) {
         smiliesbtn = [UIButton buttonWithType:UIButtonTypeCustom];
         smiliesbtn.clipsToBounds = YES;
         smiliesbtn.layer.cornerRadius = 15;
          smiliesbtn.frame = CGRectMake((Width-85)+k*40, 15, 30, 30);
          [smiliesbtn setImage:[UIImage imageNamed:arry[k]] forState:UIControlStateNormal];
         [toobview addSubview:smiliesbtn];
          
     }
     
     field = [UITextField new];
     field.delegate =self;
     field.clearButtonMode = UITextFieldViewModeAlways;
     field.returnKeyType = UIReturnKeyNext;
     [field setBorderStyle:UITextBorderStyleRoundedRect];
     [toobview addSubview:field];
     
    
     field.sd_layout.leftSpaceToView(toobview,55).topSpaceToView(toobview,10).widthIs(Width-150).heightIs(37);
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
   
}

#pragma mark -- 根据表的偏移启动和关闭field
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
     if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height + 40 ||scrollView.contentSize.height < scrollView.frame.size.height) {
          [field becomeFirstResponder];
     }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView  {
     
     [field resignFirstResponder];
}


#pragma mark --气泡大小


- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf withPosition:(int)position{
    
    //计算大小
    UIFont *font = [UIFont systemFontOfSize:15];
	CGSize size =[text sizeWithFont:font constrainedToSize:CGSizeMake(0.56*Width, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];

     
    
	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
	
	
    //背影图片
	
   UIImage *img =[UIImage imageNamed: fromSelf?@"bg_services_green":@"bg_services_white"];
   UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[img stretchableImageWithLeftCapWidth:floorf(img.size.width-15) topCapHeight:floorf(img.size.height-5)]];

    //添加文本信息
	bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(fromSelf?15.0f:20.0f, 25.0f, size.width+5, size.height+10)];
	bubbleText.font = font;
	bubbleText.numberOfLines = 0;
	bubbleText.lineBreakMode = NSLineBreakByWordWrapping;
	bubbleText.text = text;

    
	if(fromSelf)
		returnView.frame = CGRectMake(Width-position-(bubbleText.frame.size.width+30.0f), 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
     
	else
		returnView.frame = CGRectMake(position, 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
	[returnView addSubview:bubbleImageView];
	[returnView addSubview:bubbleText];
    
    bubbleImageView.frame = CGRectMake(0.0f, 14.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+20.0f);
    
    return returnView;
}


#pragma mark --气泡语音


- (UIView *)yuyinView:(NSInteger)logntime from:(BOOL)fromSelf withIndexRow:(NSInteger)indexRow  withPosition:(int)position{
    
    //根据语音长度
    int yuyinwidth = 66+fromSelf;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = indexRow;
    if(fromSelf)
		button.frame =CGRectMake(Width-position-yuyinwidth+10, 15, yuyinwidth, 54);
	else
		button.frame =CGRectMake(position, 15, yuyinwidth, 54);
    
//    image偏移量
    UIEdgeInsets imageInsert;
    imageInsert.top = -10;
    imageInsert.left = fromSelf?button.frame.size.width/3:-button.frame.size.width/3;
    button.imageEdgeInsets = imageInsert;
    
    [button setImage:[UIImage imageNamed:fromSelf?@"SenderVoiceNodePlaying":@"ReceiverVoiceNodePlaying"] forState:UIControlStateNormal];
    UIImage *backgroundImage = [UIImage imageNamed:fromSelf?@"SenderVoiceNodeDownloading":@"ReceiverVoiceNodeDownloading"];
    backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:20 topCapHeight:0];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(fromSelf?-30:button.frame.size.width, 0, 30, button.frame.size.height)];
    label.text = [NSString stringWithFormat:@"%ld''",(long)logntime];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [button addSubview:label];
    
    return button;
}

#pragma mark --UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resultArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [_resultArray objectAtIndex:indexPath.row];
    UIFont *font = [UIFont systemFontOfSize:14];
	CGSize size = [[dict objectForKey:@"content"] sizeWithFont:font constrainedToSize:CGSizeMake(0.56*Width, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height+60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{
        for (UIView *cellView in cell.subviews){
            [cellView removeFromSuperview];
        }
    }
    
    NSDictionary *dict = [_resultArray objectAtIndex:indexPath.row];
    
    //创建头像
    UIImageView *photo ;
    if ([[dict objectForKey:@"name"]isEqualToString:@"rhl"]) {
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(Width-60, 10, 50, 50)];
        [cell addSubview:photo];
        photo.image = [UIImage imageNamed:@"head"];
        photo.layer.cornerRadius = 25;
        photo.clipsToBounds = YES;
        if ([[dict objectForKey:@"content"] isEqualToString:@"0"]) {
            [cell addSubview:[self yuyinView:1 from:YES withIndexRow:indexPath.row withPosition:65]];
            
            
        }else{
            [cell addSubview:[self bubbleView:[dict objectForKey:@"content"] from:YES withPosition:65]];
            bubbleText.textColor = UIColorFromRGB(0xffffff);
        }
        
    }else{
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        [cell addSubview:photo];
        photo.image = [UIImage imageNamed:@"head"];
        photo.layer.cornerRadius = 25;
        photo.clipsToBounds = YES;
        if ([[dict objectForKey:@"content"] isEqualToString:@"0"]) {
            [cell addSubview:[self yuyinView:1 from:NO withIndexRow:indexPath.row withPosition:65]];
        
        }else{
            [cell addSubview:[self bubbleView:[dict objectForKey:@"content"] from:NO withPosition:65]];
            bubbleText.textColor = UIColorFromRGB(0x222222);
             
        }
    }
    cell.backgroundColor = UIColorFromRGB(0xf6f6f6);
    return cell;
    
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
     if (field.text.length == 0) {
          return 0;
     }
     NSString *speaker = _orSelf?@"weixin":@"rhl";
     [_resultArray addObject:@{@"name":speaker,@"content":field.text}];
     _orSelf = !_orSelf;
     [tableview reloadData];
     field.text = @"";
     [field resignFirstResponder];
     
     
     return NO;
}



@end
