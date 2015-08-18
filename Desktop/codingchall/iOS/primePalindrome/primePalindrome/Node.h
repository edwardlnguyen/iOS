//
//  Node.h
//  primePalindrome
//
//  Created by edward nguyen on 8/12/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic,strong) NSString* digit;
-(id)initWithString:(NSString*)ch;
@end
