//
//  ISTableViewCell.m
//  ImageSearch
//
//  Created by edward nguyen on 8/18/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ISTableViewCell.h"


@implementation ISTableViewCell
@synthesize imgView;

-(id)initWithFrame:(CGRect)frame initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)ident{
  self = [super initWithStyle:style reuseIdentifier:ident];
  if (self) {
    [self setImgView:[[UIImageView alloc]initWithFrame:frame]];
    [self addSubview:self.imgView];
  }
  return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
