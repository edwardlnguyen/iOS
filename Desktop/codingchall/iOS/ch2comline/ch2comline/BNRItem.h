//
//  BNRItem.h
//  ch2comline
//
//  Created by edward nguyen on 7/4/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

- (id)init_designated_item:(NSString *)name
             serial_number:(NSString *)serial
                     value:(int)val;
- (id)init_with_name:(NSString*)name;

@property (nonatomic,weak)            BNRItem * container;
@property (nonatomic,strong)          BNRItem * containedItem;
@property (nonatomic,copy)          NSString* item_name;
@property (nonatomic,copy)          NSString* serial_number;
@property (nonatomic)                      int value;
@property (nonatomic,readonly,strong) NSDate  * date_created;

@end
