//
//  CardController.m
//  iValentine
//
//  Created by MacPro on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CardController.h"


@implementation CardController
@synthesize cardView,fileName;
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
	NSString* path = [[NSBundle mainBundle] pathForResource:self.fileName ofType:@"png"];
	cardView.image = [UIImage imageWithContentsOfFile:path];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (id)initCardVC:(NSString*)imageName setDelegate:(id)new_delegate;
{
    if (self = [super initWithNibName:@"CardController" bundle:nil]) {
		delegate = new_delegate;
		self.fileName = imageName;
	}
    return self;
}
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
	[cardView release];
	cardView = nil;
    [super dealloc];
}


@end
