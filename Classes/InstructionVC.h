//
//  InstructionVC.h
//
//  Created by MacPro on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface InstructionVC : UIViewController {
	IBOutlet UIImageView			*heartview;
}
@property (nonatomic,retain) UIImageView *heartview;
-(IBAction)popView;
-(IBAction)startAction;
-(void)heartAnimation;
-(IBAction)gotoMenu:(id)sender;

@end
