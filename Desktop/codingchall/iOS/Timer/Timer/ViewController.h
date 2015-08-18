//
//  ViewController.h
//  Timer
//
//  Created by edward nguyen on 7/22/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController

@property (strong,nonatomic) NSMutableArray* user_array;
@property (strong,nonatomic) IBOutlet UILabel *username_test;
@property (strong,nonatomic) IBOutlet UILabel *email_test;
@property (strong,nonatomic) IBOutlet UILabel *pwd_test;
@property (strong,nonatomic) IBOutlet UIButton* create_user;
@property (strong,nonatomic) IBOutlet UITextField *username_field;
@property (strong,nonatomic) IBOutlet UITextField *email_field;
@property (strong,nonatomic) IBOutlet UITextField *password_field;

@end

