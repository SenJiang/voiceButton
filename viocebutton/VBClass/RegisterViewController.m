//
//  LoginViewController.h
//  viocebutton
//
//  Created by 姜森 on 17/1/8.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "RegisterViewController.h"
#import "ZZNUIManager.h"
#define kUIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height

@interface RegisterViewController ()
{
    UITextField *_phoneNumTf;//邮箱
    UITextField *_passWordTf;//密码
    UITextField *_checkPassWordTf;//确认密码
    UIButton *_registerBtn; //注册按钮
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationController.navigationBar.hidden = NO;
    [self initNavigation];
    [self initUI];
    
}

#pragma mark -- initNavigation
-(void)initNavigation
{
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
    [self.view setBackgroundColor:VOICEBUTTON_MAIN_COLOR];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth , 20)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIImageView *navImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Kaki button - Button BG .jpg"]];
    navImageView.userInteractionEnabled = YES;
    navImageView.frame = CGRectMake(0, 20, kUIScreenWidth, 60);
    [self.view addSubview:navImageView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 20, 30, 30);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [navImageView addSubview:backButton];
    
}

#pragma mark -- backClick

-(void)backAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- UI

-(void)initUI{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, kUIScreenWidth,1)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    _phoneNumTf = [[UITextField alloc]initWithFrame:CGRectMake(30, 160, kUIScreenWidth-60, 50)];
    _phoneNumTf.placeholder = @"Emaill address";
    _phoneNumTf.borderStyle = UITextBorderStyleNone;
    _phoneNumTf.backgroundColor = [UIColor whiteColor];
    _phoneNumTf.font = [UIFont systemFontOfSize:20.0];
    
    [self.view addSubview:_phoneNumTf];
    
    _passWordTf = [[UITextField alloc]initWithFrame:CGRectMake(30, 240, kUIScreenWidth-60, 50)];
    _passWordTf.placeholder = @"Password";
    _passWordTf.borderStyle = UITextBorderStyleNone;
    _passWordTf.secureTextEntry = YES;
    _passWordTf.backgroundColor = [UIColor whiteColor];
    _passWordTf.font = [UIFont systemFontOfSize:20.0];
    
    [self.view addSubview:_passWordTf];
    
    _checkPassWordTf = [[UITextField alloc]initWithFrame:CGRectMake(30, 330, kUIScreenWidth-60, 50)];
    _checkPassWordTf.placeholder = @"Confirm Password";
    _checkPassWordTf.secureTextEntry = YES;
    _checkPassWordTf.borderStyle = UITextBorderStyleNone;
    _checkPassWordTf.backgroundColor = [UIColor whiteColor];
    _checkPassWordTf.font = [UIFont systemFontOfSize:20.0];
    
    [self.view addSubview:_checkPassWordTf];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registerBtn.frame = CGRectMake(30, 420, kUIScreenWidth-60, 50);
    [registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [registerBtn setTitleColor:ZZN_UI_COLOR_BLACK forState:UIControlStateNormal];
    registerBtn.layer.borderWidth = 2;
    registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    registerBtn.backgroundColor = VOICEBUTTON_MAIN_COLOR;
    
    [registerBtn setTintColor:[UIColor whiteColor]];
    [registerBtn addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerBtn];
    _registerBtn = registerBtn;
    //键盘监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden) name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)keyboardWillShow:(NSNotification *)noti
{
    NSDictionary *dic = noti.userInfo;
    NSValue *keyBoardValue = [dic objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyBoardFrame = keyBoardValue.CGRectValue;
    
    NSInteger offset = _registerBtn.frame.origin.y + _registerBtn.frame.size.height - keyBoardFrame.origin.y;
    
    if (offset > 0) {
        self.view.frame = CGRectMake(0, -offset, self.view.frame.size.width, self.view.frame.size.height);
    }
    
}
- (void)keyboardWillHidden
{
    self.view.frame = self.view.bounds;
}

-(void)registerClick:(UIButton *)btn{
    
    [self.view endEditing:YES];
    
    if (([_phoneNumTf.text rangeOfString:@"@"].length >0) && [_passWordTf.text isEqualToString: _checkPassWordTf.text] &&_passWordTf.text.length>=6&&_checkPassWordTf.text.length>=6) {
        
        [[NSUserDefaults standardUserDefaults] setObject:_phoneNumTf.text forKey:_phoneNumTf.text];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults] setObject:_passWordTf.text forKey:_passWordTf.text];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self dismissViewControllerAnimated:YES completion:nil];

    }else{
       UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Error setting account or password" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Determine" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self.view endEditing:NO];
        }];

        [alertController addAction:okAction];
            
        [self presentViewController:alertController animated:YES completion:nil];

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
