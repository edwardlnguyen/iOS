//
//  testStackAndNode.m
//  primePalindrome
//
//  Created by edward nguyen on 8/13/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Node.h"
#import "Stack.h"
@interface testStackAndNode : XCTestCase
@property (nonatomic,strong) Stack* s;
@end

@implementation testStackAndNode

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  self.s = [[Stack alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  self.s = nil;
  [super tearDown];
}


-(void)testPushStackPopStack{
  //stack starts empty => test node creation => test pushStack
  XCTAssertEqual([self.s sizeStack],0);
  Node* temp = [[Node alloc]initWithString:@"asdf"];
  [self.s pushStack:temp];
  XCTAssertEqual([self.s sizeStack],1);
  
  //testing popStack
  Node* top = [self.s popStack];
  XCTAssertEqual([self.s sizeStack], 0);
  XCTAssertEqual([top digit], @"asdf");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
