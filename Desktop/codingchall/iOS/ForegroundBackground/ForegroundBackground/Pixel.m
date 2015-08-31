//
//  Pixel.m
//  ForegroundBackground
//
//  Created by edward nguyen on 8/29/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "Pixel.h"

@implementation Pixel

//WHAT IT DOES:
//pixel position validation methods: imagegrid
//returns true if you can check that particular pixel, and returns false if you cannot check that pixel.
+ (bool) isCellLeftPixelValid:(int)currentCell  width:(NSUInteger)width{
  if ((currentCell == 0) || ((currentCell % width) == 0)) return false;
  return true;
}
+ (bool) isCellRightPixelValid:(int)currentCell  width:(NSUInteger)width{
  if (((currentCell + 1) % width) == 0) return false;
  return true;
}
+ (bool) isCellTopPixelValid:(int)currentCell  width:(NSUInteger)width{
  if (currentCell > (width - 1)) return true;
  return false;
}
+ (bool) isCellBottomPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width{
  if (currentCell >= (height*width-width)) return false;
  return true;
}
+ (bool) isCellTopLeftPixelValid:(int)currentCell width:(NSUInteger)width{
  if ([self isCellTopPixelValid:currentCell width:width] && [self isCellLeftPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}
+ (bool) isCellTopRightPixelValid:(int)currentCell width:(NSUInteger)width{
  if ([self isCellTopPixelValid:currentCell width:width] && [self isCellRightPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}
+ (bool) isCellBottomLeftPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width{
  if ([self isCellBottomPixelValid:currentCell height:height width:width] && [self isCellLeftPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}
+ (bool) isCellBottomRightPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width{
  if ([self isCellBottomPixelValid:currentCell height:height width:width] && [self isCellRightPixelValid:currentCell width:width]) {
    return true;
  }
  return false;
}

//WHAT IT DOES:
//imagegrid: if the nontransparent currentPixel is already at the border of the image, it is a bordercase perimeter pixel.
+ (bool) isBorderCase:(int)currentCell height:(NSUInteger)height width:(NSUInteger)width{
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
+ (bool) isTransparentPixel:(int)startIndex data:(unsigned char*)rawData{
  if (rawData == nil) return false;
  if (rawData[startIndex+3] == 0) { //alpha is 0
    return true;
  }
  return false;
}

//WHAT IT DOES:
//sets the pixel RGBA data, given a rawData array.
+(void)setRawData:(unsigned char*)rawData index:(int)startIndex red:(int)r green:(int)g blue:(int)b {
  if (rawData == nil) return;
  rawData[startIndex   ] = (unsigned char) (r);
  rawData[startIndex +1] = (unsigned char) (g);
  rawData[startIndex +2] = (unsigned char) (b);
}


@end
