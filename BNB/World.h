//
//  World.h
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface World : NSObject

@property (nonatomic, strong) NSArray *tiles;
@property (nonatomic, assign) NSUInteger width, height;

- (id) initWithWidth:(NSUInteger) width
              height:(NSUInteger) height;

- (void) generate:(UIScrollView *) mapView;

@end
