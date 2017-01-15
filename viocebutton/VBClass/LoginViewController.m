//
//  LoginViewController.m
//  viocebutton
//
//  Created by 姜森 on 17/1/8.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "LoginViewController.h"
#import "ZZNUIManager.h"
#import "UIButton+UnderLine.h"
#import "RegisterViewController.h"
#import "ListViewController.h"
#import "VoiceTabBarViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *registerBtton;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtton;
@property (weak, nonatomic) IBOutlet UIButton *sigInBtoon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameBtnLayoutCountstraint;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    
    
}
- (void)initUI
{
    self.view.backgroundColor = VOICEBUTTON_MAIN_COLOR;
    [self.registerBtton underLineButtonWithString:@"Regsiter"];
    [self.forgetBtton underLineButtonWithString:@"forget password?"];
    self.sigInBtoon.layer.borderColor = [UIColor whiteColor].CGColor;
    
    //键盘监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)noti
{
    NSDictionary *dic = noti.userInfo;
    NSValue *keyBoardValue = [dic objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyBoardFrame = keyBoardValue.CGRectValue;
    
    NSInteger offset = self.sigInBtoon.frame.origin.y + self.sigInBtoon.frame.size.height - keyBoardFrame.origin.y;
    
    if (offset > 0) {
        self.view.frame = CGRectMake(0, -offset, self.view.frame.size.width, self.view.frame.size.height);
    }

}
- (void)keyboardWillHidden
{
    self.view.frame = self.view.bounds;
}

- (IBAction)signin:(id)sender {
   
    if ([[NSUserDefaults standardUserDefaults] valueForKey:self.name.text]&&[[NSUserDefaults standardUserDefaults] valueForKey:self.password.text]) {
        NSLog(@"有账号");
//        ListViewController *listVC = [[ListViewController alloc]init];
        VoiceTabBarViewController *tabbar = [VoiceTabBarViewController new];
        [self presentViewController:tabbar animated:YES completion:nil];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Account or password error" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Determine" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self.view endEditing:NO];
        }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }
    
    
    
}
- (IBAction)registerAction:(id)sender {
    RegisterViewController *registVC = [[RegisterViewController alloc]init];
    
    [self presentViewController:registVC animated:YES completion:nil];
    
}
- (IBAction)forgettacion:(id)sender {
    
    RegisterViewController *registVC = [[RegisterViewController alloc]init];
    
    [self presentViewController:registVC animated:YES completion:nil];
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
