//
//  ViewController.m
//  ForegroundBackground
//
//  Created by edward nguyen on 8/21/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView,perimeterButton,workingImage;


//WHAT IT DOES:
//loads an image into its rawData array format: RGBA (4 bytes per pixel).
//if a pixel is "not transparent", it is a candidate for perimeter checking: (check valid surrounding pixels and see if adjacent to "transparent" pixel)
//if the pixel is identified as a perimeter pixel, change its RGB value to increase noticability.
//redraw the image using modified rawData array format to generate an image identifying the perimeter of the original image.
- (IBAction)perimeterAction:(id)sender {
  [self setWorkingImage:[UIImage imageNamed:@"Balloons"]];
  CGContextRef    ctx;
  CGImageRef      imageRef         = [self.workingImage CGImage];
  NSUInteger      width            = CGImageGetWidth(imageRef);
  NSUInteger      height           = CGImageGetHeight(imageRef);
  NSUInteger      bytesPerPixel    = 4;                                      //each pixel has 4 bytes: RGBA
  NSUInteger      bytesPerRow      = bytesPerPixel * width;
  NSUInteger      bitsPerComponent = 8;
  
  unsigned char   *rawData         = malloc(width * height * bytesPerPixel); //array of image data
  CGColorSpaceRef colorSpace       = CGColorSpaceCreateDeviceRGB();
  CGContextRef    context          = CGBitmapContextCreate(rawData,
                                                           width,
                                                           height,
                                                           bitsPerComponent,
                                                           bytesPerRow,
                                                           colorSpace,
                                                           kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
  CGColorSpaceRelease(colorSpace); //done using color space
  CGContextDrawImage (context, CGRectMake(0, 0, width, height), imageRef);
  CGContextRelease   (context);
  
  //used to see if we can check these pixel locations, with respect to imagegrid
  bool borderCase;
  bool left;
  bool right;
  bool top;
  bool bottom;
  bool topLeft;
  bool topRight;
  bool bottomLeft;
  bool bottomRight;
  
  //location of current pixel and surrounding pixels, with respect to rawData
  int currentPixel;
  int leftLoc;
  int rightLoc;
  int topLoc;
  int botLoc;
  int topLeftLoc;
  int topRightLoc;
  int botLeftLoc;
  int botRightLoc;
  
  for (int ii = 0; ii < width * height; ii++) {
    
    //the current pixel's location in reference to rawData, will be ii * 4
    currentPixel  = ii * 4;
    if (![Pixel isTransparentPixel:currentPixel data:rawData]) {
      //can check surrounding pixels in terms of imagegrid
      borderCase  = [Pixel isBorderCase:ii height:height width:width];
      left        = [Pixel isCellLeftPixelValid:ii width:width];
      right       = [Pixel isCellRightPixelValid:ii width:width];
      top         = [Pixel isCellTopPixelValid:ii width:width];
      bottom      = [Pixel isCellBottomPixelValid:ii height:height width:width];
      topLeft     = [Pixel isCellTopLeftPixelValid:ii width:width];
      topRight    = [Pixel isCellTopRightPixelValid:ii width:width];
      bottomLeft  = [Pixel isCellBottomLeftPixelValid:ii height:height width:width];
      bottomRight = [Pixel isCellBottomRightPixelValid:ii height:height width:width];
      //update location of surrounding pixels, in terms of rawData
      leftLoc     = (ii-1)*4;
      rightLoc    = (ii+1)*4;
      topLoc      = (ii-width)*4;
      botLoc      = (ii+width)*4;
      topLeftLoc  = (ii-width-1)*4;
      topRightLoc = (ii-width+1)*4;
      botLeftLoc  = (ii+width-1)*4;
      botRightLoc = (ii+width+1)*4;
      
      //alternatively, we could use a switch statement to represent each boolean we want to check. just have the switch expression always evaluate to the first "case", and never break from the switch statement so that every "case" gets ran. However, switch in this case is very slow, and I think the updated code is more readable than it is previously, allowing usage of if statments better.
      //if the surrouning pixels can be checked: if the adjacent pixel isTransparent: current pixel is perimeter pixel
      if (borderCase) {
        [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
        continue;
      }
      
      if (left) {
        if ([Pixel isTransparentPixel:leftLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (right){
        if ([Pixel isTransparentPixel:rightLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (top){
        if ([Pixel isTransparentPixel:topLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (bottom){
        if ([Pixel isTransparentPixel:botLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (topLeft){
        if ([Pixel isTransparentPixel:topLeftLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (topRight){
        if ([Pixel isTransparentPixel:topRightLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (bottomLeft) {
        if ([Pixel isTransparentPixel:botLeftLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      if (bottomRight) {
        if ([Pixel isTransparentPixel:botRightLoc data:rawData]) {
          [Pixel setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      //if the current pixel isn't identified as a perimeter pixel by this line, it can be set to white
      [Pixel setRawData:rawData index:currentPixel red:255 green:255 blue:255 ]; //white pixel
    }//end if
  }//end for
  
  
  ctx = CGBitmapContextCreate(rawData,
                              CGImageGetWidth( imageRef ),
                              CGImageGetHeight( imageRef ),
                              8,
                              CGImageGetBytesPerRow( imageRef ),
                              CGImageGetColorSpace( imageRef ),
                              kCGImageAlphaPremultipliedLast );
  
  imageRef = CGBitmapContextCreateImage (ctx);
  UIImage* rawImage = [UIImage imageWithCGImage:imageRef];
    CGContextRelease(ctx);
  
  self.workingImage = rawImage;
  [self.imageView setImage:self.workingImage];

  free(rawData);
 
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self setImageView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Balloons"]]];
  [self.imageView setFrame:CGRectMake(50, 100, imageView.frame.size.width, imageView.frame.size.height)];
  [self.view addSubview:self.imageView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
