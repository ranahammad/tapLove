//
//  iValentineViewController.h
//  iValentine
//
//  Created by MacPro on 1/17/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iValentineViewController : UIViewController {
	IBOutlet UIButton				*startBtn;
	IBOutlet UIButton				*instructionBtn;
	IBOutlet UIButton				*creditBtn;
}

-(IBAction)startAction:(id)sender;
-(IBAction)instructionAction:(id)sender;
-(IBAction)creditAction:(id)sender;
@end

