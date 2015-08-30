//
//  ForegroundBackgroundTests.m
//  ForegroundBackgroundTests
//
//  Created by edward nguyen on 8/21/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface ForegroundBackgroundTests : XCTestCase
@property (strong, nonatomic) ViewController *controller;
@property NSUInteger width;
@property NSUInteger height;
@property NSUInteger bytesPerPixel;
@end

@implementation ForegroundBackgroundTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  self.controller = [[ViewController alloc]init];
  self.width = 2;
  self.height = 1;
  self.bytesPerPixel = 4;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  self.controller = nil;
    [super tearDown];
}

- (void)testAdjacentLeftPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([self.controller isCellLeftPixelValid:1 width:3]);
  XCTAssertTrue([self.controller isCellLeftPixelValid:2 width:3]);
  XCTAssertTrue([self.controller isCellLeftPixelValid:4 width:3]);
  XCTAssertTrue([self.controller isCellLeftPixelValid:5 width:3]);
  XCTAssertTrue([self.controller isCellLeftPixelValid:7 width:3]);
  XCTAssertTrue([self.controller isCellLeftPixelValid:8 width:3]);
  XCTAssertFalse([self.controller isCellLeftPixelValid:0 width:3]);
  XCTAssertFalse([self.controller isCellLeftPixelValid:3 width:3]);
  XCTAssertFalse([self.controller isCellLeftPixelValid:6 width:3]);
}

- (void)testAdjacentRightPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([self.controller isCellRightPixelValid:0 width:3]);
  XCTAssertTrue([self.controller isCellRightPixelValid:1 width:3]);
  XCTAssertTrue([self.controller isCellRightPixelValid:3 width:3]);
  XCTAssertTrue([self.controller isCellRightPixelValid:4 width:3]);
  XCTAssertTrue([self.controller isCellRightPixelValid:6 width:3]);
  XCTAssertTrue([self.controller isCellRightPixelValid:7 width:3]);
  XCTAssertFalse([self.controller isCellRightPixelValid:2 width:3]);
  XCTAssertFalse([self.controller isCellRightPixelValid:5 width:3]);
  XCTAssertFalse([self.controller isCellRightPixelValid:8 width:3]);
}

- (void)testAdjacentTopPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([self.controller isCellTopPixelValid:3 width:3]);
  XCTAssertTrue([self.controller isCellTopPixelValid:4 width:3]);
  XCTAssertTrue([self.controller isCellTopPixelValid:5 width:3]);
  XCTAssertTrue([self.controller isCellTopPixelValid:6 width:3]);
  XCTAssertTrue([self.controller isCellTopPixelValid:7 width:3]);
  XCTAssertTrue([self.controller isCellTopPixelValid:8 width:3]);
  XCTAssertFalse([self.controller isCellTopPixelValid:0 width:3]);
  XCTAssertFalse([self.controller isCellTopPixelValid:1 width:3]);
  XCTAssertFalse([self.controller isCellTopPixelValid:2 width:3]);
}

- (void)testAdjacentBottomPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([self.controller isCellBottomPixelValid:0 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomPixelValid:1 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomPixelValid:2 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomPixelValid:3 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomPixelValid:4 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomPixelValid:5 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomPixelValid:6 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomPixelValid:7 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomPixelValid:8 height:3 width:3]);
}

- (void)testAdjacentTopCornerPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  //topleft corner
  XCTAssertTrue([self.controller isCellTopLeftPixelValid:4 width:3]);
  XCTAssertTrue([self.controller isCellTopLeftPixelValid:5 width:3]);
  XCTAssertTrue([self.controller isCellTopLeftPixelValid:7 width:3]);
  XCTAssertTrue([self.controller isCellTopLeftPixelValid:8 width:3]);
  XCTAssertFalse([self.controller isCellTopLeftPixelValid:0 width:3]);
  XCTAssertFalse([self.controller isCellTopLeftPixelValid:1 width:3]);
  XCTAssertFalse([self.controller isCellTopLeftPixelValid:2 width:3]);
  XCTAssertFalse([self.controller isCellTopLeftPixelValid:3 width:3]);
  XCTAssertFalse([self.controller isCellTopLeftPixelValid:6 width:3]);
  
  //topright corner
  XCTAssertTrue([self.controller isCellTopRightPixelValid:3 width:3]);
  XCTAssertTrue([self.controller isCellTopRightPixelValid:4 width:3]);
  XCTAssertTrue([self.controller isCellTopRightPixelValid:6 width:3]);
  XCTAssertTrue([self.controller isCellTopRightPixelValid:7 width:3]);
  XCTAssertFalse([self.controller isCellTopRightPixelValid:0 width:3]);
  XCTAssertFalse([self.controller isCellTopRightPixelValid:1 width:3]);
  XCTAssertFalse([self.controller isCellTopRightPixelValid:2 width:3]);
  XCTAssertFalse([self.controller isCellTopRightPixelValid:5 width:3]);
  XCTAssertFalse([self.controller isCellTopRightPixelValid:8 width:3]);
}

- (void)testAdjacentBottomCornerPixels{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  //bottomleft corner
  XCTAssertTrue([self.controller isCellBottomLeftPixelValid:1 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomLeftPixelValid:2 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomLeftPixelValid:4 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomLeftPixelValid:5 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomLeftPixelValid:0 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomLeftPixelValid:3 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomLeftPixelValid:6 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomLeftPixelValid:7 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomLeftPixelValid:8 height:3 width:3]);
  
  //bottomright corner
  XCTAssertTrue([self.controller isCellBottomRightPixelValid:0 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomRightPixelValid:1 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomRightPixelValid:3 height:3 width:3]);
  XCTAssertTrue([self.controller isCellBottomRightPixelValid:4 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomRightPixelValid:2 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomRightPixelValid:5 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomRightPixelValid:6 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomRightPixelValid:7 height:3 width:3]);
  XCTAssertFalse([self.controller isCellBottomRightPixelValid:8 height:3 width:3]);
}

-(void)testBorderCase{
  // assume you have an 3x3 image with each pixel labeled 0-8 ordered by row, from left to right.
  XCTAssertTrue([self.controller isBorderCase:0 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:1 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:2 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:3 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:5 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:6 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:7 height:3 width:3]);
  XCTAssertTrue([self.controller isBorderCase:8 height:3 width:3]);
  
  //if its the middle cell
  XCTAssertFalse([self.controller isBorderCase:4 height:3 width:3]);
}

- (void)testTransparentPixel{
  //you have 2 pixels. one is transparent and one is not
  unsigned char* rawData = malloc(self.width * self.height * self.bytesPerPixel);
  rawData[3] = 0;//transparent
  rawData[7] = 1;//not transparent
  XCTAssertTrue([self.controller isTransparentPixel:0 data:rawData]);
  XCTAssertFalse([self.controller isTransparentPixel:1 data:rawData]);
  free(rawData);
}

- (void)testSetRawData{
  //you have 2 pixels, one set to black and one set to white
  unsigned char* rawData = malloc(self.width * self.height * self.bytesPerPixel);
  [self.controller setRawData:rawData index:0 red:0 green:0 blue:0]; //black color for the first pixel
  [self.controller setRawData:rawData index:4 red:255 green:255 blue:255]; //white color for second pixel
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
