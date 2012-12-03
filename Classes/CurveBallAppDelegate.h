//
//  CurveBallAppDelegate.h
//  CurveBall
//
//  Created by Craig Campbell on 4/19/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CurveBallViewController;

@interface CurveBallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CurveBallViewController *viewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CurveBallViewController *viewController;

@end

