//
//  TipsAndTricksViewController.m
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/14/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "TipsAndTricksViewController.h"

@interface TipsAndTricksViewController ()

@end

@implementation TipsAndTricksViewController
@synthesize Textview;
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
    
    Textview.attributedText =
    [   NSAttributedString.alloc
     initWithFileURL:[ NSBundle.mainBundle URLForResource:@"TipsAndTricksMain" withExtension:@"rtf"  ]
     options:nil
     documentAttributes:nil
     error:nil
     ];
        Textview.textColor = [UIColor whiteColor];
     [Textview flashScrollIndicators];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
