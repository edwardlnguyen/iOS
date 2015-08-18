//
//  Stack.m
//  primePalindrome
//
//  Created by edward nguyen on 8/12/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@end

@implementation Stack
@synthesize stack;
-(id)init{
  self = [super init];
  if (self){
    self.stack = [[NSMutableArray alloc]init];
  }
  return self;
}
-(void)pushStack:(Node*)node{
  [stack addObject:node];
}

-(Node*)popStack{
  Node* top = [stack objectAtIndex:([stack count]-1)];
  [stack removeObjectAtIndex:([stack count]-1)];
  return top;
}

-(long)sizeStack{
  return [stack count];
}

-(void)makeEmptyStack{
  [self.stack removeAllObjects];
}

@end
