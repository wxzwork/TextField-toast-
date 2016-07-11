//
//  MBProgressHUD+TVAssistant.m
//  TextField抖动效果、toast提示语
//
//  Created by WOSHIPM on 16/7/8.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "MBProgressHUD+TVAssistant.h"

@implementation MBProgressHUD (TVAssistant)
-(void)showToastWithText:(NSString *)text
{
    [self show:NO];
    [self setMode:MBProgressHUDModeText];
    self.userInteractionEnabled = NO;
    self.detailsLabelText = text;
    self.detailsLabelFont = [UIFont boldSystemFontOfSize:16.];
   //    设置视图停留的时间
    [self hide:YES afterDelay:2.];
}
-(void)showToastWithText:(NSString *)text isAutoHide:(BOOL)isAutoHide
{
    [self setMode:MBProgressHUDModeText];
    self.userInteractionEnabled = NO;
    self.detailsLabelText = text;
    self.detailsLabelFont = [UIFont boldSystemFontOfSize:14.];
    if (isAutoHide) {
        //    设置视图停留的时间
        [self hide:YES afterDelay:2.];
    }
}

-(void)showToastWithText:(NSString *)text whileExecutingBlock:(dispatch_block_t)block
{
    [self setMode:MBProgressHUDModeText];
    self.userInteractionEnabled = NO;
    self.labelText = text;
//    设置视图停留的时间
    dispatch_time_t time3s = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    dispatch_after(time3s, dispatch_get_global_queue(0, 0), ^{
        [self hide:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    });
}


+(MBProgressHUD *)showToastToView:(UIView *)view withText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud showToastWithText:text];
    return hud;
}
+(MBProgressHUD *)showToastNoHideClearColorToView:(UIView *)view withText:(NSString *)text textColor:(UIColor*)textColor
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.yOffset = 70;
    hud.detailsLabelColor = textColor;
    hud.color = [UIColor clearColor];
    [hud showToastWithText:text isAutoHide:NO];
    return hud;
}

@end
