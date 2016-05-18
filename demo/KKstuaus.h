//
//  KKstuaus.h
//  demo
//
//  Created by 熊维东 on 16/5/18.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKstuaus : NSObject

@property (nonatomic,assign) long long Id;//微博id
@property (nonatomic,copy) NSString *profileImageUrl;//头像
@property (nonatomic,copy) NSString *userName;//发送用户
@property (nonatomic,copy) NSString *mbtype;//会员类型
@property (nonatomic,copy) NSString *createdAt;//创建时间
@property (nonatomic,copy) NSString *source;//设备来源
@property (nonatomic,copy) NSString *text;//微博内容


-(KKstuaus *)initWithAdictionary:(NSDictionary*)aDictionary;

+(KKstuaus *)StatusWithAdictionary:(NSDictionary*)aDictionary;
@end
