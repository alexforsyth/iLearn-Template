//
//  FRQTableViewController.m
//  iCalculus AP
//
//  Created by Alexander Forsyth on 4/29/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "FRQTableViewController.h"
#import "FRQViewController.h"
#import "DBQViewController.h"

@interface FRQTableViewController ()

@end

@implementation FRQTableViewController
@synthesize FRQList;

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
    
    self.title = @"AP FRQs";
    _mainView.backgroundColor = [UIColor lightGrayColor];
    
    
    // this is the important method>>
    FRQList = [NSArray alloc];
    
    NSString *megaStringPath = [[NSBundle mainBundle] pathForResource:@"ChaptersFRQ" ofType:@"txt"];
    NSString *megaString = [NSString stringWithContentsOfFile:megaStringPath encoding:NSUTF8StringEncoding error:nil];
    
    
    FRQList = [megaString componentsSeparatedByString:@"\n"];
    
    [super viewDidLoad];
    
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
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return FRQList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifierFRQ = @"FRQCell";
    
    UITableViewCell *FRQcell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierFRQ];
    
    
    if (FRQcell == nil) {
        FRQcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierFRQ];
    }
    
    
    
    
    
    FRQcell.textLabel.text = [FRQList objectAtIndex:indexPath.row];
    FRQcell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return FRQcell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 4) {
        [self performSegueWithIdentifier:@"FRQPushSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"DBQPushSegue" sender:self];
    }
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


#pragma mark - Navigation



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    int NumberOfFRQs = 4;
    
    
    if (path.row < NumberOfFRQs) {
        
        FRQViewController *FVC = [[FRQViewController alloc]init];
        FVC = [segue destinationViewController];
        FVC.title = [FRQList objectAtIndex:path.row];
        FVC.FRQNumber = (int) path.row;
        FVC.ImagePath = [NSString stringWithFormat:@"FRQ%li.png", path.row +1];
    }
    else{
        DBQViewController *DBQVC = [[DBQViewController alloc]init];
        DBQVC = [segue destinationViewController];
        DBQVC.title = [FRQList objectAtIndex:path.row];
        DBQVC.DBQnumber = (int) path.row - NumberOfFRQs + 1;
        
    }
    
    
    
    
    // Get the new view controller using [segue destinationViewController].
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
