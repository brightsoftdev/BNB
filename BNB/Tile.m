//
//  Tile.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Tile.h"

struct TileSize TileSize = {
  .width = 64,
  .height = 64
};

@implementation Tile

@synthesize view, indexLabel;
@synthesize index = _index;

- (id) initWithIndex:(NSUInteger) index {
  self = [super init];
  if (self) {
    self.index = index;
    [[UINib nibWithNibName: @"TileView" bundle: nil] instantiateWithOwner: self options: nil];
    self.indexLabel.text = [NSString stringWithFormat: @"%u", index];
  }

  return self;
}

@end
