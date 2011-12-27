//
//  World.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "World.h"
#import "Tile.h"
#import "OceanTile.h"
#import "MountainTile.h"
#import "CoastalTile.h"


@implementation World

@synthesize tiles;
@synthesize width = _width,
           height = _height;


- (id) initWithWidth:(NSUInteger) width
              height:(NSUInteger) height {
  self = [super init];
  if (self) {
    self.width = width;
    self.height = height;
  }

  return self;
}

- (void) generate:(UIScrollView *) mapView {
  srand(time(NULL));
  NSUInteger index = 0;
  for (NSUInteger y = 0; y < self.height; y++) {
    for (NSUInteger x = 0; x < self.width; x++) {
      index++;

      Tile *tile;
      NSUInteger tileType = rand() % 3;
      switch (tileType) {
        case 0:
          tile = [[OceanTile alloc] initWithIndex: index];
          break;
          
        case 1:
          tile = [[MountainTile alloc] initWithIndex: index];
          break;
          
        case 2:
          tile = [[CoastalTile alloc] initWithIndex: index];
          break;
      }

      tile.view.frame = CGRectMake(x*TileSize.width, y*TileSize.height, TileSize.width, TileSize.height);
      [mapView addSubview: tile.view];
    }
  }
}

@end
