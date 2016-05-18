//
//  KCStatusTableViewCell.h
//  demo
//
//  Created by 熊维东 on 16/5/18.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KKstuaus;
@interface KCStatusTableViewCell : UITableViewCell

#pragma mark 微博对象
@property (nonatomic,strong) KKstuaus *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;







@end
