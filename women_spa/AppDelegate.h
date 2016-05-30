//
//  AppDelegate.h
//  women_spa
//
//  Created by himal on 5/23/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
