//
//  BaseTableViewCell.m
//  N-mix
//
//  Created by chenq@kensence.com on 16/5/17.
//  Copyright © 2016年 times. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)setModel:(TViewModel *)model
{
    self.baseNemeLabel.text = model.name;
    self.baseNemeLabel.textColor = [UIColor whiteColor];
    self.baseNemeLabel.backgroundColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1];
    NSLog(@"%@",model.name);

}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
