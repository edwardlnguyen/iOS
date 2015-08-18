//
//  ViewController.m
//  Timer
//
//  Created by edward nguyen on 7/22/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize user_array,username_test,email_test,pwd_test,create_user,username_field,email_field,password_field;

- (IBAction)createUser:(id)sender {
  int index;
  //check and grab user info from fields
  if (![username_field hasText] || ![email_field hasText] || ![password_field hasText]) {
    NSLog(@"Error: incomplete user information");
    return;
  }
  //check if the user exists in model
  for (index = 0; index < [user_array count]; index++) {
    if ([[[user_array objectAtIndex:index]username] isEqualToString:[username_field text]] ||
        [[[user_array objectAtIndex:index]email] isEqualToString:[email_field text]]) {
      NSLog(@"Error: Username taken, or Email taken. Try Again? ^_^");
      return;
    }
  }
  //create user using user info
  User *user = [[User alloc]initDesignated:[username_field text] email:[email_field text] password:[password_field text]];
  //insert into user_array model
  [user_array addObject:user];
  NSLog(@"User Created");
  
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  user_array = [[NSMutableArray alloc]init];
  //do a check if properly allocated
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
