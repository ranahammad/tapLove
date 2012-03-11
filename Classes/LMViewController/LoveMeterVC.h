//
//  LoveMeterVC.h
//  iValentine
//
//  Created by MacPro on 1/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoveMeterVC : UIViewController <UITextFieldDelegate>{
	IBOutlet UITextField						*nametf1;
	IBOutlet UITextField						*nametf2;
	NSString									*notAllowedCharacters;
	CGFloat lovePercentage;
	IBOutlet UIImageView									*loveNiddle;
	IBOutlet UIImageView						*heartview;
	
	CGFloat fDegree;
	CGFloat fStartAngle;
	
}
@property (nonatomic, retain) UITextField		*nametf1;
@property (nonatomic, retain) UITextField		*nametf2;
@property (nonatomic, retain) NSString			*notAllowedCharacters;
@property (nonatomic, retain) UIImageView		*loveNiddle;
@property (nonatomic, retain) UIImageView		*heartview;
-(void)animateNiddle:(CGFloat)degree;
-(BOOL)isValidName:(NSString*)name;
-(void)heartAnimation;


-(IBAction)calculateLove:(id)sender;
-(IBAction)resetAction:(id)sender;
-(IBAction)nextMove:(id)sender;
-(IBAction)popView:(id)sender;
-(IBAction)gotoMenu:(id)sender;
-(IBAction)resignFirstResponder:(id)sender;

@end
