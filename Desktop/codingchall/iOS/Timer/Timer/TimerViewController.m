//
//  TimerViewController.m
//  Timer
//
//  Created by edward nguyen on 7/26/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController
@synthesize timer_title_label,start_button,timer_object;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  timer_object = [[NSTimer alloc]init];
  [timer_object ]
}

- (IBAction)start_stop_button:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
