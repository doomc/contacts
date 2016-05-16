//
//  Table_ViewController.m
//  demo
//
//  Created by 熊维东 on 16/5/16.
//  Copyright © 2016年 熊维东. All rights reserved.
//
#define KscreenWidth [[UIScreen mainScreen]bounds].size.width
#define KscreenHeight [[UIScreen mainScreen]bounds].size.height

#import "Table_ViewController.h"
#import "Person.h"
#import "KkPersonContact.h"
@interface Table_ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
    NSMutableArray* _contacts;
    
}

@end

@implementation Table_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    
    UIBarButtonItem  * rightBt = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editing)];
    
    rightBt.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem =rightBt;
    
    
    self.view.backgroundColor=  [UIColor whiteColor];
    
    _tableView =[[ UITableView alloc]initWithFrame:CGRectMake(0, 0,KscreenWidth , KscreenHeight) style:UITableViewStyleGrouped];
    [self.view addSubview: _tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // Do any additional setup after loading the view.
}
#pragma mark  -初始化数据
-(void)initData
{
    _contacts = [[NSMutableArray alloc]init];
    Person * p1= [[Person alloc]initWithName:@"dd" Age:@"24" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"13628313117"];
    Person * p2= [[Person alloc]initWithName:@"美美" Age:@"22" Address:@"重庆市渝中区上大。。。" Sex:@"女" PhoneNumber:@"15285250022"];
    Person * p3= [[Person alloc]initWithName:@"菲菲" Age:@"25" Address:@"重庆市渝中区上大。。。" Sex:@"女" PhoneNumber:@"15285250022"];
    Person * p4= [[Person alloc]initWithName:@"妞妞" Age:@"21" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"15285250022"];
    Person * p5= [[Person alloc]initWithName:@"月月" Age:@"16" Address:@"重庆市渝中区上大。。。" Sex:@"女" PhoneNumber:@"15285250022"];
    Person * p6= [[Person alloc]initWithName:@"旭旭" Age:@"18" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"15285250022"];
    Person * p7= [[Person alloc]initWithName:@"sb帅" Age:@"23" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"15285250022"];
  
    KkPersonContact *  perContacts1 =[[KkPersonContact alloc]initWithName:@"组1" DetailText:@"亲戚" contacts:[NSMutableArray arrayWithObjects:p1,p2,p3, nil]];
    KkPersonContact * perContacts2 = [[KkPersonContact alloc]initWithName:@"组2" DetailText:@"朋友" contacts: [NSMutableArray arrayWithObjects:p4,p7, nil]];
    KkPersonContact * perContacts3 = [[KkPersonContact alloc]initWithName:@"组3" DetailText:@"陌生人" contacts: [NSMutableArray arrayWithObjects:p5,p6, nil]];
   
    [_contacts addObject:perContacts1];
    [_contacts addObject:perContacts2];
    [_contacts addObject:perContacts3];
    
    
}
-(void)editing
{
    NSLog(@"编辑 删除 / 添加");
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _contacts.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    KkPersonContact * group = _contacts[section];
    return group.contacts.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    KkPersonContact * group = _contacts[indexPath.section];
    Person * person = group.contacts[indexPath.row];
    
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
   
    NSString * text = [NSString stringWithFormat:@"%@   %@", [person getName],[person getPhoneNumber]];
    
    cell.textLabel.text  = text;
   // cell.detailTextLabel.text = ;
    cell.imageView.image =[UIImage imageNamed:@"icon.png"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return  cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSLog(@"生成组（组%li）名称",section);
    KkPersonContact *group=_contacts[section];
    return group.name;
}
#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%li）详情",section);
    KkPersonContact *group=_contacts[section];
    return group.detailText;
}
#pragma mark 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    NSMutableArray *indexs=[[NSMutableArray alloc]init];
    for(KkPersonContact *group in _contacts){
        [indexs addObject:group.name];
    }
    return indexs;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"section  = %ld ， row = %ld ",indexPath.section ,indexPath.row);
    
}




@end
