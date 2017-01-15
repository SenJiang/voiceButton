//
//  ButtonsTableViewCell.h
//  viocebutton
//
//  Created by 姜森 on 17/1/15.
//  Copyright © 2017年 detu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callBack) (void);

@interface ButtonsTableViewCell : UITableViewCell

@property (nonatomic,copy)callBack callback;

@end
