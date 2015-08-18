//
//  primePalindromeTest.m
//  primePalindromeTest
//
//  Created by edward nguyen on 8/13/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Node.h"
#import "Stack.h"
@interface primePalindromeTest : XCTestCase
@property (nonatomic, strong) Stack* s;
@end

@implementation primePalindromeTest

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

- (void)testIsPalindrome {
  XCTAssertTrue(isPalindrome(self.s,929));
  XCTAssertTrue(isPalindrome(self.s,12321));
  XCTAssertTrue(isPalindrome(self.s,1));
}

- (void)testNotPalindrome {
  XCTAssertFalse(isPalindrome(self.s,1421));
  XCTAssertFalse(isPalindrome(self.s,21));
  XCTAssertFalse(isPalindrome(self.s,13211));
}

- (void)testIsPrime{
  XCTAssertTrue(isPrime(3));
  XCTAssertTrue(isPrime(31));
  XCTAssertTrue(isPrime(17));
}

- (void)testNotPrime{
  XCTAssertFalse(isPrime(4));
  XCTAssertFalse(isPrime(81));
  XCTAssertFalse(isPrime(55));
}

- (void)testIsLargestPrimePalindromeLessThanVal{
  XCTAssertEqual(getPrimePalindrome(1000),929);
  XCTAssertEqual(getPrimePalindrome(150),131);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
