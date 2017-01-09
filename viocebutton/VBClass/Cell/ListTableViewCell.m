//
//  ListTableViewCell.m
//  viocebutton
//
//  Created by 姜森 on 17/1/8.
//  Copyright © 2017年 detu. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *voiceLabe;
@property (weak, nonatomic) IBOutlet UILabel *timeTop;
@property (weak, nonatomic) IBOutlet UILabel *timeMid;
@property (weak, nonatomic) IBOutlet UILabel *timeBottom;
@property (weak, nonatomic) IBOutlet UILabel *messageCount;

@end

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
