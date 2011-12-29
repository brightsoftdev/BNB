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
//    self.imageView.image = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"grass" ofType: @"png"]];
  }

  return self;
}

@end
