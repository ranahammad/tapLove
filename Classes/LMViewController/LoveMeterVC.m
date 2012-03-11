//
//  LoveMeterVC.m
//  iValentine
//
//  Created by MacPro on 1/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoveMeterVC.h"
#import "CardsCollection.h"
#import "iValentineAppDelegate.h"
#import "iValentineViewController.h"


@implementation LoveMeterVC

@synthesize nametf1,nametf2;
@synthesize notAllowedCharacters;	
@synthesize loveNiddle,heartview;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.notAllowedCharacters = @"!`~@#$%^7*()_-+=|\\}]{[\"':;/?.>,<1234567890";
	[self resetAction:nil];
	[self heartAnimation];
}
-(void)heartAnimation;
{
	NSArray *heartArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"Heart_Frame_1.png"],
						   [UIImage imageNamed:@"Heart_Frame_2.png"],
						   [UIImage imageNamed:@"Heart_Frame_3.png"],
						   [UIImage imageNamed:@"Heart_Frame_4.png"],
						   [UIImage imageNamed:@"Heart_Frame_5.png"],
						   [UIImage imageNamed:@"Heart_Frame_5.png"],
						   [UIImage imageNamed:@"Heart_Frame_4.png"],
						   [UIImage imageNamed:@"Heart_Frame_3.png"],
						   [UIImage imageNamed:@"Heart_Frame_2.png"],
						   [UIImage imageNamed:@"Heart_Frame_1.png"],nil];
	heartview.animationImages = heartArray;
	heartview.alpha = 0.7;
	heartview.animationDuration = 0.70; //1.1   2
	heartview.animationRepeatCount = 0;
	[heartview startAnimating];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
{
	
}
- (void)textFieldDidEndEditing:(UITextField *)textField;   
{
	if (textField==nametf1) {
		NSLog(@"Do Calculation of FirstName");
		[self isValidName:nametf1.text];
	}else if (textField == nametf2) {
		NSLog(@"Do Calculation of SecondName");
	}
}
-(void)checkNameValidation:(NSString*)name;
{
	if (![self isValidName:name]) {
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!"
															message:@"Please enter a valid name." 
														   delegate:self cancelButtonTitle:@"OK" 
												  otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
}
-(BOOL)isValidName:(NSString*)name;
{
	NSString *nameChar;
	for (int i=0; i<[name length]; i++) {
		nameChar = [name substringWithRange: NSMakeRange (i, 1)];
		
		NSRange match;
		
		match = [self.notAllowedCharacters rangeOfString: nameChar];
		
		if (match.location != NSNotFound)	
			return NO;
	}
	
	return YES;
}
-(int)loveCount:(NSString*)name;
{
	name = [name uppercaseString];
	NSString *letter = @"";
	int loveCountVal = 0;
	int extrapoint = 0;
	for (int count=0; count<[name length]; count++) {
		letter = [name substringWithRange:NSMakeRange(count,1)];
		if ([letter isEqualToString:@"I"])
			loveCountVal += 2;
		else if ([letter isEqualToString:@"L"])
			loveCountVal +=2;
		else if ([letter isEqualToString:@"O"])
			loveCountVal +=3;
		else if ([letter isEqualToString:@"V"])
			loveCountVal +=2;
		else if ([letter isEqualToString:@"E"])
			loveCountVal +=2;
		else if ([letter isEqualToString:@"Y"])
			loveCountVal +=2;
		else if ([letter isEqualToString:@"U"])
			loveCountVal +=2;
		else {
//			loveCountVal +=1;
			extrapoint++;
			if (extrapoint==2) {
				loveCountVal +=1;
				extrapoint = 0;
			}
		}
	}
	return loveCountVal;
}
-(int)getPercentage:(int)accumulatedLove;
{
	int loverpercentage = 0;
	int name1Length = [nametf1.text length];
	int name2Length = [nametf2.text length];
	if(accumulatedLove>0) loverpercentage = 5-((name1Length+name2Length)/2);
	if(accumulatedLove>2) loverpercentage = 10-((name1Length+name2Length)/2);
	if(accumulatedLove>4) loverpercentage = 20-((name1Length+name2Length)/2);
	if(accumulatedLove>6) loverpercentage = 30-((name1Length+name2Length)/2);
	if(accumulatedLove>8) loverpercentage = 40-((name1Length+name2Length)/2);
	if(accumulatedLove>10) loverpercentage = 50-((name1Length+name2Length)/2);
	if(accumulatedLove>12) loverpercentage = 60-((name1Length+name2Length)/2);
	if(accumulatedLove>14) loverpercentage = 70-((name1Length+name2Length)/2);
	if(accumulatedLove>16) loverpercentage = 80-((name1Length+name2Length)/2);
	if(accumulatedLove>18) loverpercentage = 90-((name1Length+name2Length)/2);
	if(accumulatedLove>20) loverpercentage = 100-((name1Length+name2Length)/2);
	if(accumulatedLove>22) loverpercentage = 110-((name1Length+name2Length)/2);
	
	if (loverpercentage < 0) {
		return 0;
	}else if (loverpercentage > 99) {
		return 99;
	}
	return loverpercentage;
}
-(IBAction)calculateLove:(id)sender;
{
	int name1LoveCount = [self loveCount:nametf1.text];
	int name2LoveCount = [self loveCount:nametf2.text];
	lovePercentage = [self getPercentage:name1LoveCount+name2LoveCount];
//	CGFloat degrees = 0.0;
	int degrees = 0;
	if (lovePercentage<50.0) {
		degrees = (int)(1.38*lovePercentage) - 70;
	}else {
		degrees = abs((1.38*lovePercentage) - 70);
	}
	
	[self animateNiddle:degrees];
}

-(void)performAnimation
{
	if(fStartAngle == fDegree)
	{
		if(fDegree != 0)
		{
			UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!" 
																message:[NSString stringWithFormat:@"%@ & %@ has %.0f%% Love",nametf1.text,nametf2.text,lovePercentage] 
															   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alertView show];
			[alertView release];
		}

		iValentineAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		appDelegate.yourname = self.nametf1.text;
		appDelegate.lovername = self.nametf2.text;
		int d = lovePercentage;
		appDelegate.percentage = [NSString stringWithFormat:@"%d",d];		
	}	
	else {
		fStartAngle++;
		CGAffineTransform rotate = CGAffineTransformMakeRotation( fStartAngle / 180.0 *   3.14159265);	
		[loveNiddle setTransform:rotate];
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:self
									   selector:@selector(performAnimation)
									   userInfo:nil
										repeats:NO];
	}
}

-(void)animateNiddle:(CGFloat)degree;
{
	[nametf2 resignFirstResponder];

	fDegree = degree;
	fStartAngle = -70;
	[NSTimer scheduledTimerWithTimeInterval:0.1 
									 target:self
								   selector:@selector(performAnimation)
								   userInfo:nil
									repeats:NO];

}
-(IBAction)resignFirstResponder:(id)sender
{
	if ([sender respondsToSelector:@selector(resignFirstResponder)])
		[sender resignFirstResponder];
}	
-(IBAction)resetAction:(id)sender;
{
	lovePercentage = 0.0;
	[nametf1 setText:@""];
	[nametf2 setText:@""];
//	[self animateNiddle:-70.0];
	fStartAngle = 0;
	fDegree = 0;
	[self performAnimation];
	
	fStartAngle = -70;
	CGAffineTransform rotate = CGAffineTransformMakeRotation( -70.0 / 180.0 *   3.14159265);	
	[loveNiddle setTransform:rotate];
}
-(IBAction)nextMove:(id)sender;
{
	CardsCollection *collection = [[CardsCollection alloc] 
								   initWithNibName:@"CardsCollection" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:collection animated:YES];
	[collection release];
}
-(IBAction)popView:(id)sender;
{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoMenu:(id)sender;
{
	iValentineViewController *menuController;
	NSArray *controllers = [self.navigationController viewControllers];
	for (int i = 0; i< [controllers count]; i++) {
		menuController = [controllers objectAtIndex:i];
		if ([menuController isKindOfClass:[iValentineViewController class]]	) {
			menuController = (iValentineViewController*)menuController;
			[self.navigationController popToViewController:menuController animated:YES];
			return;
		}
	}
}
- (void)dealloc {
	[heartview stopAnimating];
	[heartview.animationImages release];
	[heartview release];
	heartview = nil;
	[nametf1 release];
	nametf1 = nil;
	[nametf2 release];
	nametf2 = nil;
	[notAllowedCharacters release];
	notAllowedCharacters = nil;
	[loveNiddle release];
	loveNiddle = nil;
	
    [super dealloc];
}


@end
