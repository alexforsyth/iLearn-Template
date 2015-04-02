//
//  hideAppDelegate.h
//  iLearnTemplate
//
//  Created by Alexander Forsyth on 6/17/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

/*
 Notes:
 Look at memory leakages - 
 Edit: got rid of all dynamically allocated memory - Worked around scoring
 Edit: Xcode should make sure zombie memory doesnt stick around. Double check by hand later
 // investigate calling for didReceiveMemoryWarning::
 // reuse identifiers on prototype cells
 // relocalize the view for the FRQs - ImageviewController is bugging out sometimes
 // optimization probabaly isnt needed here, good to have if we're continuing later
 */

#import <UIKit/UIKit.h>

@interface hideAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end
