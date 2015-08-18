//
//  ViewController.h
//  ImageSearch
//
//  Created by edward nguyen on 8/15/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ConnectSdk.h"
#import "ImageSearch.h"
#import "UIImageView+AFNetworking.h"
#import "CustomIOSAlertView.h"
@interface ViewController : UIViewController <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) IBOutlet UITextField *searchField;
@property (strong, nonatomic) UIAlertView *alert;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property int cellHeight;
@end

