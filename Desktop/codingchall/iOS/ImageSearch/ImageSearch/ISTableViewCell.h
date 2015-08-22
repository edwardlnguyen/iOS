//
//  ISTableViewCell.h
//  ImageSearch
//
//  Created by edward nguyen on 8/18/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISTableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *ISimageView;
-(id)initWithFrame:(CGRect)frame initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)ident;
@end
