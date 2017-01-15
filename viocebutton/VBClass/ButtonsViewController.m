//
//  ButtonsViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/15.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "ButtonsViewController.h"
#import "ButtonsTableViewCell.h"
#import "ButtonsAddTableViewCell.h"
#import "AddNewGuideViewController.h"
#import "ZZNUIManager.h"

#define kUIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ButtonsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *buttonsTableView;
@end

@implementation ButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUi];
}
- (void)initUi
{
    UIImageView *navImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Kaki button - Button BG .jpg"]];
    navImageView.frame = CGRectMake(0, 20, kUIScreenWidth, 60);
    [self.view addSubview:navImageView];
    
    self.buttonsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, kUIScreenWidth, kUIScreenHeight-80-49) style:UITableViewStylePlain];
    [self.view addSubview:self.buttonsTableView];
    self.buttonsTableView.delegate = self;
    self.buttonsTableView.dataSource = self;
    self.buttonsTableView.rowHeight = 80;
    [self.buttonsTableView registerNib:[UINib nibWithNibName:@"ButtonsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ButtonsTableViewCell"];
    [self.buttonsTableView registerNib:[UINib nibWithNibName:@"ButtonsAddTableViewCell" bundle:nil] forCellReuseIdentifier:@"ButtonsAddTableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ButtonsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ButtonsTableViewCell"];

     ButtonsAddTableViewCell *addCell = [tableView dequeueReusableCellWithIdentifier:@"ButtonsAddTableViewCell"];
    
    cell.callback = ^(){
        [self showAlertIndictorWithMessage:kTips withDelay:2];
    };
    
    addCell.callBack = ^(){
        AddNewGuideViewController *newVC = [AddNewGuideViewController new];
        
        [self presentViewController:newVC animated:YES completion:nil];
    };
    
    
    if (indexPath.row == 2) {
        return addCell;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    addCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        AddNewGuideViewController *newVC = [AddNewGuideViewController new];
        
        [self presentViewController:newVC animated:YES completion:nil];
    }
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
