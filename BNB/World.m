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

struct Directions {
  NSUInteger northwest;
  NSUInteger north;
  NSUInteger northeast;
  NSUInteger east;
  NSUInteger southeast;
  NSUInteger south;
  NSUInteger southwest;
  NSUInteger west;
} Directions = { 1, 2, 3, 4, 5, 6, 7, 8 };


@implementation World

@synthesize tiles = _tiles,
            width = _width,
           height = _height;


- (NSUInteger) rowForIndex:(NSUInteger) index {
  return index / self.width;
}

- (NSUInteger) columnForIndex:(NSUInteger) index {
  return index % self.width;
}

- (NSInteger) adjacentTile:(NSUInteger) index
                  direction:(NSUInteger) direction {
  NSUInteger row = [self rowForIndex: index];
  NSUInteger column = [self columnForIndex: index];
  NSInteger result = NSNotFound;

  if (direction == Directions.northwest) {
    if (column > 0 && row > 0) {
      result = index - (self.width+1);
    }
  } else if (direction == Directions.north) {
    if (row > 0) {
      result = index - self.width;
    }
  } else if (direction == Directions.northeast) {
    if (column < (self.width - 1) && row > 0) {
      result = index - (self.width - 1);
    }
  } else if (direction == Directions.east) {
    if (column < (self.width - 1)) {
      result = index + 1;
    }
  } else if (direction == Directions.southeast) {
    if (column < (self.width - 1) && row < (self.height - 1)) {
      result = index + (self.width + 1);
    }
  } else if (direction == Directions.south) {
    if (row < (self.height - 1)) {
      result = index + self.width;
    }
  } else if (direction == Directions.southwest) {
    if (row < (self.height - 1) && column > 0) {
      result = index + (self.width - 1);
    }
  } else if (direction == Directions.west) {
    if (column > 0) {
      result = index - 1;
    }
  }

  return result;
}

- (Tile *) generateTile:(NSUInteger) index {
  Tile *tile;
  NSUInteger row = [self rowForIndex: index];
  NSUInteger column = [self columnForIndex: index];

  if (row == 0 ||
      row == (self.height - 1) ||
      column == 0 ||
      column == (self.width - 1)) {
    tile = [[OceanTile alloc] initWithIndex: index];
    return tile;
  }

  NSUInteger tileType = (rand() % (sizeof(TileTypes)/sizeof(NSUInteger)))+1;

  if (tileType == TileTypes.ocean)
    tile = [[OceanTile alloc] initWithIndex: index];
  else if (tileType == TileTypes.mountain)
    tile = [[MountainTile alloc] initWithIndex: index];
  else if (tileType == TileTypes.coastal)
    tile = [[CoastalTile alloc] initWithIndex: index];

  return tile;
}

- (id) initWithWidth:(NSUInteger) width
              height:(NSUInteger) height {
  self = [super init];
  if (self) {
    _width = width;
    _height = height;
  }

  return self;
}

- (void) generate:(UIScrollView *) mapView {
  srand(time(NULL));

  NSMutableArray *tiles = [[NSMutableArray alloc] initWithCapacity: self.width * self.height];
  NSUInteger index = 0;

  for (NSUInteger y = 0; y < self.height; y++) {
    for (NSUInteger x = 0; x < self.width; x++) {
      Tile *tile = [self generateTile: index];

      [tiles addObject: tile];
      tile.view.frame = CGRectMake(x*TileSize.width, y*TileSize.height, TileSize.width, TileSize.height);
      [mapView addSubview: tile.view];
      index++;
    }
  }

  _tiles = [[NSArray alloc] initWithArray: tiles];
}

@end
