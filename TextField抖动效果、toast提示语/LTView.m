//
//  LTView.m
//  TextField抖动效果、toast提示语
//
//  Created by WOSHIPM on 16/7/8.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "LTView.h"


@implementation LTView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建左侧imageView
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 15, 18)];
        
        [self addSubview:_iconImageView];
 
        
        //创建右侧文本框
        _rightTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(_iconImageView.frame.origin.x + _iconImageView.frame.size.width + 15  , 0, self.frame.size.width - _iconImageView.frame.size.width - 20 , self.frame.size.height)];
        
        [self addSubview:_rightTextFiled];
        _rightTextFiled.userInteractionEnabled = YES;
        _rightTextFiled.delegate = self;
        _rightTextFiled.font = [UIFont systemFontOfSize:14 ];
        _rightTextFiled.alpha = .5;
        _rightTextFiled.textColor = [UIColor whiteColor];
        _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _rightTextFiled.frame.origin.y + _rightTextFiled.frame.size.height , self.frame.size.width, .5)];
        _lineLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_lineLabel];
        
        _rightTextFiled.clearButtonMode = UITextFieldViewModeAlways;
        _rightTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
    }
    
    return self;
}
//
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    textField.alpha = 1;
    [textField resignFirstResponder];
    [textField.window makeKeyAndVisible];
    return YES;
}


@end
