//
//  MountainTile.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MountainTile.h"

@implementation MountainTile

- (id) initWithIndex:(NSUInteger) index {
  self = [super initWithIndex: index];
  if (self) {
    self.color = [UIColor brownColor];
//    self.imageView.image = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"dirt" ofType: @"png"]];
  }

  return self;
}

@end
