//
//  ExamTestViewController.m
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/10/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "ExamTestViewController.h"

@interface ExamTestViewController ()

@end

@implementation ExamTestViewController
@synthesize ChapterNumber;
@synthesize QuestionArray;
@synthesize CurrentCorrectAnswer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
     
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    _CorrectLabelColor = [UIColor colorWithRed:27.0/255 green:221.0/255.0 blue:10.0/255 alpha:1.0];
    _InCorrectLabelColor = [UIColor colorWithRed:(255/255.0) green:(70/255.0) blue:(80/255.0) alpha:0.9];
   
    
    QuestionArray = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view.
    //ChapterNumber = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _NumberAnsweredLabel.text = @"0";
    _NumberCorrectLabel.text = @"0";
    
    
    
    NSString *MegaStringPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"TestChp%i",ChapterNumber] ofType:@"txt"];
    NSString *MegaString = [NSString stringWithContentsOfFile:MegaStringPath encoding:NSUTF8StringEncoding error:nil];
    
    // NSLog(@"Contents:%@ of %@ ", MegaStringPath, MegaString);
    // programmer's choice to use the string XXXY as a separator. see specs on data grab for why
    NSArray *FirstParsedArray = [MegaString componentsSeparatedByString:@"XXXY"];
    
    for (int i = 0; i < FirstParsedArray.count; i++) {
        NSArray *secParsedArray = [[FirstParsedArray objectAtIndex:i] componentsSeparatedByString:@"<>"];
        
        for (int i = 1; i<secParsedArray.count; i++) {
            if ([[secParsedArray objectAtIndex:i] length] > 150) {
                //assert(0); // throws an error here
                NSLog(@"WARNING: THIS ANSWER IS TOO LONG: %lu, %@", (unsigned long)[[secParsedArray objectAtIndex:i] length], [secParsedArray objectAtIndex:i]);
            }
        }
        
        NSMutableArray *RandomizedArray = [NSMutableArray arrayWithArray:secParsedArray];
        [RandomizedArray removeObjectAtIndex:0];
        [self RandomizeThisMutableArray:RandomizedArray];
        [RandomizedArray insertObject:[secParsedArray objectAtIndex:0] atIndex:0];
        [QuestionArray addObject:RandomizedArray];
        
        
    }
    
    NSLog(@"Check To See if the Question Array Is Formatted Correctly with breakpoint here");
    
    
    // Randomize the QuestionArray here
    [self RandomizeThisMutableArray:QuestionArray];
    
    
    [_NextButtonOutlet setHidden:true];
    [_CorrectandIncorrectLabel setHidden:true];
    
    [self ReturnToPrimaryTestQuestionState];
}

- (IBAction)AButtonAction:(id)sender {
    //testingQuestionSuffix++;
    if ([CurrentCorrectAnswer isEqualToString:@"A"]) {
        NSLog(@"Got it right!!");
        _NumberCorrectLabel.text = [NSString stringWithFormat:@"%i", _NumberCorrectLabel.text.intValue + 1];
        
        _CorrectandIncorrectLabel.text = @"Correct :)";
        _CorrectandIncorrectLabel.textColor = _CorrectLabelColor;
        
    }
    else{
        NSLog(@"Got it wrong!!");
        _CorrectandIncorrectLabel.text = @"Incorrect :(";
        _CorrectandIncorrectLabel.textColor = _InCorrectLabelColor;
        
    }
    [self SetToSecondayAnswerState];
}
- (IBAction)CButtonAction:(id)sender {
    //  testingQuestionSuffix++;
    if ([CurrentCorrectAnswer isEqualToString:@"C"]) {
        NSLog(@"Got it right!!");
        _NumberCorrectLabel.text = [NSString stringWithFormat:@"%i", _NumberCorrectLabel.text.intValue + 1];
        _CorrectandIncorrectLabel.text = @"Correct :)";
        _CorrectandIncorrectLabel.textColor = _CorrectLabelColor;
        
    }
    else{
        NSLog(@"Got it wrong!!");
        _CorrectandIncorrectLabel.text = @"Incorrect :(";
        _CorrectandIncorrectLabel.textColor = _InCorrectLabelColor;
        
    }
    
    [self SetToSecondayAnswerState];
}
- (IBAction)BButtonAction:(id)sender {
    //  testingQuestionSuffix++;
    if ([CurrentCorrectAnswer isEqualToString:@"B"]) {
        NSLog(@"Got it right!!");
        _NumberCorrectLabel.text = [NSString stringWithFormat:@"%i", _NumberCorrectLabel.text.intValue + 1];
        _CorrectandIncorrectLabel.text = @"Correct :)";
        _CorrectandIncorrectLabel.textColor = _CorrectLabelColor;
        
    }
    else{
        NSLog(@"Got it wrong!!");
        _CorrectandIncorrectLabel.text = @"Incorrect :(";
        _CorrectandIncorrectLabel.textColor = _InCorrectLabelColor;
        
    }
    [self SetToSecondayAnswerState];
}
- (IBAction)DButtonAction:(id)sender {
    //testingQuestionSuffix++;
    if ([CurrentCorrectAnswer isEqualToString:@"D"]) {
        NSLog(@"Got it right!!");
        _NumberCorrectLabel.text = [NSString stringWithFormat:@"%i", _NumberCorrectLabel.text.intValue + 1];
        _CorrectandIncorrectLabel.text = @"Correct :)";
        _CorrectandIncorrectLabel.textColor = _CorrectLabelColor;
    }
    else{
        NSLog(@"Got it wrong!!");
        _CorrectandIncorrectLabel.text = @"Incorrect :(";
        _CorrectandIncorrectLabel.textColor = _InCorrectLabelColor;
        
    }
    [self SetToSecondayAnswerState];
    
}
- (IBAction)NextAction:(id)sender {
    if (_NumberAnsweredLabel.text.floatValue > 14) {
        // return to third state
        [self RunDoneProtocolThirdState];
    }
    else{
        [self ReturnToPrimaryTestQuestionState];
    }
}


-(void)ReturnToPrimaryTestQuestionState{
    [_buttonALabel setEnabled:true];
    [_buttonBLabel setEnabled:true];
    [_buttonCLabel setEnabled:true];
    [_buttonDLabel setEnabled:true];
    
    [_buttonALabel setBackgroundColor:nil];
        [_buttonALabel setBackgroundImage:[UIImage imageNamed:@"emptyPNG.png"] forState:UIControlStateNormal];
    [_buttonBLabel setBackgroundColor:nil];
        [_buttonBLabel setBackgroundImage:[UIImage imageNamed:@"emptyPNG.png"] forState:UIControlStateNormal];
    [_buttonCLabel setBackgroundColor:nil];
        [_buttonCLabel setBackgroundImage:[UIImage imageNamed:@"emptyPNG.png"] forState:UIControlStateNormal];
    [_buttonDLabel setBackgroundColor:nil];
        [_buttonDLabel setBackgroundImage:[UIImage imageNamed:@"emptyPNG.png"] forState:UIControlStateNormal];
    
    [_NumberAnsweredLabel setHidden:false];
    [_SlashCorrect setHidden:false];
    [_NumberCorrectLabel setHidden:false];
    
    
    [_CorrectandIncorrectLabel setHidden:true];
    
    _NumberAnsweredLabel.text = [NSString stringWithFormat:@"%i", _NumberAnsweredLabel.text.intValue + 1];
    
    int QuestionNumber = _NumberAnsweredLabel.text.intValue - 1;
    NSString *Question = [[QuestionArray objectAtIndex:QuestionNumber] objectAtIndex:0];
    NSString *ATEXT = [[QuestionArray objectAtIndex:QuestionNumber] objectAtIndex:1];
    NSString *BTEXT = [[QuestionArray objectAtIndex:QuestionNumber] objectAtIndex:2];
    NSString *CTEXT = [[QuestionArray objectAtIndex:QuestionNumber] objectAtIndex:3];
    NSString *DTEXT = [[QuestionArray objectAtIndex:QuestionNumber] objectAtIndex:4];
    
    
    if (!([ATEXT rangeOfString:@"<ANSWER>"].location == NSNotFound)){
        NSLog(@"A is the answer, Q%i", _NumberAnsweredLabel.text.intValue);
        CurrentCorrectAnswer = @"A";
        ATEXT = [ATEXT stringByReplacingOccurrencesOfString:@"<ANSWER> " withString:@""];
    }
    if (!([BTEXT rangeOfString:@"<ANSWER>"].location == NSNotFound)){
        NSLog(@"B is the answer, Q%i", _NumberAnsweredLabel.text.intValue);
        CurrentCorrectAnswer = @"B";
        BTEXT = [BTEXT stringByReplacingOccurrencesOfString:@"<ANSWER> " withString:@""];
    }
    if (!([CTEXT rangeOfString:@"<ANSWER>"].location == NSNotFound)){
        NSLog(@"C is the answer, Q%i", _NumberAnsweredLabel.text.intValue);
        CurrentCorrectAnswer = @"C";
        CTEXT = [CTEXT stringByReplacingOccurrencesOfString:@"<ANSWER> " withString:@""];
    }
    if (!([DTEXT rangeOfString:@"<ANSWER>"].location == NSNotFound)){
        NSLog(@"D is the answer, Q%i", _NumberAnsweredLabel.text.intValue);
        CurrentCorrectAnswer = @"D";
        DTEXT = [DTEXT stringByReplacingOccurrencesOfString:@"<ANSWER> " withString:@""];
    }
    
    ATEXT = [ATEXT stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    BTEXT = [BTEXT stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    CTEXT = [CTEXT stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    DTEXT = [DTEXT stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    ATEXT = [ATEXT stringByReplacingOccurrencesOfString:@"<ANSWER>" withString:@""];
    BTEXT = [BTEXT stringByReplacingOccurrencesOfString:@"<ANSWER>" withString:@""];
    CTEXT = [CTEXT stringByReplacingOccurrencesOfString:@"<ANSWER>" withString:@""];
    DTEXT = [DTEXT stringByReplacingOccurrencesOfString:@"<ANSWER>" withString:@""];
    
    _AAnswerTextView.text = [NSString stringWithFormat:@"%@",ATEXT];
    _BAnswerTextView.text = [NSString stringWithFormat:@"%@",BTEXT];
    _CAnswerTextView.text = [NSString stringWithFormat:@"%@",CTEXT];
    _DAnswerTextView.text = [NSString stringWithFormat:@"%@",DTEXT];
    
    
    
    _MainQuestionAskingTextfield.text = Question;
    
    [self viewDidLayoutSubviews];
    [_MainQuestionAskingTextfield setHidden:false];
    
    [_buttonALabel setHidden:false];
    [_AAnswerTextView setHidden:false];
    [_buttonBLabel setHidden:false];
    [_BAnswerTextView setHidden:false];
    [_buttonCLabel setHidden:false];
    [_CAnswerTextView setHidden:false];
    [_buttonDLabel setHidden:false];
    [_DAnswerTextView setHidden:false];
    
    [_CorrectandIncorrectLabel setHidden:true];
    [_NextButtonOutlet setHidden:true];
    
    [self performSelector:@selector(flashIndicators) withObject:self afterDelay:0.35 ];
    
    
}
//GradingtheQuestion
-(void)SetToSecondayAnswerState{
    
    [_CorrectandIncorrectLabel setHidden:false];
    [_NextButtonOutlet setHidden:false];
    
    [_buttonALabel setEnabled:false];
    [_buttonBLabel setEnabled:false];
    [_buttonCLabel setEnabled:false];
    [_buttonDLabel setEnabled:false];
    
    if ([_CorrectandIncorrectLabel.text isEqualToString:@"Correct :)"]) {
        
        if ([CurrentCorrectAnswer isEqualToString:@"A"]) {
           
            [_buttonALabel setBackgroundImage:[UIImage imageNamed:@"correctImage.png"] forState:UIControlStateNormal];
        }
        if ([CurrentCorrectAnswer isEqualToString:@"B"]) {
            //_buttonBLabel.backgroundColor = [UIColor greenColor];
            [_buttonBLabel setBackgroundImage:[UIImage imageNamed:@"correctImage.png"] forState:UIControlStateNormal];
        }
        if ([CurrentCorrectAnswer isEqualToString:@"C"]) {
           // _buttonCLabel.backgroundColor = [UIColor greenColor];
            [_buttonCLabel setBackgroundImage:[UIImage imageNamed:@"correctImage.png"] forState:UIControlStateNormal];
        }
        if ([CurrentCorrectAnswer isEqualToString:@"D"]) {
           // _buttonDLabel.backgroundColor = [UIColor greenColor];
            [_buttonDLabel setBackgroundImage:[UIImage imageNamed:@"correctImage.png"] forState:UIControlStateNormal];
        }
        
        //set to green
        
    }
    else {
        if ([CurrentCorrectAnswer isEqualToString:@"A"]) {
           // _buttonALabel.backgroundColor = _InCorrectLabelColor;
              [_buttonALabel setBackgroundImage:[UIImage imageNamed:@"incorrectImage.png"] forState:UIControlStateNormal];
        }
        if ([CurrentCorrectAnswer isEqualToString:@"B"]) {
            //_buttonBLabel.backgroundColor = _InCorrectLabelColor;
             [_buttonBLabel setBackgroundImage:[UIImage imageNamed:@"incorrectImage.png"] forState:UIControlStateNormal];
        }
        if ([CurrentCorrectAnswer isEqualToString:@"C"]) {
            //_buttonCLabel.backgroundColor = _InCorrectLabelColor;
             [_buttonCLabel setBackgroundImage:[UIImage imageNamed:@"incorrectImage.png"] forState:UIControlStateNormal];
        }
        if ([CurrentCorrectAnswer isEqualToString:@"D"]) {
           // _buttonDLabel.backgroundColor = _InCorrectLabelColor;
             [_buttonDLabel setBackgroundImage:[UIImage imageNamed:@"incorrectImage.png"] forState:UIControlStateNormal];
        }
        // set to red
    }
}
//Giving a summary of what happened
-(void)RunDoneProtocolThirdState{
    // make everything invisble except for the sumamry
    _mainView.backgroundColor = [UIColor lightGrayColor];
    self.NumberCorrectLabel.textColor = [UIColor darkGrayColor];
    
    [_CorrectandIncorrectLabel setHidden:true];
    [_NextButtonOutlet setHidden:true];
    
    [_MainQuestionAskingTextfield setHidden:true];
    [_AAnswerTextView setHidden:true];
    [_BAnswerTextView setHidden:true];
    [_CAnswerTextView setHidden:true];
    [_DAnswerTextView setHidden:true];
    [_buttonALabel setHidden:true];
    [_buttonBLabel setHidden:true];
    [_buttonCLabel setHidden:true];
    [_buttonDLabel setHidden:true];
    
    [_DoneMainLabel setHidden:false];
    [_DoneNumCorrectLabel setHidden:false];
    [_DoneNumAnsweredLabel setHidden:false];
    [_DonePercentageLabel setHidden:false];
    
    [_DoneCorrect setHidden:false];
    _DoneCorrect.text = _NumberCorrectLabel.text;
    [_DoneAnswered setHidden:false];
    _DoneAnswered.text = _NumberAnsweredLabel.text;
    [_DonePercentage setHidden:false];
    _DonePercentage.text = [NSString stringWithFormat:@"%.f%%", (_DoneCorrect.text.floatValue/_DoneAnswered.text.floatValue) *100];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)flashIndicators{
    if (_AAnswerTextView.text.length > 53) {
        [_AAnswerTextView flashScrollIndicators];
    }
    if (_BAnswerTextView.text.length > 53) {
        [_BAnswerTextView flashScrollIndicators];
    }
    if (_CAnswerTextView.text.length > 53) {
        [_CAnswerTextView flashScrollIndicators];
    }
    if (_DAnswerTextView.text.length > 53) {
        [_DAnswerTextView flashScrollIndicators];
    }
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(NSString *)GetDataIn:(NSString *)returnData RangeOf:(NSString *)Search andEndOf:(NSString *)endSearch{
    if ([returnData rangeOfString:Search].length == 0 || [returnData rangeOfString:endSearch].length == 0 ){
        return @"PROBLEMwithGETDATAINMETHOD!!!";}
    float start = [returnData rangeOfString:Search].location+Search.length;
    NSString *newString = [returnData substringWithRange:NSMakeRange(start, [returnData length]- start)];
    NSString *answer = [returnData substringWithRange:NSMakeRange(start, [newString rangeOfString:endSearch].location)]; // +start - start)
    
    return answer;
    
}
-(NSMutableArray *)RandomizeThisMutableArray: (NSMutableArray *) ArrayToRandomize {
    // make sure this is used with global array;
    
    for (NSUInteger i = 0; i < ArrayToRandomize.count; ++i) {
        NSInteger remainingCount = ArrayToRandomize.count - i;
        NSInteger exchangeIndex = (i + arc4random_uniform(remainingCount));
        [ArrayToRandomize exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    return ArrayToRandomize;
}

@end
