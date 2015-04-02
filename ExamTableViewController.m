//
//  ExamTableViewController.m
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/11/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "ExamTableViewController.h"
#import "ExamTestViewController.h"


@interface ExamTableViewController ()

@end

@implementation ExamTableViewController
@synthesize TestList;


- (id)initWithStyle:(UITableViewStyle)style
{
    
    /*
     Require:
     Modify:
     Effect:
     */
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        // none for the time
    }
    return self;
}

- (void)viewDidLoad
{
    
    /*
     Require:
     Modify:
     Effect: Boots the Exam View according to 12.2
     */
    
    [super viewDidLoad];
    TestList = [NSArray alloc];
    _mainView.backgroundColor = [UIColor lightGrayColor];
    NSString *megaStringPath = [[NSBundle mainBundle] pathForResource:@"Chapters" ofType:@"txt"];
    NSString *megaString = [NSString stringWithContentsOfFile:megaStringPath encoding:NSUTF8StringEncoding error:nil];
    
    
    TestList = [megaString componentsSeparatedByString:@"\n"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // shoudn't get here normally - safety
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    /*
     Require:
     Modify:
     Effect: simple getter
     */
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    /*
     Require:
     Modify:
     Effect: simple getter
     */
    return TestList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
     Require:
     Modify:
     Effect: pre- used for the segue
     */
    
        [self performSegueWithIdentifier:@"ExamSegue" sender:self];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
     Require:
     Modify:
     Effect: Transitioning and boot
     */
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [TestList objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    /*
     Require: user interaction
     Modify:
     Effect: does exactly what the method says - Prepares for a segue
     */
    ExamTestViewController *TC = [[ExamTestViewController alloc]init];
    // Get the new view controller using [segue destinationViewController].
    
    TC = [segue destinationViewController];
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    
    TC.ChapterNumber = (int) path.row +1;
    TC.title = [TestList objectAtIndex:path.row];
    
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation



@end
