//
//  CurveBallViewController.m
//  CurveBall
//
//  Created by Craig Campbell on 4/19/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import "CurveBallViewController.h"

#define paused 0
#define running 1

#define xSpeed 10
#define ySpeed 10
#define compSpeed 2

@implementation CurveBallViewController
@synthesize ball, ballBounds, squareBg, zSpeed, player_paddle, computer_paddle, tapToStart, ballVelocity, gameState, bounds, zLoc, purple;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
    }
    return self;
}*/


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.gameState = paused;
	[player_paddle setAlpha:0.75];
	[computer_paddle setAlpha:0.75];
	ballBounds = ball.bounds;
	bounds = CGRectMake(0,self.view.bounds.size.height, self.view.bounds.size.height, self.view.bounds.size.width);
	purple.frame = CGRectMake(0,0, self.view.bounds.size.height, self.view.bounds.size.width);
	ballVelocity = CGPointMake(xSpeed,ySpeed);
	zSpeed = -1;
	zLoc = 100;
	[NSTimer scheduledTimerWithTimeInterval: 0.03 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


-(void)gameLoop {
	if(gameState == running){
		zLoc = zLoc+zSpeed;
		ball.center = CGPointMake(ball.center.x + ballVelocity.x*(zLoc/100.0), ball.center.y + ballVelocity.y*(zLoc/100.0));
		//ball resizing
		int x = (int)(ball.center.x-ballBounds.size.width*(zLoc/100.0)/2.0);
		int y = (int)(ball.center.y-ballBounds.size.height*(zLoc/100.0)/2.0);
		ball.frame = CGRectMake(x,y,ballBounds.size.width*(zLoc/100.0),ballBounds.size.height*(zLoc/100.0));
		//new frame bounds
		int newWidth = (int)bounds.size.width*(zLoc/100.0);
		int newHeight = (int)bounds.size.height*(zLoc/100.0);
		int newX = (int)((bounds.size.width-newWidth)/2.0);
		int newY = (int)((bounds.size.height - newHeight)/2.0);
		purple.frame = CGRectMake(newX, newY, newWidth, newHeight);
		//bounds checking
		if(ball.center.x+ball.bounds.size.width/2 > newX+newWidth || ball.center.x-ball.bounds.size.width/2 < newX){
			ballVelocity.x = -ballVelocity.x;
			if(ball.center.x+ball.bounds.size.width/2 > newX+newWidth){
				ball.center = CGPointMake(newX+newWidth-ball.bounds.size.width/2,ball.center.y);
			}
			else ball.center = CGPointMake(newX+ball.bounds.size.width/2,ball.center.y);
		}
		if(ball.center.y+ball.bounds.size.height/2 > newY+newHeight || ball.center.y-ball.bounds.size.height/2 < newY){
			ballVelocity.y = -ballVelocity.y;
			if(ball.center.y+ball.bounds.size.height/2 > newY+newHeight){
				ball.center = CGPointMake(ball.center.x, newY+newHeight-ball.bounds.size.height/2);
			}
			else ball.center = CGPointMake(ball.center.x, newY+ball.bounds.size.height/2);
		}
		if(zLoc<=25){
			if(CGRectIntersectsRect(ball.frame, computer_paddle.frame))
				zSpeed = -zSpeed;
			
		}
		else if(zLoc>=100){
			if(CGRectIntersectsRect(ball.frame, player_paddle.frame))
				zSpeed = -zSpeed;
		}
		if(computer_paddle.center.x < ball.center.x && computer_paddle.center.x+computer_paddle.bounds.size.width/2 <= ((bounds.size.width-bounds.size.width*(.25))/2.0)+bounds.size.width*(.25)){
			computer_paddle.center = CGPointMake(computer_paddle.center.x+compSpeed,computer_paddle.center.y);
		}
		else if(computer_paddle.center.x-computer_paddle.bounds.size.width/2 >= ((bounds.size.width-bounds.size.width*(.25))/2.0))
			computer_paddle.center = CGPointMake(computer_paddle.center.x-compSpeed,computer_paddle.center.y);
		if(computer_paddle.center.y < ball.center.y && computer_paddle.center.y+computer_paddle.bounds.size.height/2 <= ((bounds.size.height-bounds.size.height*(.25))/2.0)+bounds.size.height*(.25)){
			computer_paddle.center = CGPointMake(computer_paddle.center.x, computer_paddle.center.y+compSpeed);
		}
		else if(computer_paddle.center.y-computer_paddle.bounds.size.height/2 >= ((bounds.size.height-bounds.size.height*(.25))/2.0))
			computer_paddle.center = CGPointMake(computer_paddle.center.x, computer_paddle.center.y-compSpeed);
	}
	else{
		if(tapToStart.hidden){
			tapToStart.hidden = NO;
		}
	}
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if(gameState == paused){
		tapToStart.hidden = YES;
		gameState = running;
	}
	else if(gameState==running){
		[self touchesMoved:touches withEvent:event];
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	player_paddle.center = [touch locationInView:touch.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
	[ball release];
	[player_paddle release];
	[computer_paddle release];
	[tapToStart release];
}

@end
