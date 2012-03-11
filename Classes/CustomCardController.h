//
//  CustomCardController.h
//  iValentine
//
//  Created by MacPro on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CustomCardController : UIViewController <UIActionSheetDelegate,MFMailComposeViewControllerDelegate>{
	UIImageView						*cardImage;
	UILabel							*yourname;
	UILabel							*lovername;
	UILabel							*lovepercentage;
	IBOutlet UIImageView			*backgroundImage;
	
	UIImage *viewImage;
	IBOutlet UIImageView			*heartview;
	
	int iIndex;
	
}
@property (nonatomic) int iIndex;
@property (nonatomic, retain) UIImageView		*heartview;

@property (nonatomic, retain) IBOutlet UIImageView	*cardImage;
@property (nonatomic, retain) IBOutlet UILabel	*yourname;
@property (nonatomic, retain) IBOutlet UILabel	*lovername;
@property (nonatomic, retain) IBOutlet UILabel	*lovepercentage;
@property (nonatomic, retain) UIImage *viewImage;
@property (nonatomic, retain) UIImageView		*backgroundImage;
-(void)loadCardImage:(int)index;
-(UIImage*)captureScreen;
-(void)displayComposerSheet ;
-(void)heartAnimation;


-(IBAction)shareAction;
-(IBAction)popView:(id)sender;
-(IBAction)gotoMenu:(id)sender;
@end
