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

struct TileTypes TileTypes = {
  .ocean = 1,
  .mountain = 2,
  .coastal = 3
};


@implementation Tile

@synthesize view, imageView, indexLabel;
@synthesize index = _index,
            color = _color;

- (id) initWithIndex:(NSUInteger) index {
  self = [super init];
  if (self) {
    self.index = index;
    [[UINib nibWithNibName: @"TileView" bundle: nil] instantiateWithOwner: self options: nil];
    self.indexLabel.text = [NSString stringWithFormat: @"%u", index];
  }

  return self;
}

- (void) setColor:(UIColor *)color {
  if (_color == color)
    return;

  _color = color;

  self.view.backgroundColor = _color;
}

@end
