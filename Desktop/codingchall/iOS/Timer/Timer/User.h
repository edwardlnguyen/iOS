//
//  User.h
//  Timer
//
//  Created by edward nguyen on 7/22/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#ifndef Timer_User_h
#define Timer_User_h
#import <Foundation/Foundation.h>

@interface User : NSObject

// users have name, email, password, and an array of timer objects associated.
@property (nonatomic,strong)          NSString* username;
@property (nonatomic,strong)          NSString* email;
@property (nonatomic,strong)          NSString* password;
//we will do the array of timer objects at a later time

- (id) initDesignated:(NSString*)name email:(NSString*)mail password:(NSString*)pwd;
@end

#endif
