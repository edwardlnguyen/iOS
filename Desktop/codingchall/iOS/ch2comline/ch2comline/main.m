//
//  main.m
//  ch2comline
//
//  Created by edward nguyen on 7/4/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
    
    //ARRAYS:
        //send the alloc message to class NSMutableArray. the return is a pointer to memory.
        //with that, we send the init message of that allocated memory, returning the pointer to
        //an initialized nsmutablearray.
        NSMutableArray *items = [[NSMutableArray alloc]init];
        //C translation:items.addObject(anObject)
        //send the addObject message, with parameter, anObject, to the nsmutablearray instance: items
        [items addObject:@"zero"];
        [items addObject:@"two"];
        [items addObject:@"three"];
        [items insertObject:@"one" atIndex:1];
        for (int i = 0; i < [items count]; i++){
          //makes sure that it is a string for us to print. much more secure, but at the cost of runtime
          NSLog(@"%@",[items objectAtIndex:i]);
        }
        //after we create A, we want to destroy it by setting its pointer to nil
        items = nil;
    
    //STRINGS:
        NSString *somestring = @"somestring1";
        NSUInteger size = [somestring length];
        NSLog(@"size is %lu", (unsigned long) size );
        NSString *temp = @"somestring1";
        somestring = [[NSString alloc]initWithString:temp];
        size = [somestring length];
        NSLog(@"size is %lu", (unsigned long) size );
        //note: for nslog, if the format string contains %@, the argument is not being placed into the
        //format string. instead, it  passes sends the argument the message of its description, which returns
        //an NSString that replaces the token. WARNING: since the argument is being sent the message, it argument
        //must be an object.
    
    //CLASSES:
        //create an instance of class BNRItem, initialize it, and run functions on it.
        BNRItem *item = [[BNRItem alloc]init_with_name:@"testingthisthing"];
        NSLog(@"%@",item);
        //setters
        [item setItem_name:@"Apple Watch"];
        [item setSerial_number:@"1337"];
        [item setValue:1000];
        //getters
        NSLog(@"%@",item);
        item = nil;
    
    //SHALLOW VS DEEP COPY:
        NSMutableString *mutablestring = [[NSMutableString alloc]init];
        [mutablestring insertString:@"thisisatest" atIndex:0];
        BNRItem *item2 = [[BNRItem alloc]init_with_name:mutablestring];
        NSLog(@"%@", item2);
        [mutablestring appendString:@"anothertesthere"];
        NSLog(@"%@",item2);
  }
    return 0;
}
