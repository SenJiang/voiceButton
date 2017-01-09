//
//  ZZNAlterView.h
//  DeTuZZN
//
//  Created by WZ on 15/9/17.
//  Copyright © 2015年 DETU. All rights reserved.
//

#import <UIKit/UIKit.h>

//弹窗

@class ZZNAlterView ;
@interface ZZNAlterView : UIView
- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
          leftBlock:(void(^)())leftBlock
         rightBlock:(void(^)())rightBlock;

- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
  thirdButtonTittle:(NSString *)thirdTittle
          leftBlock:(void(^)())leftBlock
         rightBlock:(void(^)())rightBlock
         thirdBlock:(void(^)())thirdBlock;
- (void)show;
- (void)showThree;
@property (nonatomic, copy) dispatch_block_t leftBlock;
@property (nonatomic, copy) dispatch_block_t rightBlock;
@property (nonatomic, copy) dispatch_block_t thirdBlock;
//点击左右按钮都会触发该消失的block
@property (nonatomic, copy) dispatch_block_t dismissBlock;

+(ZZNAlterView*)showmessage:(NSString *)message subtitle:(NSString *)subtitle cancelbutton:(NSString *)cancle;
@end
