//
//  FRQViewController.m
//  iCalculus AP
//
//  Created by Alexander Forsyth on 4/29/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "FRQViewController.h"

@interface FRQViewController ()

@end

@implementation FRQViewController
@synthesize FRQNumber;
@synthesize ImageView;
@synthesize ScrollView;
@synthesize ImagePath;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidLayoutSubviews{
    
    ScrollView.contentSize = ImageView.frame.size;
    
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return ImageView;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    
    // do something before rotation
}

-(void)viewDidAppear:(BOOL)animated{
    
    if (ImagePath.length > 0) {
        ImageView.image = [UIImage imageNamed:ImagePath];
    }
    
    CGFloat height = ImageView.image.size.height+120;
    CGFloat width = ImageView.image.size.width +120;
    
    
    ImageView.frame = CGRectMake(0,0, width, height);
    
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(width, height)];
    
    ScrollView.clipsToBounds = YES;
    ScrollView.delegate = self;
    
    ScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // adapt to devices
    
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
