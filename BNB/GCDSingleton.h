//
//  GCDSingleton.h
//  SBNation
//
//  Created by Sean Soper on 10/24/11.
//  Copyright (c) 2011 Sean Soper. All rights reserved.
//

// Shamelessly pulled from https://gist.github.com/1057420

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
  static dispatch_once_t pred = 0; \
  __strong static id _sharedObject = nil; \
  dispatch_once(&pred, ^{ \
    _sharedObject = block(); \
  }); \
  return _sharedObject;