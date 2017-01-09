//
//  LoginViewController.h
//  viocebutton
//
//  Created by 姜森 on 17/1/8.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "RegisterViewController.h"
#import "ZZNUIManager.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

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
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    

    [self.view setBackgroundColor:VOICEBUTTON_MAIN_COLOR];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.frame = CGRectMake(0, 5, 44, 44);
    
    [backBtn setImage:[UIImage imageNamed:@"Disclosure Indicator"] forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
//    [self.view addSubview:view];
}

#pragma mark -- backClick

-(void)backClick:(UIButton *)btn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- UI

-(void)initUI{
    
    UILabel *phoneNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 95, 60, 30)];
    phoneNumLabel.text = @"Email";
    phoneNumLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *passWordLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 170, 60, 30)];
    passWordLabel.text = @"password";
    passWordLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *checkPasswordLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 228, 60, 30)];
    checkPasswordLabel.text = @"confirm";
    checkPasswordLabel.font = [UIFont systemFontOfSize:13];
    
    [self.view addSubview:phoneNumLabel];
    [self.view addSubview:passWordLabel];
    [self.view addSubview:checkPasswordLabel];
    
    _phoneNumTf = [[UITextField alloc]initWithFrame:CGRectMake(70, 95, Width-80, 35)];
    _phoneNumTf.placeholder = @"Please enter your email address";
    _phoneNumTf.borderStyle = UITextBorderStyleRoundedRect;
    _phoneNumTf.backgroundColor = [UIColor whiteColor];
    _phoneNumTf.font = [UIFont systemFontOfSize:11.0];
    
    [self.view addSubview:_phoneNumTf];
    
    _passWordTf = [[UITextField alloc]initWithFrame:CGRectMake(70, 170, Width-80, 35)];
    _passWordTf.placeholder = @"Please enter a 6-12 bit password";
    _passWordTf.borderStyle = UITextBorderStyleRoundedRect;
    _passWordTf.backgroundColor = [UIColor whiteColor];
    _passWordTf.font = [UIFont systemFontOfSize:11.0];
    
    [self.view addSubview:_passWordTf];
    
    _checkPassWordTf = [[UITextField alloc]initWithFrame:CGRectMake(70, 225, Width-80, 35)];
    _checkPassWordTf.placeholder = @"Please enter your password again";
    _checkPassWordTf.borderStyle = UITextBorderStyleRoundedRect;
    _checkPassWordTf.backgroundColor = [UIColor whiteColor];
    _checkPassWordTf.font = [UIFont systemFontOfSize:11.0];
    
    [self.view addSubview:_checkPassWordTf];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registerBtn.frame = CGRectMake(50, 340, Width-100, 30);
    [registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [registerBtn setTitleColor:ZZN_UI_COLOR_WHITE forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = 5.0;
    registerBtn.layer.borderWidth = 1;
    registerBtn.layer.borderColor = [UIColor blackColor].CGColor;
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
