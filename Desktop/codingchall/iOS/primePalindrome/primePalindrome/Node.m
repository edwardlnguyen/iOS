//
//  Node.m
//  primePalindrome
//
//  Created by edward nguyen on 8/12/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "Node.h"

@interface Node ()

@end

@implementation Node
@synthesize digit;
-(id)init{
  return [self initWithString:nil];
}

//designated init
-(id)initWithString:(NSString*)ch{
  self = [super init];
  if (self) {
    self.digit = [[NSString alloc]initWithString:ch];
  }
  return self;
}
@end
