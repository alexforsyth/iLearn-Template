//
//  ChapterSummaryTableViewController.m
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/11/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "ChapterSummaryTableViewController.h"
#import "SummaryViewController.h"

@interface ChapterSummaryTableViewController ()

@end

@implementation ChapterSummaryTableViewController
@synthesize SummaryList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SummaryList = [NSArray alloc];
    _mainView.backgroundColor = [UIColor lightGrayColor];
    
    NSString *megaStringPath = [[NSBundle mainBundle] pathForResource:@"Chapters" ofType:@"txt"];
    NSString *megaString = [NSString stringWithContentsOfFile:megaStringPath encoding:NSUTF8StringEncoding error:nil];
    
    
    SummaryList = [megaString componentsSeparatedByString:@"\n"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return SummaryList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        [self performSegueWithIdentifier:@"SummarySegue" sender:self];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [SummaryList objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    SummaryViewController *SVC = [[SummaryViewController alloc]init];
    // Get the new view controller using [segue destinationViewController].
    
    SVC = [segue destinationViewController];
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    
    SVC.ChapterNumber = (int) path.row +1;
    SVC.title = [SummaryList objectAtIndex:path.row];
    
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end