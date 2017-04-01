//
//  Search_Historycell.m
//  Beautiful
//


#import "Search_Historycell.h"

@implementation Search_Historycell
-(instancetype) initWithFrame:(CGRect)frame dataArr:(NSArray *)array{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        for (int i = 0; i < array.count; i ++)
        {
            //        Area *are = cell_Array[i];
            
            NSString *name = array[i];
            static UIButton *recordBtn =nil;
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            
            CGRect rect = [name boundingRectWithSize:CGSizeMake(self.frame.size.width -20, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil];
            
            CGFloat BtnW = rect.size.width + 20;
            CGFloat BtnH = rect.size.height + 10;
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 5;
            if (i == 0)
            {
                btn.frame =CGRectMake(10, 10, BtnW, BtnH);
            }
            else{
                
                CGFloat yuWidth = self.frame.size.width - 20 -recordBtn.frame.origin.x -recordBtn.frame.size.width;
                
                if (yuWidth >= rect.size.width) {
                    
                    btn.frame =CGRectMake(recordBtn.frame.origin.x +recordBtn.frame.size.width + 10, recordBtn.frame.origin.y, BtnW, BtnH);
                }else{
                    
                    btn.frame =CGRectMake(10, recordBtn.frame.origin.y+recordBtn.frame.size.height+10, BtnW, BtnH);
                }
                
            }
            [btn setTitle:name forState:UIControlStateNormal];
            [self addSubview:btn];
            self.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20,CGRectGetMaxY(btn.frame)+10);
            recordBtn = btn;
            
            btn.tag = 100 + i;
            btn.layer.borderColor = UIColorFromRGB(0xeaeaea).CGColor;
            btn.layer.borderWidth =2;
            btn.backgroundColor = UIColorFromRGB(0xffffff);
            [btn setTitleColor:UIColorFromRGB(0x959595) forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    
    return self;
    
}

-(void) BtnClick:(UIButton *)sender{
    
    __weak typeof(self) weakSelf = self;
    
    if (weakSelf.btnBlock) {
        
        weakSelf.btnBlock(sender.tag);
    }
    
}

-(void) btnClickBlock:(BtnBlock)btnBlock{
    
    self.btnBlock = btnBlock;
    
}

@end
