//
//  KkPersonContact.m
//  demo
//
//  Created by 熊维东 on 16/5/16.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "KkPersonContact.h"

@implementation KkPersonContact

-(KkPersonContact*)initWithName :(NSString * )name DetailText:(NSString*)detailText contacts :(NSMutableArray*)contacts
{
    if (self =[super init]) {
        self.name = name;
        self.detailText = detailText;
        self.contacts = contacts;
        
        
    }
    return self;
    
}

+(KkPersonContact*)initWithName :(NSString * )name DetailText:(NSString*)detailText contacts :(NSMutableArray*)contacts
{
    KkPersonContact * kkcontacts  = [[KkPersonContact alloc]initWithName:name DetailText:detailText  contacts:contacts];
    
    return kkcontacts;
    
}
@end
