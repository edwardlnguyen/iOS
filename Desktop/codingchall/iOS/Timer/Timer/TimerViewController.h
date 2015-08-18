//
//  TimerViewController.h
//  Timer
//
//  Created by edward nguyen on 7/26/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *timer_title_label;
@property (strong, nonatomic) IBOutlet UIButton *start_button;
@property (strong,nonatomic) NSTimer *timer_object;

@end
