//
//  ChatViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/8.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCell.h"
#import "ZZNUIManager.h"
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *ChatTableView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    
}
- (void)initUI
{
    self.ChatTableView.delegate =  self;
    self.ChatTableView.dataSource = self;
    self.ChatTableView.rowHeight = 100;
    [self.ChatTableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"chatCell"];
}
- (IBAction)backAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell"];
    UILongPressGestureRecognizer * longPressGesture =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(cellLongPress:)];
    
    longPressGesture.minimumPressDuration=1.5f;//设置长按时间
    [cell addGestureRecognizer:longPressGesture];
    
    return cell;
}
- (void)cellLongPress:(UILongPressGestureRecognizer *)longPressGesture
{
    if (longPressGesture.state==UIGestureRecognizerStateBegan) {
        //成为第一响应者，需重写该方法
        [self becomeFirstResponder];
        
        CGPoint location = [longPressGesture locationInView:self.ChatTableView];
        NSIndexPath * indexPath = [self.ChatTableView indexPathForRowAtPoint:location];
        //可以得到此时你点击的哪一行
        [self showAlertIndictorWithMessage:kTips withDelay:2];
        
        NSLog(@"在此添加你想要完成的功能%ld",indexPath.row);
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
