//
//  AddNewGuideViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/15.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "AddNewGuideViewController.h"

#define kUIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height
@interface AddNewGuideViewController ()
@property (nonatomic,strong)UIScrollView *guideScrollView;
@property (nonatomic,strong)UIButton *leftButton;
@property (nonatomic,strong)UIButton *finishButton;
@property (nonatomic,strong)UIButton *rightButton;

@end

@implementation AddNewGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initScrollView];
    [self initButton];
    
    
}
- (void)initUI
{
    UIImageView *navImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Kaki button - Button BG .jpg"]];
    navImageView.userInteractionEnabled = YES;
    navImageView.frame = CGRectMake(0, 20, kUIScreenWidth, 60);
    [self.view addSubview:navImageView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 10, 30, 30);
    [backButton setBackgroundImage:[UIImage imageNamed:@"backgroudColor"] forState:UIControlStateSelected];
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [navImageView addSubview:backButton];
    
    
    
}
- (void)initScrollView
{
    self.guideScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 81, kUIScreenWidth, kUIScreenHeight-80)];
    self.guideScrollView.pagingEnabled = YES;
    self.guideScrollView.showsVerticalScrollIndicator = FALSE;

    self.guideScrollView.contentSize = CGSizeMake(kUIScreenWidth*5, kUIScreenHeight-64);
    
    for (int i = 0; i < 5; i++) {
        UIImageView *scrollView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]]];
        scrollView.frame = CGRectMake(kUIScreenWidth*i, 0, kUIScreenWidth, kUIScreenHeight - kUIScreenHeight/3);
  
        [self.guideScrollView addSubview:scrollView];
        if (i == 1 || i == 3) {
            UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backgroudColor"]];
            backView.frame = CGRectMake(kUIScreenWidth*i, scrollView.frame.size.height+scrollView.frame.origin.y, kUIScreenWidth,kUIScreenHeight/3);
            [self.guideScrollView addSubview:backView];
        }
    }
    
    [self.view addSubview:self.guideScrollView];
}
- (void)initButton
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(40, kUIScreenHeight/3*2+50, 80, 40);
    [leftButton setTitle:@"Previous" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    self.leftButton = leftButton;
    self.leftButton.hidden = YES;
    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    finishButton.frame = CGRectMake(kUIScreenWidth/2-40, kUIScreenHeight/3*2+50, 80, 40);
    [finishButton setTitle:@"finish!" forState:UIControlStateNormal];
    [finishButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [finishButton setBackgroundImage:[UIImage imageNamed:@"buttonBackColor"] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(finishButtonAction) forControlEvents:UIControlEventTouchUpInside];
    finishButton.layer.cornerRadius = 20;
    finishButton.layer.masksToBounds = YES;
    [self.view addSubview:finishButton];
    self.finishButton = finishButton;
    self.finishButton.hidden = YES;
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(kUIScreenWidth-100, kUIScreenHeight/3*2+50, 60, 40);
    [rightButton setTitle:@"Next" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTintColor:[UIColor blueColor]];
    [self.view addSubview:rightButton];
    self.rightButton = rightButton;
}
- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)leftButtonAction
{
    int index = self.guideScrollView.contentOffset.x / kUIScreenWidth;
    
    if (index == 1) {
        self.leftButton.hidden = YES;
    }
    if (index !=4) {
        self.finishButton.hidden = YES;
    }
    [self.guideScrollView setContentOffset:CGPointMake(self.guideScrollView.contentOffset.x - kUIScreenWidth, 0) animated:YES];
}
- (void)finishButtonAction
{
    [self backAction];
}

- (void)rightButtonAction
{
    int index = self.guideScrollView.contentOffset.x / kUIScreenWidth;
    if (index >0 ||index == 0 ) {
        self.leftButton.hidden = NO;
    }
    if (index == 3){
        self.finishButton.hidden = NO;
        self.leftButton.hidden = YES;
        self.rightButton.hidden = YES;
    }
    
    if (index == 4) {
        return;
    }
   
    [self.guideScrollView setContentOffset:CGPointMake(self.guideScrollView.contentOffset.x + kUIScreenWidth, 0) animated:YES];
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
