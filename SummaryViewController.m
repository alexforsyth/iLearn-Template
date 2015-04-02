//
//  SummaryViewController.m
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/11/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "SummaryViewController.h"
#import "ExamTestViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController
@synthesize ChapterNumber;

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

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *megaStringPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Summary copy %i", ChapterNumber] ofType:@"txt"];
    NSString *megaString = [NSString stringWithContentsOfFile:megaStringPath encoding:NSUTF8StringEncoding error:nil];
    megaString = [NSString stringWithFormat:@"%@\n\n\n\n", megaString];
    _TextField.text = megaString;
    
    //show the user that we can scroll
    [_TextField flashScrollIndicators];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ExamTestViewController *TC = [[ExamTestViewController alloc]init];
    // Get the new view controller using [segue destinationViewController].
    
    TC = [segue destinationViewController];
    
    TC.ChapterNumber = self.ChapterNumber;
    TC.title = self.title;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)GoToReviewTest:(id)sender {
    
}
@end
