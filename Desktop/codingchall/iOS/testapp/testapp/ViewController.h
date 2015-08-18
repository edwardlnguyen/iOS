//
//  ViewController.h
//  testapp
//
//  Created by edward nguyen on 6/19/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ViewController : UIViewController
{
  int currentQuestionIndex;
  
  //instances of model variables
  NSMutableArray *answer;
  NSMutableArray *question;
  
  //instances of view variables
  IBOutlet UILabel *questionField;
  IBOutlet UILabel *answerField;

}

//function declarations just like in c++,syntax is strange
//- (return type) name : argument
- (IBAction)show_question:(id)sender;
- (IBAction)show_answer:(id)sender;

@end

