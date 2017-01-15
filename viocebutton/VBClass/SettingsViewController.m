//
//  SettingsViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/15.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "ZZNUIManager.h"
#define kUIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SettingsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *settingsTableView;
@property (nonatomic,strong)NSArray *dataSouce;
@end

@implementation SettingsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}
- (void)initUI
{
    UIImageView *navImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Kaki button - Button BG .jpg"]];
    navImageView.userInteractionEnabled = YES;
    navImageView.frame = CGRectMake(0, 20, kUIScreenWidth, 60);
    [self.view addSubview:navImageView];
    
    
    UILabel *settingsLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 80,kUIScreenWidth , 40)];
    settingsLable.text = @"Settings";
    settingsLable.textAlignment = NSTextAlignmentCenter;
    settingsLable.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    [self.view addSubview:settingsLable];
    
    self.settingsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, settingsLable.frame.size.height+settingsLable.frame.origin.y, kUIScreenWidth, kUIScreenHeight-settingsLable.frame.size.height+settingsLable.frame.origin.y-49) style:UITableViewStylePlain];
    self.settingsTableView.delegate = self;
    self.settingsTableView.dataSource = self;
    
    [self.settingsTableView registerNib:[UINib nibWithNibName:@"SettingsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SettingsTableViewCell"];
    [self.view addSubview:self.settingsTableView];
    
    
    self.dataSouce = @[@"Personal info",@"Add new button",@"Share button",@"Help",@"Contact",@"Bill & payment",@"About Kaki"];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"];
    
    cell.Label_title.text = self.dataSouce[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showAlertIndictorWithMessage:kTips withDelay:2];
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
