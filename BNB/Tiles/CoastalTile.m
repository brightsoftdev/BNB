//
//  CoastalTile.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CoastalTile.h"

@implementation CoastalTile

- (id) initWithIndex:(NSUInteger) index {
  self = [super initWithIndex: index];
  if (self) {
    self.color = [UIColor greenColor];
  }

  return self;
}

@end