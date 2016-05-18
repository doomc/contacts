//
//  Person.h
//  demo
//
//  Created by 熊维东 on 16/5/16.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,copy)NSString * name ;
@property(nonatomic,copy)NSString * age ;
@property(nonatomic,copy)NSString * address ;
@property(nonatomic,copy)NSString * sex ;
@property(nonatomic,copy)NSString * phoneNumber;


-(Person*)initWithName:(NSString*)name Age:(NSString*)age Address :(NSString*)address Sex :(NSString *)sex PhoneNumber:(NSString*)phoneNumber;

-(NSString*)getName;
-(NSString*)getPhoneNumber;


+(Person*)initWithName:(NSString*)name Age:(NSString*)age Address :(NSString*)address Sex :(NSString *)sex PhoneNumber:(NSString*)phoneNumber;


@end
