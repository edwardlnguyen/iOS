//
//  ViewController.m
//  testapp
//
//  Created by edward nguyen on 6/19/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController




//initWithNibName -> takes in an optional string and a bundle, initializes the data models
- (id)initWithNibName:(NSString *)LaunchScreen bundle:(NSBundle *)someBundle{
  
  //calls the init method implemented by the super class to initialize this instance.
  self = [super initWithNibName:LaunchScreen bundle:someBundle];
  if (self) {
    //create the models
    question = [[NSMutableArray alloc] init];
    answer = [[NSMutableArray alloc] init];
    
    //initialize the models - hard coded
    [question addObject:@"what are abstract classes in c++?"];
    [answer addObject:@"they are interfaces"];
    
    [question addObject:@"what is the difference between memmove and memcpy?"];
    [answer addObject:@"memmove allows for overlap copying"];
    
    [question addObject:@"what is a bundle in iOS programming?"];
    [answer addObject:@"a package that holds exe and resources use by that code"];
  }
  return self;
}


- (IBAction)show_answer:(id)sender{
  //ask to return data from answer model, save to a string.
  //take data and set the string to the instance label.
  NSString *string = [answer objectAtIndex:currentQuestionIndex];
  [answerField setText:string];
}

- (IBAction)show_question:(id)sender{
  NSString *string = [question objectAtIndex:currentQuestionIndex];
  [questionField setText:string];
}

//- (void)viewDidLoad {
//  [super viewDidLoad];
//  // Do any additional setup after loading the view, typically from a nib.
//}
//d
//- (void)didReceiveMemoryWarning {
//  [super didReceiveMemoryWarning];
//  // Dispose of any resources that can be recreated.
//}

@end
