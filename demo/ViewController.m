//
//  ViewController.m
//  demo
//
//  Created by 熊维东 on 16/5/16.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "ViewController.h"
#import "Table_ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame= CGRectMake(100, 100, 200, 200);

    [button addTarget:self action:@selector(didcLick) forControlEvents:UIControlEventTouchUpInside];

    [button setTitle:@"下一页" forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:button];
    
    
}
-(void)didcLick
{
    
    Table_ViewController * tabVC  =[[ Table_ViewController alloc]init];
    
    [self.navigationController pushViewController:tabVC animated:YES];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
