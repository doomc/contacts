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
#import "KCStatusTableViewCell.h"

@interface Table_ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UITableView * _tableView;
    NSMutableArray* _contacts;
    NSIndexPath * _selectIndexPath;
    NSMutableArray *_statusCells;//存储cell，用于计算高度
    UIToolbar * _toolbar;
    
    UISearchBar *_searchBar;//搜索框
    NSMutableArray * _searchContact ;//搜索模型
    

}
@property (nonatomic,assign)BOOL isSelect ;//选择添加/删除
@property (nonatomic,assign)BOOL isSearching;//搜索

@end
@implementation Table_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self addToolbar];//添加bar
    
    self.view.backgroundColor=  [UIColor whiteColor];
    _tableView =[[ UITableView alloc]initWithFrame:CGRectMake(0, 64,KscreenWidth , KscreenHeight) style:UITableViewStyleGrouped];
    [self.view addSubview: _tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    //添加搜索框
    [self addSearchBar];

    
}
#pragma mark  -初始化数据
-(void)initData
{
    _contacts = [[NSMutableArray alloc]init];
    Person * p1= [[Person alloc]initWithName:@"dd" Age:@"24" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"13628313117"];
    Person * p2= [[Person alloc]initWithName:@"MM" Age:@"22" Address:@"重庆市渝中区上大。。。" Sex:@"女" PhoneNumber:@"23441424212"];
    Person * p3= [[Person alloc]initWithName:@"FF" Age:@"25" Address:@"重庆市渝中区上大。。。" Sex:@"女" PhoneNumber:@"023-68281923"];
    Person * p4= [[Person alloc]initWithName:@"NN" Age:@"21" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"68281923"];
    Person * p5= [[Person alloc]initWithName:@"YY" Age:@"16" Address:@"重庆市渝中区上大。。。" Sex:@"女" PhoneNumber:@"68281924"];
    Person * p6= [[Person alloc]initWithName:@"xx" Age:@"18" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"68281925"];
    Person * p7= [[Person alloc]initWithName:@"sb帅" Age:@"23" Address:@"重庆市渝中区上大。。。" Sex:@"男" PhoneNumber:@"15285250022"];
  
    KkPersonContact *  perContacts1 =[[KkPersonContact alloc]initWithName:@"组1" DetailText:@"亲戚" contacts:[NSMutableArray arrayWithObjects:p1,p2,p3, nil]];
    KkPersonContact * perContacts2 = [[KkPersonContact alloc]initWithName:@"组2" DetailText:@"朋友" contacts: [NSMutableArray arrayWithObjects:p4,p7, nil]];
    KkPersonContact * perContacts3 = [[KkPersonContact alloc]initWithName:@"组3" DetailText:@"陌生人" contacts: [NSMutableArray arrayWithObjects:p5,p6, nil]];
   
    [_contacts addObject:perContacts1];
    [_contacts addObject:perContacts2];
    [_contacts addObject:perContacts3];
    
    
}

#pragma mark - 添加搜索框
-(void) addSearchBar
{
    CGRect searchBarRect=CGRectMake(0, 0, self.view.frame.size.width, 60);
    _searchBar=[[UISearchBar alloc]initWithFrame:searchBarRect];
    _searchBar.placeholder=@"Please input key word...";
    
    //_searchBar.keyboardType=UIKeyboardTypeAlphabet;//键盘类型
    //_searchBar.autocorrectionType=UITextAutocorrectionTypeNo;//自动纠错类型
    //_searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;//哪一次shitf被自动按下
    _searchBar.showsCancelButton=YES;//显示取消按钮
    //添加搜索框到页眉位置
    _searchBar.delegate=self;
    _tableView.tableHeaderView=_searchBar;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_isSearching ) {
        return 1;
        
    }
    return _contacts.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isSearching) {
        return _searchContact.count;//模型的个数
    }
    KkPersonContact * group = _contacts[section];
    return group.contacts.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *contact=nil;
    if (_isSearching) {
        contact=_searchContact[indexPath.row];
    }else{
        KkPersonContact * group = _contacts[indexPath.section];
        contact = group.contacts[indexPath.row];
        
    }

    /**
     *  静态提高性能
     */
    static NSString * identitifer = @"cell";
    
    
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identitifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identitifer];
        
    }
    cell.textLabel.text  = [contact getName];
    cell.detailTextLabel.text = [contact getPhoneNumber];
    cell.imageView.image =[UIImage imageNamed:@"icon.png"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return  cell;
    
}
#pragma mark - 搜索框代理
#pragma mark  取消搜索
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    _isSearching=NO;
    _searchBar.text=@"";
    [_tableView reloadData];
}

#pragma mark 输入搜索关键字
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if([_searchBar.text isEqual:@""]){
        _isSearching=NO;
        [_tableView reloadData];
        return;
    }
    [self searchDataWithKeyWord:_searchBar.text];
}

#pragma mark 点击虚拟键盘上的搜索时
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [self searchDataWithKeyWord:_searchBar.text];
    
    [_searchBar resignFirstResponder];//放弃第一响应者对象，关闭虚拟键盘
}

#pragma mark 搜索形成新数据
-(void)searchDataWithKeyWord:(NSString *)keyWord{
    _isSearching=YES;
    _searchContact=[NSMutableArray array];
    [_contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        KkPersonContact *group=obj;
        [group.contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            Person *contact=obj;
            if ([contact.name.uppercaseString containsString:keyWord.uppercaseString]||[contact.age.uppercaseString containsString:keyWord.uppercaseString]||[contact.phoneNumber containsString:keyWord]) {
                [_searchContact addObject:contact];
            }
        }];
    }];
    
    //刷新表格
    [_tableView reloadData];
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
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSLog(@"生成组索引");
//    NSMutableArray *indexs=[[NSMutableArray alloc]init];
//    for(KkPersonContact *group in _contacts){
//        [indexs addObject:group.name];
//    }
//    return indexs;
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndexPath = indexPath;
    NSLog(@"section  = %ld ， row = %ld ",_selectIndexPath.section ,_selectIndexPath.row);
    
    
}



#pragma mark 添加工具栏
-(void)addToolbar{
    CGRect frame=self.view.frame;
    _toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 64)];
    _toolbar.backgroundColor=[UIColor colorWithHue:246/255.0 saturation:246/255.0 brightness:246/255.0 alpha:1];
    [self.view addSubview:_toolbar];
    UIBarButtonItem *removeButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    UIBarButtonItem *flexibleButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    NSArray *buttonArray=[NSArray arrayWithObjects:removeButton,flexibleButton,addButton, nil];
    _toolbar.items=buttonArray;
}
#pragma mark 删除
-(void)remove{
    _isSelect = NO;
    
    //直接通过下面的方法设置编辑状态没有动画
    //_tableView.editing=!_tableView.isEditing;
    
    [_tableView setEditing:!_tableView.isEditing animated:true];
}
#pragma mark - 添加操作
-(void)add
{
    _isSelect= YES;
    
    [_tableView setEditing:!_tableView.isEditing animated:true];
   
    NSLog(@"add  -- -- -- - ");
}

#pragma mark 取得当前操作状态，根据不同的状态左侧出现不同的操作按钮
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( _isSelect == YES) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
    
}
#pragma mark  -删除 / 添加操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    KkPersonContact * group =_contacts[indexPath.section];
    Person * contact = group.contacts[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [group.contacts removeObject:contact]; // 删除组中的一个模型
        //考虑到性能这里不建议使用reloadData
        //[tableView reloadData];
        //使用下面的方法既可以局部刷新又有动画效果
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom ];
        //如果当前组中没有数据则移除组刷新整个表格
        if (group.contacts.count==0) {
            [_contacts removeObject:group];
            [tableView reloadData];
        }
    
    }
    else if(editingStyle==UITableViewCellEditingStyleInsert){
        Person *newContact=[[Person alloc]init];
        newContact.name=@"tony";
        newContact.age=@"age";
        newContact.phoneNumber=@"82821011";
        [group.contacts insertObject:newContact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];//注意这里没有使用reladData刷新
    }
    
}


#pragma mark 排序
//只要实现这个方法在编辑状态右侧就有排序图标
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    KkPersonContact *sourceGroup =_contacts[sourceIndexPath.section];
    Person *sourceContact=sourceGroup.contacts[sourceIndexPath.row];
    KkPersonContact *destinationGroup =_contacts[destinationIndexPath.section];
    
    [sourceGroup.contacts removeObject:sourceContact];
    if(sourceGroup.contacts.count==0){
        [_contacts removeObject:sourceGroup];
        [tableView reloadData];
    }
    
    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
    
}
#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
