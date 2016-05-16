//
//  Person.m
//  demo
//
//  Created by 熊维东 on 16/5/16.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "Person.h"

@implementation Person


-(Person*)initWithName:(NSString*)name Age:(NSString*)age Address :(NSString*)address Sex :(NSString *)sex PhoneNumber:(NSString*)phoneNumber
{
    if (self = [super init]) {
        
        self.name = name;
        self.age = age;
        self.address = address;
        self.sex =  sex;
        self.phoneNumber = phoneNumber;
        
    }
    return self;
    
}

-(NSString*)getName
{
    NSString * nameStr = [NSString stringWithFormat:@"%@",self.name];
    
    return  nameStr;
    
    
}
-(NSString*)getPhoneNumber
{
    return [NSString stringWithFormat:@"%@",self.phoneNumber];
    
}

+(Person*)initWithName:(NSString*)name Age:(NSString*)age Address :(NSString*)address Sex :(NSString *)sex PhoneNumber:(NSString*)phoneNumber
{
    Person *person = [[Person alloc]initWithName:name Age:age Address:address Sex:sex PhoneNumber:phoneNumber];
    
    return person;
    
}

@end
