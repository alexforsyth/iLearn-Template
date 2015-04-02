//
//  SummaryViewController.h
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/11/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController
@property int ChapterNumber;
- (IBAction)GoToReviewTest:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *TextField;

@end
