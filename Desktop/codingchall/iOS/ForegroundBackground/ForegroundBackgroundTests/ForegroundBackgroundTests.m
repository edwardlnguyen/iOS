//
//  ForegroundBackgroundTests.m
//  ForegroundBackgroundTests
//
//  Created by edward nguyen on 8/21/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Pixel.h"
@interface ForegroundBackgroundTests : XCTestCase
@property NSUInteger width;
@property NSUInteger height;
@property NSUInteger bytesPerPixel;
@end

@implementation ForegroundBackgroundTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  self.width = 2;
  self.height = 1;
  self.bytesPerPixel = 4;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAdjacentLeftPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([Pixel isCellLeftPixelValid:1 width:3]);
  XCTAssertTrue([Pixel isCellLeftPixelValid:2 width:3]);
  XCTAssertTrue([Pixel isCellLeftPixelValid:4 width:3]);
  XCTAssertTrue([Pixel isCellLeftPixelValid:5 width:3]);
  XCTAssertTrue([Pixel isCellLeftPixelValid:7 width:3]);
  XCTAssertTrue([Pixel isCellLeftPixelValid:8 width:3]);
  XCTAssertFalse([Pixel isCellLeftPixelValid:0 width:3]);
  XCTAssertFalse([Pixel isCellLeftPixelValid:3 width:3]);
  XCTAssertFalse([Pixel isCellLeftPixelValid:6 width:3]);
}

- (void)testAdjacentRightPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([Pixel isCellRightPixelValid:0 width:3]);
  XCTAssertTrue([Pixel isCellRightPixelValid:1 width:3]);
  XCTAssertTrue([Pixel isCellRightPixelValid:3 width:3]);
  XCTAssertTrue([Pixel isCellRightPixelValid:4 width:3]);
  XCTAssertTrue([Pixel isCellRightPixelValid:6 width:3]);
  XCTAssertTrue([Pixel isCellRightPixelValid:7 width:3]);
  XCTAssertFalse([Pixel isCellRightPixelValid:2 width:3]);
  XCTAssertFalse([Pixel isCellRightPixelValid:5 width:3]);
  XCTAssertFalse([Pixel isCellRightPixelValid:8 width:3]);
}

- (void)testAdjacentTopPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([Pixel isCellTopPixelValid:3 width:3]);
  XCTAssertTrue([Pixel isCellTopPixelValid:4 width:3]);
  XCTAssertTrue([Pixel isCellTopPixelValid:5 width:3]);
  XCTAssertTrue([Pixel isCellTopPixelValid:6 width:3]);
  XCTAssertTrue([Pixel isCellTopPixelValid:7 width:3]);
  XCTAssertTrue([Pixel isCellTopPixelValid:8 width:3]);
  XCTAssertFalse([Pixel isCellTopPixelValid:0 width:3]);
  XCTAssertFalse([Pixel isCellTopPixelValid:1 width:3]);
  XCTAssertFalse([Pixel isCellTopPixelValid:2 width:3]);
}

- (void)testAdjacentBottomPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([Pixel isCellBottomPixelValid:0 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomPixelValid:1 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomPixelValid:2 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomPixelValid:3 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomPixelValid:4 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomPixelValid:5 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomPixelValid:6 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomPixelValid:7 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomPixelValid:8 height:3 width:3]);
}

- (void)testAdjacentTopCornerPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  //topleft corner
  XCTAssertTrue([Pixel isCellTopLeftPixelValid:4 width:3]);
  XCTAssertTrue([Pixel isCellTopLeftPixelValid:5 width:3]);
  XCTAssertTrue([Pixel isCellTopLeftPixelValid:7 width:3]);
  XCTAssertTrue([Pixel isCellTopLeftPixelValid:8 width:3]);
  XCTAssertFalse([Pixel isCellTopLeftPixelValid:0 width:3]);
  XCTAssertFalse([Pixel isCellTopLeftPixelValid:1 width:3]);
  XCTAssertFalse([Pixel isCellTopLeftPixelValid:2 width:3]);
  XCTAssertFalse([Pixel isCellTopLeftPixelValid:3 width:3]);
  XCTAssertFalse([Pixel isCellTopLeftPixelValid:6 width:3]);
  
  //topright corner
  XCTAssertTrue([Pixel isCellTopRightPixelValid:3 width:3]);
  XCTAssertTrue([Pixel isCellTopRightPixelValid:4 width:3]);
  XCTAssertTrue([Pixel isCellTopRightPixelValid:6 width:3]);
  XCTAssertTrue([Pixel isCellTopRightPixelValid:7 width:3]);
  XCTAssertFalse([Pixel isCellTopRightPixelValid:0 width:3]);
  XCTAssertFalse([Pixel isCellTopRightPixelValid:1 width:3]);
  XCTAssertFalse([Pixel isCellTopRightPixelValid:2 width:3]);
  XCTAssertFalse([Pixel isCellTopRightPixelValid:5 width:3]);
  XCTAssertFalse([Pixel isCellTopRightPixelValid:8 width:3]);
}

- (void)testAdjacentBottomCornerPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  //bottomleft corner
  XCTAssertTrue([Pixel isCellBottomLeftPixelValid:1 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomLeftPixelValid:2 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomLeftPixelValid:4 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomLeftPixelValid:5 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomLeftPixelValid:0 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomLeftPixelValid:3 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomLeftPixelValid:6 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomLeftPixelValid:7 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomLeftPixelValid:8 height:3 width:3]);
  
  //bottomright corner
  XCTAssertTrue([Pixel isCellBottomRightPixelValid:0 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomRightPixelValid:1 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomRightPixelValid:3 height:3 width:3]);
  XCTAssertTrue([Pixel isCellBottomRightPixelValid:4 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomRightPixelValid:2 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomRightPixelValid:5 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomRightPixelValid:6 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomRightPixelValid:7 height:3 width:3]);
  XCTAssertFalse([Pixel isCellBottomRightPixelValid:8 height:3 width:3]);
}

-(void)testBorderCase{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([Pixel isBorderCase:0 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:1 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:2 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:3 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:5 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:6 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:7 height:3 width:3]);
  XCTAssertTrue([Pixel isBorderCase:8 height:3 width:3]);
  
  //if its the middle cell
  XCTAssertFalse([Pixel isBorderCase:4 height:3 width:3]);
}

- (void)testTransparentPixel{
  //you have 2 pixels. one is transparent and one is not
  unsigned char* rawData = malloc(self.width * self.height * self.bytesPerPixel);
  rawData[3] = 0;//transparent
  rawData[7] = 1;//not transparent
  XCTAssertTrue([Pixel isTransparentPixel:0 data:rawData]);
  XCTAssertFalse([Pixel isTransparentPixel:1 data:rawData]);
  free(rawData);
}

- (void)testSetRawData{
  //you have 2 pixels, one set to black and one set to white
  unsigned char* rawData = malloc(self.width * self.height * self.bytesPerPixel);
  [Pixel setRawData:rawData index:0 red:0 green:0 blue:0]; //black color for the first pixel
  [Pixel setRawData:rawData index:4 red:255 green:255 blue:255]; //white color for second pixel
  for (int i = 0; i < (self.width * self.height * self.bytesPerPixel); i++) {
    if (i < 3) {
      XCTAssertEqual(rawData[i], (unsigned char) 0);
    }else if (i > 3 && i < 7){
      XCTAssertEqual(rawData[i], (unsigned char) 255);
    }
  }
  free(rawData);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
