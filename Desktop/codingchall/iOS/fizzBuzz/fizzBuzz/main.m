//
//  main.m
//  fizzBuzz
//
//  Created by edward nguyen on 8/11/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//



#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
  // read filename from the first argument
  NSString* path = [[NSBundle mainBundle] pathForResource:@"input" ofType:@"txt"];
  NSString* content = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
  NSScanner* scanner = [NSScanner scannerWithString:content];
  
  while (![scanner isAtEnd]) {
    NSString* line;
    [scanner scanUpToString:@"\n" intoString:&line];
    
    // perform your calculations here
    NSArray *array = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // array [0] = X = fizz
    // array [1] = Y = buzz
    // array [2] = STOP POINT runs til this stoping point
    
    int x = [array[0] intValue];
    int y = [array[1] intValue];
    for (int start = 1; start <= [array[2] intValue]; start++) {
      if (!(start % x)) {
        printf("%s ", [@"fizz" UTF8String]);
      }
      if (!(start % y)){
        printf("%s ", [@"buzz" UTF8String]);
      }
      if ((start % x) && (start % y)) {
        printf("%s ", [[NSString stringWithFormat:@"%i", start] UTF8String]);
      }
    }
    printf("\n");
  }
  
  return 0;
}
