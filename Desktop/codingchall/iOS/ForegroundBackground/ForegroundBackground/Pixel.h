//
//  Pixel.h
//  ForegroundBackground
//
//  Created by edward nguyen on 8/29/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pixel : NSObject
+ (bool) isCellLeftPixelValid:(int)currentCell  width:(NSUInteger)width;
+ (bool) isCellRightPixelValid:(int)currentCell  width:(NSUInteger)width;
+ (bool) isCellTopPixelValid:(int)currentCell  width:(NSUInteger)width;
+ (bool) isCellBottomPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width;
+ (bool) isCellTopLeftPixelValid:(int)currentCell width:(NSUInteger)width;
+ (bool) isCellTopRightPixelValid:(int)currentCell width:(NSUInteger)width;
+ (bool) isCellBottomLeftPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width;
+ (bool) isCellBottomRightPixelValid:(int)currentCell  height:(NSUInteger)height width:(NSUInteger)width;
+ (bool) isBorderCase:(int)currentCell height:(NSUInteger)height width:(NSUInteger)width;
+ (bool) isTransparentPixel:(int)startIndex data:(unsigned char*)rawData;
+ (void) setRawData:(unsigned char*)rawData index:(int)startIndex red:(int)r green:(int)g blue:(int)b;
@end
