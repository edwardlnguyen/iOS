//
//  HypnosisView.m
//  playingwithviews
//
//  Created by edward nguyen on 8/4/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void)drawRect:(CGRect)rect{
  //pointer to drawing context
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  //get the bounds: bounds are the size properties given by the view image, such that it isn't dependent on the superview
  CGRect currBounds = [self bounds];
  
  //center of the bounds of the image
  CGPoint center;
  center.x = currBounds.origin.x + currBounds.size.width/2.0;
  center.y = currBounds.origin.y + currBounds.size.height/2.0;
  
  //radius of circle
  float maxRadius = hypot(currBounds.size.width, currBounds.size.height)/2.0;
  //thickness of line
  CGContextSetLineWidth(ctx, 10);
  //color of line is gray
  [[UIColor lightGrayColor] setStroke];
  //draw concentric circles
  CGSize offset;
  CGColorRef color;
  for (float currentRadius = maxRadius; currentRadius > 0; currentRadius-=20) {
    CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, 2.0 * M_PI, YES);
    offset = CGSizeMake(4, 3);
    color = [[UIColor darkGrayColor]CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    CGContextStrokePath(ctx);
  }
  
  //create a string
  NSString *text = @"You are getting Sleepy...";
  //font
  UIFont *font = [UIFont boldSystemFontOfSize:30];
  //frame for text window
  CGRect textRect;
  textRect.size     = [text sizeWithFont:font];
  textRect.origin.x = center.x - textRect.size.width  / 2.0;
  textRect.origin.y = center.y - textRect.size.height / 2.0;
  //set color
  [[UIColor blackColor] setFill];
  //shadows
  offset = CGSizeMake(4, 3);
  color = [[UIColor darkGrayColor]CGColor];
  CGContextSetShadowWithColor(ctx, offset, 2.0, color);
  //draw the string
  [text drawInRect:textRect
          withFont:font];
  
  
}




- (id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    [self setBackgroundColor:[UIColor clearColor]];
  }
  return self;
}
@end
