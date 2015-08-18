//
//  main.m
//  primePalindrome
//
//  Created by edward nguyen on 8/12/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//



// GOAL: Modular Node and Stack classes for use in future projects. played around with finding palindromes and prime numbers, and or a mixture of both to demonstrate functionality.
// HOW TO RUN: run using testcases! or function calls in main


#import <Foundation/Foundation.h>
#import "Node.h"
#import "Stack.h"

bool isPalindrome(Stack* s,int number){
  assert([s sizeStack] == 0);
  assert(number > 0); //only want positive, non zero numbers
  //number of digits in number
  int newNumber;
  int count = 0;
  int middleIndex;
  int currentIndex;
  int newNumberDigit;
  for(newNumber = number; newNumber != 0; newNumber /= 10,count++) {}
  
  if(((count%2) == 0)){
    //is even
    for(newNumber = number, middleIndex = (count / 2), currentIndex = count; newNumber != 0; newNumber /= 10, currentIndex--) { //runs for the length of the number
      newNumberDigit = newNumber % 10;
      if (currentIndex > middleIndex){
        Node* digitNode = [[Node alloc]initWithString:
                           [[NSNumber numberWithInt:newNumberDigit] stringValue]];
        [s pushStack:digitNode];
      }else{
        Node* top = [s popStack];
        if(![[top digit] isEqualToString:[[NSNumber numberWithInt:newNumberDigit] stringValue]]){
          //clearly not palindrome if readin digit is not equal to the popped node
          [s makeEmptyStack];
          return false;
        }
      }
    }
    [s makeEmptyStack];
    return true;
  }else{
    //is odd
    for(newNumber = number, middleIndex = (count/2)+1, currentIndex = count; newNumber != 0; newNumber /= 10, currentIndex--){
      newNumberDigit = newNumber % 10;
      if (currentIndex > middleIndex){
        Node* digitNode = [[Node alloc]initWithString:
                           [[NSNumber numberWithInt:newNumberDigit] stringValue]];
        [s pushStack:digitNode];
      } else if(currentIndex == middleIndex){
        //ignore if middle
        continue;
      } else {
        Node* top = [s popStack];
        if(![[top digit] isEqualToString:[[NSNumber numberWithInt:newNumberDigit] stringValue]]){
          //clearly not palindrome if readin digit is not equal to the popped node
          [s makeEmptyStack];
          return false;
        }
      }
    }
    [s makeEmptyStack];
    return true;
  }
}

bool isPrime(int number){
  int i;
  for (i = 2; i<=sqrt(number); i++){
    if (!(number % i)) {
      return false;
    }
  }
  return true;
}

int getPrimePalindrome(int number){
  if (number <= 0 || number > 1000) {
    NSLog(@"ERROR: input number must be greater than 0 and less than 1001 (stack memory limitations)");
    return 0;
  }
  int countDown = number-1;
  Stack* s = [[Stack alloc]init];
  while (countDown > 0) {
    if(isPrime(countDown) && isPalindrome(s, countDown)){
      break;
    }
    countDown--;
  }
  s = nil;
  return countDown;
}

int main(int argc, const char * argv[]) {
  return 0;
}
