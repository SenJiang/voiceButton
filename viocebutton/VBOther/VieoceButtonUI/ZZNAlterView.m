//
//  ZZNAlterView.m
//  DeTuZZN
//
//  Created by WZ on 15/9/17.
//  Copyright © 2015年 DETU. All rights reserved.
//

#import "ZZNAlterView.h"
#import "ZZNUIManager.h"
// 设置警告框的长和宽

#define Alertwidth 219.0f
#define Alertheigth 110.0f
#define XWtitlegap 15.0f
#define XWtitleofheigth 25.0f
#define XWSinglebuttonWidth 160.0f
//        单个按钮时的宽度
#define XWdoublebuttonWidth 80.0f
//        双个按钮的宽度
#define ZZNbuttonHeigth 35.0f
//        按钮的高度
#define XWbuttonbttomgap 10.0f
//        设置按钮距离底部的边距


@interface ZZNAlterView ()
{
    BOOL _leftLeave;
}

@property (nonatomic, strong) UILabel *alertTitleLabel;
@property (nonatomic, strong) UILabel *alertContentLabel;
@property (nonatomic, strong) UIButton *leftbtn;
@property (nonatomic, strong) UIButton *rightbtn;
@property (nonatomic, strong) UIButton *thirdButton;
@property (nonatomic, strong) UIView *backimageView;
@property (nonatomic, assign) CGFloat alterHeight;

@end

@implementation ZZNAlterView



+ (CGFloat)alertWidth
{
    return Alertwidth;
}

+ (CGFloat)alertHeight
{
    return Alertheigth;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
+(ZZNAlterView*)showmessage:(NSString *)message subtitle:(NSString *)subtitle cancelbutton:(NSString *)cancle
{
    ZZNAlterView *alert = [[ZZNAlterView alloc] initWithTitle:message contentText:subtitle leftButtonTitle:nil rightButtonTitle:cancle leftBlock:nil rightBlock:nil];
    [alert show];
    alert.rightBlock = ^() {
    };
    alert.dismissBlock = ^() {
    };
    return alert;
}



- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
          leftBlock:(void(^)())leftBlock
         rightBlock:(void(^)())rightBlock

{
    if (self = [super init]) {
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.alpha = 0.95;
        self.backgroundColor = [UIColor whiteColor];
        self.alertTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 13.5, Alertwidth, 25)];
        self.alertTitleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.alertTitleLabel.textColor = ZZN_UI_BACK_COLOR;
        [self addSubview:self.alertTitleLabel];
        
        CGFloat contentLabelWidth = Alertwidth - 16-20;
        self.alertContentLabel = [[UILabel alloc] initWithFrame:CGRectMake((Alertwidth - contentLabelWidth) * 0.5, CGRectGetMaxY(self.alertTitleLabel.frame)-15, contentLabelWidth, 60)];
        self.alertContentLabel.numberOfLines = 0;
        self.alertContentLabel.textColor = ZZN_UI_BACK_COLOR;
        self.alertContentLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:self.alertContentLabel];
        //        设置对齐方式
        self.alertContentLabel.textAlignment = self.alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        
        CGRect leftbtnFrame;
        CGRect rightbtnFrame;
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 75, Alertwidth, 1)];
        line1.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:line1];
        
        if (!leftTitle) {
            rightbtnFrame = CGRectMake(0, 75, Alertwidth, ZZNbuttonHeigth);
            self.rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightbtn.frame = rightbtnFrame;
            
        }else {
            leftbtnFrame = CGRectMake(0, 75, Alertwidth * 0.5, ZZNbuttonHeigth);
            
            UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(Alertwidth*0.5, 75, 1, 35)];
            line2.backgroundColor = UIColorFromRGB(0xdddddd);
            [self addSubview:line2];
            
            rightbtnFrame = CGRectMake(Alertwidth * 0.5, 75, Alertwidth * 0.5, ZZNbuttonHeigth);
            self.leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.leftbtn.frame = leftbtnFrame;
            self.rightbtn.frame = rightbtnFrame;
        }
        

        [self.rightbtn setTitle:rigthTitle forState:UIControlStateNormal];
        [self.leftbtn setTitle:leftTitle forState:UIControlStateNormal];
        self.leftbtn.titleLabel.font = self.rightbtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.leftbtn setTitleColor:ZZN_UI_COLOR_BROWN forState:UIControlStateNormal];
        [self.rightbtn setTitleColor:ZZN_UI_COLOR_BROWN forState:UIControlStateNormal];
        [self.leftbtn addTarget:self action:@selector(leftbtnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightbtn addTarget:self action:@selector(rightbtnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftbtn];
        [self addSubview:self.rightbtn];
        self.alertTitleLabel.text = title;
        self.alertContentLabel.text = content;
        UIButton *xButton = [UIButton buttonWithType:UIButtonTypeCustom];
        xButton.frame = CGRectMake(Alertwidth - 25, 0, 25, 25);
        [self addSubview:xButton];
        self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        
        self.leftBlock = leftBlock;
        self.rightBlock = rightBlock;
        
        
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
  thirdButtonTittle:(NSString *)thirdTittle
          leftBlock:(void(^)())leftBlock
         rightBlock:(void(^)())rightBlock
         thirdBlock:(void(^)())thirdBlock

{
    if (self = [super init]) {
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.alpha = 0.95;
        self.backgroundColor = [UIColor whiteColor];
        self.alertTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 13.5, Alertwidth, 25)];
        self.alertTitleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.alertTitleLabel.textColor = UIColorFromRGB(0x444444);
        [self addSubview:self.alertTitleLabel];
        
        CGFloat contentLabelWidth = Alertwidth - 16-20;
        self.alertContentLabel = [[UILabel alloc] initWithFrame:CGRectMake((Alertwidth - contentLabelWidth) * 0.5, CGRectGetMaxY(self.alertTitleLabel.frame)-15, contentLabelWidth, 60)];
        self.alertContentLabel.numberOfLines = 0;
        self.alertContentLabel.textColor = UIColorFromRGB(0x444444);
        self.alertContentLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:self.alertContentLabel];
        //        设置对齐方式
        self.alertContentLabel.textAlignment = self.alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        
        CGRect leftbtnFrame;
        CGRect rightbtnFrame;
        CGRect thirdbtnFrame;
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 75, Alertwidth, 1)];
        line1.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:line1];
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 75+ZZNbuttonHeigth, Alertwidth, 1)];
        line2.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:line2];
        UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(0, 75+ZZNbuttonHeigth*2, Alertwidth, 1)];
        line3.backgroundColor = UIColorFromRGB(0xdddddd);
        [self addSubview:line3];
        
        
        if (!leftTitle) {
            rightbtnFrame = CGRectMake(0, 75, Alertwidth, ZZNbuttonHeigth);
            self.rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightbtn.frame = rightbtnFrame;
            
        }else {
            self.alterHeight =  Alertheigth + ZZNbuttonHeigth*2;
            leftbtnFrame = CGRectMake(0, 75, Alertwidth, ZZNbuttonHeigth);
            rightbtnFrame = CGRectMake(0, 75+ZZNbuttonHeigth, Alertwidth , ZZNbuttonHeigth);
            thirdbtnFrame = CGRectMake(0, 75+ZZNbuttonHeigth*2, Alertwidth, ZZNbuttonHeigth);
            self.leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.leftbtn.frame = leftbtnFrame;
            self.rightbtn.frame = rightbtnFrame;
            self.thirdButton.frame = thirdbtnFrame;
        }
        
        
        [self.rightbtn setTitle:rigthTitle forState:UIControlStateNormal];
        [self.leftbtn setTitle:leftTitle forState:UIControlStateNormal];
        [self.thirdButton setTitle:thirdTittle forState:UIControlStateNormal];
        self.leftbtn.titleLabel.font = self.rightbtn.titleLabel.font = self.thirdButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.leftbtn setTitleColor:ZZN_UI_COLOR_BROWN forState:UIControlStateNormal];
        [self.rightbtn setTitleColor:ZZN_UI_COLOR_BROWN forState:UIControlStateNormal];
        [self.thirdButton setTitleColor:ZZN_UI_COLOR_BROWN forState:UIControlStateNormal];
        [self.leftbtn addTarget:self action:@selector(leftbtnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightbtn addTarget:self action:@selector(rightbtnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.thirdButton addTarget:self action:@selector(setThirdBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftbtn];
        [self addSubview:self.rightbtn];
        [self addSubview:self.thirdButton];
        self.alertTitleLabel.text = title;
        self.alertContentLabel.text = content;
        UIButton *xButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [xButton setImage:[UIImage imageNamed:@"btn_close_normal.png"] forState:UIControlStateNormal];
        xButton.frame = CGRectMake(Alertwidth - 25, 0, 25, 25);
        [self addSubview:xButton];
        //        [xButton addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
        self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        
        self.leftBlock = leftBlock;
        self.rightBlock = rightBlock;
        self.thirdBlock = thirdBlock;
        
        
    }
    return self;
}



- (void)leftbtnclicked:(id)sender
{
    
    if (self.leftBlock) {
        self.leftBlock();
    }
    [self dismissAlert];
}

- (void)setThirdBtnClicked:(id)sender
{
    
    if (self.thirdBlock) {
        self.thirdBlock();
    }
    [self dismissAlert];
}
- (void)rightbtnclicked:(id)sender
{
    
    if (self.rightBlock) {
        self.rightBlock();
    }
    [self dismissAlert];
}
- (void)show
{   //获取第一响应视图视图
    UIViewController *topVC = [self appRootViewController];
    self.alterHeight = Alertheigth;
    self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - Alertwidth) * 0.5-30, (CGRectGetHeight(topVC.view.bounds) - Alertheigth) * 0.5-20, Alertwidth, self.alterHeight);
    self.alpha=0;
    [topVC.view addSubview:self];
}

- (void)showThree {
    //获取第一响应视图视图
    UIViewController *topVC = [self appRootViewController];
    self.alterHeight = Alertheigth + ZZNbuttonHeigth*2;
    self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - Alertwidth) * 0.5-30, (CGRectGetHeight(topVC.view.bounds) - Alertheigth) * 0.5-20, Alertwidth, self.alterHeight);
    self.alpha=0;
    [topVC.view addSubview:self];
}

- (void)dismissAlert
{
    [self removeFromSuperview2];
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}

- (UIViewController *)appRootViewController
{
    
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview2
{
    [self.backimageView removeFromSuperview];
    self.backimageView = nil;
    UIViewController *topVC = [self appRootViewController];
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - Alertwidth) * 0.5+30, (CGRectGetHeight(topVC.view.bounds) - Alertheigth) * 0.5-30, Alertwidth, self.alterHeight);
//    @weakify(self);
    [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        strongifyy
        self.frame = afterFrame;
        self.alpha=0;
    } completion:^(BOOL finished) {
//        strongifyy
        [self removeFromSuperview];
       
    }];
}
//添加新视图时调用（在一个子视图将要被添加到另一个视图的时候发送此消息）
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    //     获取根控制器
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backimageView) {
        self.backimageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backimageView.backgroundColor = [UIColor blackColor];
        self.backimageView.alpha = 0.2f;
        self.backimageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    //    加载背景背景图,防止重复点击
    [topVC.view addSubview:self.backimageView];
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - Alertwidth) * 0.5, (CGRectGetHeight(topVC.view.bounds) - Alertheigth) * 0.5, Alertwidth, self.alterHeight);
    [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = afterFrame;
        self.alpha=0.9;
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];
}


@end
