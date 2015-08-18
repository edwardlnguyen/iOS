//
//  User.m
//  Timer
//
//  Created by edward nguyen on 7/22/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "User.h"
#import <Foundation/Foundation.h>
@interface User ()
@end

@implementation User
@synthesize username,email,password;

- (id) init{
  return [self initDesignated:@"" email:@"" password:@""];
}


- (id) initDesignated:(NSString*)name email:(NSString*)mail password:(NSString*)pwd{
  self = [super init];
  if (self) {
    [self setUsername:name];
    [self setEmail:mail];
    [self setPassword:pwd];
  }
  return self;
}

- (NSString*) description{
  NSString *description_string = [[NSString alloc]initWithFormat:@"name:%@, email:%@, password:%@", username, email, password];
  return description_string;
}

@end