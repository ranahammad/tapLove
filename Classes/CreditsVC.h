//
//  CreditsVC.h
//  iValentine
//
//  Created by MacPro on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreditsVC : UIViewController {
	IBOutlet UIImageView					*heart_animation;
}
@property (nonatomic, retain)UIImageView	*heart_animation;
-(IBAction)openUrl;
-(IBAction)sendEmail;
-(IBAction)popView;
-(void)heartAnimation;
-(IBAction)gotoMenu:(id)sender;

-(IBAction) creativeBugsClicked;
-(IBAction) feedbackClicked;
-(IBAction) spell09Clicked;

@end
