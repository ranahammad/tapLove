//
//  iValentineViewController.m
//  iValentine
//
//  Created by MacPro on 1/17/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "iValentineViewController.h"
#import "LoveMeterVC.h"
#import "InstructionVC.h"
#import "CreditsVC.h"

@implementation iValentineViewController


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
//	[agent login];
	//return [NSData dataWithContentsOfFile:filePath options:0 error:nil];
//
//	UIImage *newImage = [UIImage imageNamed:@"Needle_Controler.png"];
//	NSData *data = UIImagePNGRepresentation(newImage);
	
	

	//[agent uploadPhoto:@"http://www.nasa.gov/images/content/312934main_image_1283-946.jpg" withStatus:@""];
//	[agent uploadPhotoAsData:data withCaption:@"" toAlbum:@""];
	//NSMutableDictionary *args = [[[NSMutableDictionary alloc] init] autorelease];
//	[args setObject:@"caption" forKey:@"caption"];      
//	FBRequest *uploadPhotoRequest = [FBRequest requestWithDelegate:self];
//	[uploadPhotoRequest call:@"photos.upload" params:args dataParam:data];
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(IBAction)startAction:(id)sender;
{
	
	LoveMeterVC	*loveMeter = [[LoveMeterVC alloc] initWithNibName:@"LoveMeterVC" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:loveMeter animated:YES];
	[loveMeter release];
}
-(IBAction)instructionAction:(id)sender;
{
	InstructionVC *instruction = [[InstructionVC alloc] initWithNibName:@"InstructionVC" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:instruction animated:YES];
	[instruction release];
}
-(IBAction)creditAction:(id)sender;
{
	CreditsVC *creditController = [[CreditsVC alloc] initWithNibName:@"CreditsVC" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:creditController animated:YES];
	[creditController release];
}
- (void)dealloc {
    [super dealloc];
}

@end
