//
//  CardsCollection.h
//  iValentine
//
//  Created by MacPro on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CardsCollection : UIViewController<UIScrollViewDelegate> {
	IBOutlet UIScrollView						*scroller;
	IBOutlet UIPageControl						*pagecontroller;
	int											currentpagenumber;
	int											totalpages;
	BOOL										ispagecontrolused;
	
	NSMutableArray								*cardsViewsCollection; //it contains Environment Views
	NSMutableArray								*cardslist; //it contains Cards List.
	
	IBOutlet UIImageView						*heartview;
}
@property (nonatomic, retain) NSMutableArray	*cardsViewsCollection;
@property (nonatomic, retain) UIImageView		*heartview;
@property (nonatomic, retain) NSMutableArray	*cardslist;
-(void)loadScrollerSettings;
-(void)displayCardAtIndex:(int)page;
-(void)removeAllContents:(id)sender;
-(void)heartAnimation;


-(IBAction)nextCard;
-(IBAction)previousCard;


-(IBAction)nextMove:(id)sender;
-(IBAction)popView:(id)sender;
-(IBAction)gotoMenu:(id)sender;
@end
