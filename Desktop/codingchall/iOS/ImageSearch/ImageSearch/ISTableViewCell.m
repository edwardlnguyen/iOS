//
//  ISTableViewCell.m
//  ImageSearch
//
//  Created by edward nguyen on 8/18/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ISTableViewCell.h"


@implementation ISTableViewCell
@synthesize ISimageView;

-(id)initWithFrame:(CGRect)frame initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)ident {
  self = [super initWithStyle:style reuseIdentifier:ident];
  if (self) {
    [self setISimageView:[[UIImageView alloc]initWithFrame:frame]];
    [self addSubview:self.ISimageView];
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
