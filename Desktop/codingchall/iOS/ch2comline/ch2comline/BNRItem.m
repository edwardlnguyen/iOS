//
//  BNRItem.m
//  ch2comline
//
//  Created by edward nguyen on 7/4/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize item_name, serial_number, value, date_created, container, containedItem;
//overriding the synthesize for containedItem

- (void) setContainedItem:(BNRItem *)itemToContain{
  containedItem = itemToContain;
  [itemToContain setContainer:self];
}

//initialization methods
//overrides the init method from NSObject
- (id)init{
  return [self init_designated_item:@""
                      serial_number:@""
                              value:0];
}
//initializer with name argument
- (id)init_with_name:(NSString*)name{
  return [self init_designated_item:name serial_number:@"" value:0];
}

//designated initializer
- (id)init_designated_item:(NSString *)name serial_number:(NSString *)serial value:(int)val{
  //init all super classes before initing self
  self = [super init];
  if (self) {
    [self setItem_name:name];
    [self setSerial_number:serial_number];
    [self setValue:val];
    date_created = [[NSDate alloc]init];
  }
  return self;
}

  //override nsobject: description method
- (NSString *) description{
  NSString *description_string = [[NSString alloc]initWithFormat:@"%@ (%@}: Worth %d, recorded on %@",
                                  item_name,
                                  serial_number,
                                  value,
                                  date_created];
  return description_string;
}


@end
