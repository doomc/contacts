//
//  KkPersonContact.h
//  demo
//
//  Created by 熊维东 on 16/5/16.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "Person.h"
#import <Foundation/Foundation.h>
@interface KkPersonContact : NSObject


@property(nonatomic,copy)NSString *name ; //组名
@property(nonatomic,copy)NSString * detailText ;//分组描述
@property (nonatomic,strong)NSMutableArray *contacts;



-(KkPersonContact*)initWithName :(NSString * )name DetailText:(NSString*)detailText contacts :(NSMutableArray*)contacts;

+(KkPersonContact*)initWithName :(NSString * )name DetailText:(NSString*)detailText contacts :(NSMutableArray*)contacts;



@end
