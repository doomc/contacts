//
//  KKstuaus.m
//  demo
//
//  Created by 熊维东 on 16/5/18.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "KKstuaus.h"

@implementation KKstuaus
-(KKstuaus *)initWithAdictionary:(NSDictionary*)aDictionary
{
    if (self =[super init]) {

        
        self.Id=[aDictionary[@"Id"] longLongValue];
        self.profileImageUrl=aDictionary[@"profileImageUrl"];
        self.userName=aDictionary[@"userName"];
        self.mbtype=aDictionary[@"mbtype"];
        self.createdAt=aDictionary[@"createdAt"];
        self.source=aDictionary[@"source"];
        self.text=aDictionary[@"text"];
    }
    return self;
    
}

+(KKstuaus *)StatusWithAdictionary:(NSDictionary*)aDictionary
{
    KKstuaus * status  =[[KKstuaus alloc]initWithAdictionary:aDictionary];
    return status;
    
}

-(NSString *)source{
    return [NSString stringWithFormat:@"来自 %@",_source];
}
@end
