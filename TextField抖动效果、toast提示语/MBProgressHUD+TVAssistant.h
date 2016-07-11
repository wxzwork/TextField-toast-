//
//  MBProgressHUD+TVAssistant.h
//  TextField抖动效果、toast提示语
//
//  Created by WOSHIPM on 16/7/8.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (TVAssistant)

-(void)showToastWithText:(NSString *)text;
-(void)showToastWithText:(NSString *)text whileExecutingBlock:(dispatch_block_t)block;
+(MBProgressHUD *)showToastToView:(UIView *)view withText:(NSString *)text;
+(MBProgressHUD *)showToastNoHideClearColorToView:(UIView *)view withText:(NSString *)text textColor:(UIColor *)textColor;

@end
