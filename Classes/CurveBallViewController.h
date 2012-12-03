//
//  CurveBallViewController.h
//  CurveBall
//
//  Created by Craig Campbell on 4/19/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurveBallViewController : UIViewController {
	IBOutlet UIImageView *ball;
	IBOutlet UIImageView *player_paddle;
	IBOutlet UIImageView *computer_paddle;
	IBOutlet UILabel *tapToStart;
	IBOutlet UIImageView *purple;
	
	int zSpeed;
	int zLoc;
	CGPoint ballVelocity;
	NSInteger gameState;
	CGRect bounds;
	CGRect ballBounds;
	CGRect squareBg;
}

@property(nonatomic, retain) IBOutlet UIImageView *ball;
@property(nonatomic, retain) IBOutlet UIImageView *player_paddle;
@property(nonatomic, retain) IBOutlet UIImageView *computer_paddle;
@property(nonatomic, retain) IBOutlet UILabel *tapToStart;
@property(nonatomic, retain) IBOutlet UIImageView *purple;

@property(nonatomic) CGPoint ballVelocity;
@property(nonatomic) NSInteger gameState;
@property(nonatomic) CGRect bounds;
@property(nonatomic) int zLoc;
@property(nonatomic) int zSpeed;
@property(nonatomic) CGRect ballBounds;
@property(nonatomic) CGRect squareBg;
@end

