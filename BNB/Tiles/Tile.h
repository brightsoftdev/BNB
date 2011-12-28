//
//  Tile.h
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct TileSize {
  CGFloat width;
  CGFloat height;
} TileSize;

struct TileTypes {
  NSUInteger ocean;
  NSUInteger mountain;
  NSUInteger coastal;
} TileTypes;

@interface Tile : NSObject

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UILabel *indexLabel;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, strong) UIColor *color;

- (id) initWithIndex:(NSUInteger) index;

@end
