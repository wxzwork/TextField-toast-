//
//  LTView.h
//  TextField抖动效果、toast提示语
//
//  Created by WOSHIPM on 16/7/8.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView<UITextFieldDelegate>
@property(nonatomic, strong)UIImageView *iconImageView;
@property(nonatomic, strong)UITextField *rightTextFiled;
@property(nonatomic, strong)UILabel *lineLabel;
@end
