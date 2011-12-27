//
//  DeviceManager.h
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceManager : NSObject

@property (nonatomic, assign, readonly) BOOL ipad, iphone, ios4, ios5;

+ (DeviceManager *) defaultManager;

@end
