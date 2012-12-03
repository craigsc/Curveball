//
//  CurveBallAppDelegate.m
//  CurveBall
//
//  Created by Craig Campbell on 4/19/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import "CurveBallAppDelegate.h"
#import "CurveBallViewController.h"

@implementation CurveBallAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
