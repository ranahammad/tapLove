//
//  InstructionVC.m
//
//  Created by MacPro on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstructionVC.h"
#import "LoveMeterVC.h"
#import "iValentineViewController.h"

@implementation InstructionVC
@synthesize heartview;
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
- (void)dealloc {
    [super dealloc];
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
-(IBAction)popView;
{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)startAction;
{
	LoveMeterVC *lovemeter = [[LoveMeterVC alloc] initWithNibName:@"LoveMeterVC" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:lovemeter animated:YES];
	[lovemeter release];
}
@end
