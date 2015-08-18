//
//  SOPMathComputation.m
//  SOPSumOfPrimes
//
//  Created by edward nguyen on 8/17/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "SOPMathComputation.h"

@implementation SOPMathComputation

- (bool) SOPisPrime:(int)number{
  if (number < 1) return false;
  double rootNumber = sqrt(number);
  for (int i = 2; i <= rootNumber; i++) {
    if (!(number % i)) {
      //is divisible, then not prime
      return false;
    }
  }
  return true;
}


@end
