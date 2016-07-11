//
//  ViewController.m
//  TextField抖动效果、toast提示语
//
//  Created by WOSHIPM on 16/7/8.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "ViewController.h"
#import "TBCityIconFont.h"
#import "UIImage+TBCityIconFont.h"
#import "MBProgressHUD+TVAssistant.h"
#import "AFViewShaker.h"
#import "LTView.h"

@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic, strong)LTView *userNameView;
@property(nonatomic, strong)LTView *pwdView;
@property(nonatomic, strong)AFViewShaker *shakeAccount;
@property(nonatomic, strong)AFViewShaker *shakePwd;
@property(nonatomic, strong)UIButton *loginButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadView{
    [super loadView];

    
    [self createUI];
    
    //    给userNameView添加抖动效果
    _shakeAccount = [[AFViewShaker alloc] initWithView:_userNameView];
    //    给pwdView添加抖动效果
    _shakePwd = [[AFViewShaker alloc] initWithView:_pwdView];

}

-(void)createUI{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"bj3"];
    [self.view addSubview:imageView];
    _userNameView = [[LTView alloc] initWithFrame:CGRectMake(45, 150, (self.view.frame.size.width -90), 49)];
    [self.view addSubview:_userNameView];
    _userNameView.iconImageView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e614", 30, [UIColor whiteColor])];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:15]};
    
    _userNameView.rightTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机/用户名/邮箱" attributes:dic];
    _userNameView.rightTextFiled.tintColor = [UIColor whiteColor];
    _userNameView.rightTextFiled.keyboardType = UIKeyboardTypeAlphabet;
    _userNameView.rightTextFiled.delegate = self;
    
 
    _pwdView = [[LTView alloc] initWithFrame:CGRectMake(45, _userNameView.frame.origin.y + _userNameView.frame.size.height, (self.view.frame.size.width -90), 49)];
    [self.view addSubview:_pwdView];
    
    _pwdView.iconImageView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e607", 30, [UIColor whiteColor])];
    
    
    NSDictionary *dic1 = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:15]};
    _pwdView.rightTextFiled.delegate = self;
    _pwdView.rightTextFiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:dic1];
    _pwdView.rightTextFiled.tintColor = [UIColor cyanColor];
    

    
    _pwdView.rightTextFiled.secureTextEntry = YES;
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginButton.frame = CGRectMake((self.view.frame.size.width - 230)/2, _pwdView.frame.origin.y + _pwdView.frame.size.height + 30 , _pwdView.frame.size.width, 40);
    _loginButton.layer.cornerRadius = 20;
    _loginButton.layer.borderWidth = .5;
    _loginButton.tag = 1002;
    [_loginButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    [self.view addSubview:_loginButton];
}

-(void)didClickButton:(UIButton *)button{
    if ([_userNameView.rightTextFiled.text isEqualToString:@"123"] && [_pwdView.rightTextFiled.text isEqualToString:@"123"]) {
        [_shakePwd shake];
        [_shakeAccount shake];
        
//        提示语在视图上显示的时间可以自己在类目中调整
        [MBProgressHUD showToastToView:self.view withText:@"用户名或密码错误"];
    }
   else if (_userNameView.rightTextFiled.text.length == 0  ) {

       //        当账号为空时，开始抖动，抖动成功后显示相应的提示语，shakeWithDuration的时间可以自己调，想要抖动效果慢一些的话就将值设得大一些，反之，则设得小一些
       
       [_shakeAccount shakeWithDuration:.7 completion:^{
             [MBProgressHUD showToastToView:self.view withText:@"用户名不能为空"];
        }];
       
        
        
    }else if (_pwdView.rightTextFiled.text.length == 0) {
        //        当密码为空时，开始抖动，并显示相应的提示语
        
        [_shakePwd shake];
        [MBProgressHUD showToastToView:self.view withText:@"密码不能为空"];
   
    }else{
        
//        登录成功后显示相应的提示语
        
        [MBProgressHUD showToastToView:self.view withText:@"登录成功"];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
