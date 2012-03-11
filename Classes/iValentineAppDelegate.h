//
//  iValentineAppDelegate.h
//  iValentine
//
//  Created by MacPro on 1/17/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iValentineViewController;

@interface iValentineAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iValentineViewController *viewController;
	UINavigationController *navController;
	NSString	*yourname;
	NSString	*lovername;
	NSString	*percentage;
}
@property (nonatomic, retain) NSString	*yourname;
@property (nonatomic, retain) NSString	*lovername;
@property (nonatomic, retain) NSString	*percentage;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iValentineViewController *viewController;
@property (nonatomic, retain) UINavigationController *navController;;

@end

