//
//  ViewController.h
//  ForegroundBackground
//
//  Created by edward nguyen on 8/21/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pixel.h"
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *workingImage;
@property (strong, nonatomic) IBOutlet UIButton *perimeterButton;
@end

