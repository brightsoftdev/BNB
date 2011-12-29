//
//  MapViewController.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "DeviceManager.h"
#import "World.h"
#import "Tile.h"


@implementation MapViewController

@synthesize scrollView, worldView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];

  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewDidLoad {
  [super viewDidLoad];

  self.scrollView.bounces = NO;

  CGSize boardSize = CGSizeMake(50, 50);
  self.scrollView.contentSize = CGSizeMake(boardSize.width * TileSize.width, boardSize.height * TileSize.height);

  self.worldView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height)];
  World *world = [[World alloc] initWithWidth: boardSize.width height: boardSize.height];
  [world generate: self.worldView];
  [self.scrollView addSubview: self.worldView];

  if ([DeviceManager defaultManager].ipad) {
    self.scrollView.frame = CGRectMake(0, -20, 1024, 768);
  }
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
          interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.worldView;
}

@end
