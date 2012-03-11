//
//  CardController.h
//  iValentine
//
//  Created by MacPro on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CardController : UIViewController {
	IBOutlet UIImageView				*cardView;
	id									delegate;
	NSString							*fileName;
}
@property (nonatomic, retain) UIImageView *cardView;
@property (nonatomic, retain) NSString	*fileName;
- (id)initCardVC:(NSString*)imageName setDelegate:(id)new_delegate;
@end
