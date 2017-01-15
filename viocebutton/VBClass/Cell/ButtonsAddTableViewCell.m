//
//  ButtonsAddTableViewCell.m
//  viocebutton
//
//  Created by 姜森 on 17/1/15.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "ButtonsAddTableViewCell.h"

@implementation ButtonsAddTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)addNewButtonAction:(UIButton *)sender {
    if (self.callBack) {
        self.callBack();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
