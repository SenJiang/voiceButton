//
//  VoiceTabBarViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/15.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "VoiceTabBarViewController.h"
#import "ListViewController.h"
#import "SettingsViewController.h"
#import "ButtonsViewController.h"

@interface VoiceTabBarViewController ()
@property (nonatomic,strong)UIImageView *bgView;
@end

@implementation VoiceTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabbarViewControllers];
}
- (void)setTabbarViewControllers
{
    ListViewController *listVC = [ListViewController new];
    ButtonsViewController *buttonsVC = [ButtonsViewController new];
    SettingsViewController *settingsVC = [SettingsViewController new];
    
    self.viewControllers = @[listVC ,buttonsVC ,settingsVC ];
    
    self.tabBar.translucent = NO;
    self.tabBar.hidden = YES;
    
    self.bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49)];
    //把交互打开
    self.bgView.userInteractionEnabled = YES;
//    self.bgView.image = [UIImage imageNamed:@"tabbar_bg@2x"];
    self.bgView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.bgView];
    
    NSArray *titles = @[@"Messages",@"Buttons",@"Settings"];
    CGFloat width = (self.view.frame.size.width/3);
    
    for (NSInteger i = 0; i<3; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

        btn.frame = CGRectMake(i*width, 0, width, 49);
        
        if (i==1) {
            btn.frame = btn.frame = CGRectMake(i*width+1, 0, width-2, 49);
        }
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"backgroudColor"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"backgroudColor"] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i==0) {
            btn.selected = YES;
        }
        
        btn.tag = 100+i;
        

        [self.bgView addSubview:btn];
        
        
    }

}

- (void)btnClick:(UIButton *)sender
{
   
    for (UIButton *btn in self.bgView.subviews) {
        btn.selected = NO;//全部这位不选中；
    }
    sender.selected = YES;
    
    self.selectedIndex = sender.tag-100;
    
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
