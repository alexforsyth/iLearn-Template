//
//  ExamTestViewController.h
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/10/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExamTestViewController : UIViewController

@property int ChapterNumber;
@property int NumberAnswered;
@property NSMutableArray *QuestionArray;
@property NSString *CurrentCorrectAnswer;
@property UIColor *CorrectLabelColor;
@property UIColor *InCorrectLabelColor;


/*
 Require:
 Modify:
 Effect:
 */

// =================
// Properties of the Testview
// =================
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UILabel *CorrectandIncorrectLabel;
@property (strong, nonatomic) IBOutlet UIButton *NextButtonOutlet;
- (IBAction)NextAction:(id)sender;

// main question
@property (strong, nonatomic) IBOutlet UILabel *MainQuestionAskingTextfield;
//A related
@property (strong, nonatomic) IBOutlet UIButton *buttonALabel;
- (IBAction)AButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *AAnswerTextView;
//B related
@property (strong, nonatomic) IBOutlet UIButton *buttonBLabel;
- (IBAction)BButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *BAnswerTextView;
//C related
@property (strong, nonatomic) IBOutlet UIButton *buttonCLabel;
- (IBAction)CButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *CAnswerTextView;
//D related
@property (strong, nonatomic) IBOutlet UIButton *buttonDLabel;
- (IBAction)DButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *DAnswerTextView;


@property (strong, nonatomic) IBOutlet UILabel *NumberAnsweredLabel;
@property (strong, nonatomic) IBOutlet UILabel *NumberCorrectLabel;
@property (strong, nonatomic) IBOutlet UILabel *SlashCorrect;


@property (strong, nonatomic) IBOutlet UILabel *DoneCorrect;
@property (strong, nonatomic) IBOutlet UILabel *DoneAnswered;
@property (strong, nonatomic) IBOutlet UILabel *DonePercentage;

@property (strong, nonatomic) IBOutlet UILabel *DoneMainLabel;
@property (strong, nonatomic) IBOutlet UILabel *DoneNumCorrectLabel;
@property (strong, nonatomic) IBOutlet UILabel *DoneNumAnsweredLabel;
@property (strong, nonatomic) IBOutlet UILabel *DonePercentageLabel;


@end
