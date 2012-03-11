//
//  CardsCollection.m
//  iValentine
//
//  Created by MacPro on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CardsCollection.h"
#import "CardController.h"
#import "CustomCardController.h"
#import "iValentineViewController.h"
const CGFloat kScrollHeight	=  334;//32.0;//32.0;

@implementation CardsCollection
@synthesize cardsViewsCollection,cardslist;
@synthesize heartview;
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
	cardsViewsCollection = [[NSMutableArray alloc] init];
	cardslist = [[NSMutableArray alloc] initWithObjects:@"S1",@"S2",@"S3",@"S4",@"S5",@"S6",
				 @"S7",@"S8",@"S9",@"S10",@"S11",nil];
	[self loadScrollerSettings];
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
						   [UIImage imageNamed:@"Heart_Frame_1.png"],nil];	heartview.animationImages = heartArray;
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
	[scroller release];
	scroller = nil;
	[pagecontroller release];
	pagecontroller = nil;
	[cardsViewsCollection removeAllObjects];
	[cardsViewsCollection release];
	cardsViewsCollection = nil;
	[cardslist removeAllObjects];
	[cardslist release];
	cardslist = nil;
    [super dealloc];
}

-(void)loadScrollerSettings;
{
	totalpages = [cardslist count];
	currentpagenumber = 0;
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	for (unsigned i = 0; i < totalpages; i++) {
		[controllers addObject:[NSNull null]];
	}
	self.cardsViewsCollection = controllers;
	
	CardController *controller;
	for (int j=0; j<[cardsViewsCollection count]; j++) {
		controller = [cardsViewsCollection objectAtIndex:j];
		if ((NSNull *)controller == [NSNull null]) {
			controller = [[CardController alloc] initCardVC:[cardslist objectAtIndex:j] setDelegate:self];
			[controller viewDidLoad];
			[cardsViewsCollection replaceObjectAtIndex:j withObject:controller];
			[controller release];
		}
		
	}
	
	
	// a page is the width of the scroll view
    scroller.pagingEnabled = YES;
	scroller.scrollEnabled = YES;
    scroller.contentSize = CGSizeMake(scroller.frame.size.width * totalpages, kScrollHeight);
	
	//Change1 YES to NO
    scroller.showsHorizontalScrollIndicator = NO;
	
    scroller.showsVerticalScrollIndicator = NO;
    scroller.scrollsToTop = NO;
    scroller.delegate = self;
	scroller.bounces = NO;
	
	pagecontroller.numberOfPages = totalpages;
    
	pagecontroller.currentPage = 0;
	
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    [self displayCardAtIndex:currentpagenumber];
	
	// update the scroll view to the appropriate page
	CGRect frame = scroller.frame;
	frame.origin.x = frame.size.width * currentpagenumber;
	frame.origin.y = 0;
	[scroller scrollRectToVisible:frame animated:YES];
}

- (void)displayCardAtIndex:(int)page {
    if (page < 0) return;
    if (page >= totalpages) return;
	
    // replace the placeholder if necessary
	if( ([cardsViewsCollection count] -1 )< page){
		return;
	}
    CardController *controller = [cardsViewsCollection objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
		controller = [[CardController alloc] initCardVC:[cardslist objectAtIndex:page] setDelegate:self];
		[controller view];
		[cardsViewsCollection replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
	
    // add the controller's view to the scroll view
    if (nil == controller.view.superview) {
        CGRect frame = scroller.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
		frame.size.height = kScrollHeight;
        controller.view.frame = frame;
        [scroller addSubview:controller.view];
		
		currentpagenumber = page;
    }
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
	if (ispagecontrolused) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scroller.frame.size.width;
	
    int page = floor(scroller.contentOffset.x / pageWidth)  ;
    pagecontroller.currentPage = page;
    currentpagenumber = page;
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self displayCardAtIndex:currentpagenumber];
}
// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	//EnvironmentPage *controller = [bfenvironmentviews objectAtIndex:bfcurrentpagenumber];
//	[controller loadpositions];
	
	ispagecontrolused = NO;
	NSLog(@"scrollViewDidEndDecelerating...........");
	
}


-(void)removeAllContents:(id)sender;
{
	NSArray *array = self.view.subviews;
	NSLog(@"Total Number of views : %d",[array count]);
	for (int i=2; i<[array count]; i++) {
		UIView *v = [array objectAtIndex:i];
		[v removeFromSuperview];
	}
}
-(IBAction)nextCard;
{
	if (currentpagenumber+1<totalpages) {
		currentpagenumber++;
		CGRect frame = scroller.frame;
		frame.origin.x = frame.size.width * currentpagenumber;
		frame.origin.y = 0;
		[scroller scrollRectToVisible:frame animated:YES];
		//[self displayCardAtIndex:currentpagenumber];
	}
}
-(IBAction)previousCard;
{
	if (currentpagenumber-1 >=0) {
		currentpagenumber--;
		CGRect frame = scroller.frame;
		frame.origin.x = frame.size.width * currentpagenumber;
		frame.origin.y = 0;
		[scroller scrollRectToVisible:frame animated:YES];
		//[self displayCardAtIndex:currentpagenumber];
	}
}

-(IBAction)nextMove:(id)sender;
{
	CustomCardController	*cusCardController = [[CustomCardController alloc] initWithNibName:@"CustomCardController" bundle:[NSBundle mainBundle]];
	[cusCardController setIIndex:currentpagenumber];
	[self.navigationController pushViewController:cusCardController animated:YES];
	[cusCardController loadCardImage:currentpagenumber];

	[cusCardController release];
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
