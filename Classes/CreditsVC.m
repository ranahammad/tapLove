//
//  CreditsVC.m
//  iValentine
//
//  Created by MacPro on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreditsVC.h"
#import "iValentineViewController.h"

@implementation CreditsVC
@synthesize heart_animation;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
						   [UIImage imageNamed:@"Heart_Frame_1.png"],nil];	heart_animation.animationImages = heartArray;
	heart_animation.alpha = 0.7;
	heart_animation.animationDuration = 0.70; //1.1   2
	heart_animation.animationRepeatCount = 0;
	[heart_animation startAnimating];
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
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)openUrl;
{
}
-(IBAction)sendEmail;
{
}
-(IBAction)popView;
{
	[self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [super dealloc];
}

-(IBAction) creativeBugsClicked
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.creativebugs.net"]];
}

-(IBAction) spell09Clicked
{
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.azosh.net"]];
}

-(IBAction) feedbackClicked
{
	NSString *stringURL = @"mailto:feedback@creativebugs.net";
	NSURL *url = [NSURL URLWithString:stringURL];
	[[UIApplication sharedApplication] openURL:url];	
}

@end
