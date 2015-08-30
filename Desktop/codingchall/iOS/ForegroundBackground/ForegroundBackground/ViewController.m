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
//pixel position validation methods: imagegrid
//returns true if you can check that particular pixel, and returns false if you cannot check that pixel.
- (bool) isCellLeftPixelValid:(int)currentCell  width:(NSUInteger)width{
  if ((currentCell == 0) || ((currentCell % width) == 0)) return false;
  return true;
}
- (bool) isCellRightPixelValid:(int)currentCell  width:(NSUInteger)width{
  if (((currentCell + 1) % width) == 0) return false;
  return true;
}
- (bool) isCellTopPixelValid:(int)currentCell  width:(NSUInteger)width{
  if (currentCell > (width - 1)) return true;
  return false;
}
- (bool) isCellBottomPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width{
  if (currentCell >= (height*width-width)) return false;
  return true;
}
- (bool) isCellTopLeftPixelValid:(int)currentCell width:(NSUInteger)width{
  if ([self isCellTopPixelValid:currentCell width:width] && [self isCellLeftPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}
- (bool) isCellTopRightPixelValid:(int)currentCell width:(NSUInteger)width{
  if ([self isCellTopPixelValid:currentCell width:width] && [self isCellRightPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}
- (bool) isCellBottomLeftPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width{
  if ([self isCellBottomPixelValid:currentCell height:height width:width] && [self isCellLeftPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}
- (bool) isCellBottomRightPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width{
  if ([self isCellBottomPixelValid:currentCell height:height width:width] && [self isCellRightPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}

//WHAT IT DOES:
//imagegrid: if the nontransparent currentPixel is already at the border of the image, it is a bordercase perimeter pixel.
- (bool) isBorderCase:(int)currentCell height:(NSUInteger)height width:(NSUInteger)width{
  if ( ((currentCell >= 0) && (currentCell < width)) || //top border
       (currentCell >= (width*height-width))         || //bottom border
       ((currentCell%width) == 0)                    || //left border
       (((currentCell+1)%width) == 0)                   //right border
      ) {
    return true;
  }
  return false;
}


//WHAT IT DOES:
//returns true if transparent, false if not transparent
- (bool) isTransparentPixel:(int)startIndex data:(unsigned char*)rawData{
  if (rawData[startIndex+3] == 0) { //alpha is 0
    return true;
  }
  return false;
}

//WHAT IT DOES:
//sets the pixel RGBA data, given a rawData array.
-(void)setRawData:(unsigned char*)rawData index:(int)startIndex red:(int)r green:(int)g blue:(int)b {
  rawData[startIndex   ] = (unsigned char) (r);
  rawData[startIndex +1] = (unsigned char) (g);
  rawData[startIndex +2] = (unsigned char) (b);
}

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
    if (![self isTransparentPixel:currentPixel data:rawData]) {
      //can check surrounding pixels in terms of imagegrid
      borderCase  = [self isBorderCase:ii height:height width:width];
      left        = [self isCellLeftPixelValid:ii width:width];
      right       = [self isCellRightPixelValid:ii width:width];
      top         = [self isCellTopPixelValid:ii width:width];
      bottom      = [self isCellBottomPixelValid:ii height:height width:width];
      topLeft     = [self isCellTopLeftPixelValid:ii width:width];
      topRight    = [self isCellTopRightPixelValid:ii width:width];
      bottomLeft  = [self isCellBottomLeftPixelValid:ii height:height width:width];
      bottomRight = [self isCellBottomRightPixelValid:ii height:height width:width];
      //update location of surrounding pixels, in terms of rawData
      leftLoc     = (ii-1)*4;
      rightLoc    = (ii+1)*4;
      topLoc      = (ii-width)*4;
      botLoc      = (ii+width)*4;
      topLeftLoc  = (ii-width-1)*4;
      topRightLoc = (ii-width+1)*4;
      botLeftLoc  = (ii+width-1)*4;
      botRightLoc = (ii+width+1)*4;
      
      //if the surrouning pixels can be checked: if the adjacent pixel isTransparent: current pixel is perimeter pixel
      if (borderCase) {
        [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
        continue;
      }
      if (left) {
        if ([self isTransparentPixel:leftLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (right){
        if ([self isTransparentPixel:rightLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (top){
        if ([self isTransparentPixel:topLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (bottom){
        if ([self isTransparentPixel:botLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (topLeft){
        if ([self isTransparentPixel:topLeftLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (topRight){
        if ([self isTransparentPixel:topRightLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (bottomLeft) {
        if ([self isTransparentPixel:botLeftLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      if (bottomRight) {
        if ([self isTransparentPixel:botRightLoc data:rawData]) {
          [self setRawData:rawData index:currentPixel red:0 green:0 blue:0 ]; //black pixel if a perimeter, alpha = 1 is opaque
          continue;
        }
      }
      
      //if the current pixel isn't identified as a perimeter pixel by this line, it can be set to white
      [self setRawData:rawData index:currentPixel red:255 green:255 blue:255 ]; //white pixel
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
  //[self.imageView setFrame:CGRectMake(50, 100, imageView.frame.size.width, imageView.frame.size.height)];
  [self.imageView setTag:123];
  [self.view addSubview:self.imageView];
}


- (void)viewDidUnload {
  // Release any retained subviews of the main view.
  self.imageView = nil;
}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
