//
//  Search_Historycell.h
//  Beautiful
//


#import <UIKit/UIKit.h>
typedef void (^BtnBlock)(NSInteger index);
@interface Search_Historycell : UITableViewCell

@property (nonatomic,copy) BtnBlock btnBlock;

-(void) btnClickBlock:(BtnBlock) btnBlock;

-(instancetype) initWithFrame:(CGRect)frame dataArr:(NSArray *)array;

@end
