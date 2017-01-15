//
//  ListViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/8.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"
#import "ChatViewController.h"
#import "VBBlueToothManager.h"
#import "ZZNUIManager.h"

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (nonatomic, strong)VBBlueToothManager *blueToothManager;//蓝牙

@property (nonatomic, strong)NSMutableArray *dataSource;//数据源
@end

@implementation ListViewController
- (NSMutableArray *)dataSource { return _dataSource ? _dataSource : (_dataSource = @[].mutableCopy); }

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialization];
}
#pragma mark - 初始化
- (void)initialization
{
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.rowHeight = 80;
    [self.listTableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"listCell"];
    
    
}
- (void)initializationWithBluTooth
{
    self.blueToothManager = [[VBBlueToothManager alloc]init];
//    self.blueToothManager.delegate = self;
//    [self.blueToothManager setup];
//    int ret = [self.blueToothManager findPeripherals];
//    if (!ret) {
//        NSLog(@"发现蓝牙");
//    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ChatViewController *chatVC = [[ChatViewController alloc]init];
        
        [self presentViewController:chatVC animated:YES completion:nil];
    }else{
        [self showAlertIndictorWithMessage:kTips withDelay:2];
    }
    
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        [self.dataArray removeObjectAtIndex:indexPath.row];
//        [self.listTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    //deleteRoWAction.backgroundColor = [UIColor blueColor]; 默认是红色的
    
    UITableViewRowAction *Callback = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Callback" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了Callback");
    }];
    Callback.backgroundColor = [UIColor greenColor];
    
    UITableViewRowAction *Forward = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Forward" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了Forward");
    }];
    Forward.backgroundColor = [UIColor grayColor];
    return @[deleteRoWAction,Forward,Callback];//返回RowAction 的数组
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
