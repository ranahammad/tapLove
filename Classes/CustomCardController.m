//
//  CustomCardController.m
//  iValentine
//
//  Created by MacPro on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCardController.h"
#import "FacebookAgent.h"
#import "iValentineAppDelegate.h"
#import "iValentineViewController.h"
#import "iValentineConstants.h"
#import "QuartzCore/QuartzCore.h"

@implementation CustomCardController
@synthesize cardImage;
@synthesize yourname,
lovername,
lovepercentage,backgroundImage,
viewImage,heartview;
@synthesize iIndex;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	iValentineAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	if(iIndex == 9)
	{
		self.yourname.textColor = [UIColor whiteColor];
		self.lovername.textColor = [UIColor whiteColor];
		self.lovepercentage.textColor = [UIColor whiteColor];
	}
	self.yourname.text = appDelegate.yourname;
	self.lovername.text = appDelegate.lovername;
	self.lovepercentage.text = [NSString stringWithFormat:@"%@ %%",appDelegate.percentage]; 
	[self heartAnimation];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

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


- (void)dealloc {
	[cardImage release];
	cardImage = nil;
	[yourname release];
	yourname = nil;
	[lovername release];
	lovername = nil;
	[lovepercentage release];
	lovepercentage = nil;
	[backgroundImage release];
	backgroundImage = nil;	
	[viewImage release];
	viewImage = nil;
	
    [super dealloc];
}
-(void)loadCardImage:(int)index;
{
	NSString* path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"L%d",index+1] ofType:@"png"];
	cardImage.image = [UIImage imageWithContentsOfFile:path];
}
-(IBAction)shareAction;
{
	[self captureScreen];
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Action Sheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save As for MMS",@"Share on Facebook",@"Email Card",nil];
	actionSheet.delegate = self;
	[actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	//	NSLog(@"%d",buttonIndex);
	if(buttonIndex==0){
		NSData* myData = UIImagePNGRepresentation(viewImage);
		UIImage *image = [UIImage imageWithData:myData];
		UIImageWriteToSavedPhotosAlbum(image, nil,nil,nil);
	}
	else if(buttonIndex == 1)
	{
		FacebookAgent *agent = [[FacebookAgent alloc] initWithApiKey:FB_API_KEY ApiSecret:FB_API_SECRET ApiProxy:nil];
		[agent uploadPhotoAsData:UIImagePNGRepresentation(viewImage)
					  withStatus:nil
						 caption:[NSString stringWithFormat:@"I am sharing my %@ love for %@ via Tap Love - www.creativebugs.net/apps/taplove",lovepercentage.text,lovername.text] 
						 toAlbum:nil];
	}
	else if(buttonIndex ==2)
	{
		[self displayComposerSheet];
	//	EmailClient *emailClient = [[EmailClient alloc] init];
//		[emailClient showPicker:testUIControlView :self._msharingText];
	}
	
}

#pragma mark -
#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)displayComposerSheet 
{
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:CC_SUBJECT];
	
	
	// Set up recipients
	/*NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"]; 
	NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil]; 
	NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"]; 
	
	[picker setToRecipients:toRecipients];
	[picker setCcRecipients:ccRecipients];	
	[picker setBccRecipients:bccRecipients];*/
	
	// Attach an image to the email
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
	//UIImage *image = [viewImage retain];
   // NSData *myData = (NSData*)image;// [NSData dataWithContentsOfFile:path];
	//UIImage *image = [UIImage imageWithData:viewImageData];
	NSData* myData = UIImagePNGRepresentation(viewImage);
	[picker addAttachmentData:myData mimeType:@"image/png" fileName:@"LoveCard"];
	
	// Fill out the email body text
	//NSString *emailBody = ;
	[picker setMessageBody:CC_DEFAULT_MSG_BODY isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
    [picker release];
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	NSString *message;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			message = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			message = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			message = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
			message = @"Result: failed";
			break;
		default:
			message = @"Result: not sent";
			break;
	}
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Message" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	[self dismissModalViewControllerAnimated:YES];
}


-(UIImage*)captureScreen;
{	[self.view bringSubviewToFront:self.backgroundImage];
	[self.view bringSubviewToFront:self.cardImage];
	[self.view bringSubviewToFront:self.lovername];
	[self.view bringSubviewToFront:self.yourname];
	[self.view bringSubviewToFront:self.lovepercentage];
	UIGraphicsBeginImageContext(self.view.frame.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	//if (self.viewImage) {
//		[self.viewImage release];
//		self.viewImage = nil;
//	}
	self.viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	[self.view sendSubviewToBack:self.lovername];
	[self.view sendSubviewToBack:self.yourname];
	[self.view sendSubviewToBack:self.lovepercentage];
	[self.view sendSubviewToBack:self.cardImage];
	[self.view sendSubviewToBack:self.backgroundImage];

	//[self.view sendSubviewToBack:self.cardImage];
	//UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
	return viewImage;
}
#pragma mark Clock Hands controlling via Touch count

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{	
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	UITouch *toucheA = [[event allTouches] anyObject];
	
    if ([toucheA view] == yourname) {
        CGPoint location = [toucheA locationInView:self.view];
        yourname.center = location;
	}else if ([toucheA view] == lovername) {
		CGPoint location = [toucheA locationInView:self.view];
        lovername.center = location;
	}else if ([toucheA view] == lovepercentage) {
		CGPoint location = [toucheA locationInView:self.view];
        lovepercentage.center = location;
	}	
}	


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
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
@end
