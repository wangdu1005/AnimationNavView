//
//  ANVTableViewCell.h
//  AnimationNavView
//
//  Created by wangdu on 2018/11/12.
//  Copyright © 2018 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANVTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *animalImage;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UITextView *interpretationTextView;

@property (weak, nonatomic) IBOutlet    NSLayoutConstraint *textViewHightConstraint;

@end
