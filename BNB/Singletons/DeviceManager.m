//
//  DeviceManager.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DeviceManager.h"
#import "GCDSingleton.h"

@implementation DeviceManager

@synthesize ipad, iphone, ios4, ios5;

+ (id)defaultManager {
  DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
    return [[self alloc] init];
  });
}

- (id) init {
  self = [super init];
  if (self) {
    ios4 = YES;
    ios5 = NO;
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
      ios4 = NO;
      ios5 = YES;
    }

    ipad = NO;
    iphone = YES;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] &&
        [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
      ipad = YES;
      iphone = NO;
    }
  }

  return self;
}

@end
