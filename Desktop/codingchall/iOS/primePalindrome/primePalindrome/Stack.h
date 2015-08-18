//
//  Stack.h
//  primePalindrome
//
//  Created by edward nguyen on 8/12/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
@interface Stack : NSObject
@property (nonatomic, strong) NSMutableArray* stack;
-(void)pushStack:(Node*)node;
-(Node*)popStack;
-(long)sizeStack;
-(void)makeEmptyStack; 

@end
