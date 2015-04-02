//
//  DBQViewController.m
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/12/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import "DBQViewController.h"
#import "FRQViewController.h"
@interface DBQViewController ()

@end

@implementation DBQViewController
@synthesize TableView;
@synthesize DBQnumber;
@synthesize TextView;
@synthesize DocumentNumber;

NSArray *DBQList;


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
    
   // UIColor *NoColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.001];
   // _mainView.backgroundColor = NoColor;
    
    DBQList = [[NSArray alloc] initWithObjects:
               @"Document 1",
               @"Document 2",
               @"Document 3",
               @"Document 4",
               @"Document 5",
               @"Document 6",
               @"Document 7",
               @"Document 8",
               @"Document 9",
               @"Document 10",
               @"Document 11",
               @"Document 12",
               @"Document 13",
               @"Document 14",
               @"Document 15",
               @"Document 16",
               @"Document 17",
               @"Document 18",
               @"Document 19",
               @"Document 20",
               @"Document 21",
               @"Document 22",
               @"Document 23",
               @"Document 24",
               nil];
    
    [super viewDidLoad];
    TableView.dataSource = self;
    TableView.delegate = self;
    
    NSString *megaStringPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"DBQ%i content", DBQnumber] ofType:@"txt"];
    NSString *megaString = [NSString stringWithContentsOfFile:megaStringPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *numberOfDocuments = [self GetDataIn:megaString RangeOf:@"<Documents Number:" andEndOf:@">"];
    
    DocumentNumber = numberOfDocuments.intValue;
    if (numberOfDocuments.length == 0) {
        DocumentNumber = 1;
    }
    
    megaString = [megaString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"<Documents Number:%@>", numberOfDocuments] withString:@""];
    NSLog(@"documents: %@", numberOfDocuments);
    
    
    TextView.text = megaString;
    [TextView flashScrollIndicators];
    TextView.textColor = [UIColor blackColor];
    TableView.backgroundColor = [UIColor lightGrayColor];
    
    [self performSelector:@selector(flashIndicators) withObject:self afterDelay:0.35];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
	// Unselect the selected row if any
    //	NSIndexPath*	selection = [self.tableView indexPathForSelectedRow];
    //	if (selection)
    //		[self.tableView deselectRowAtIndexPath:selection animated:YES];
    
	[self.TableView reloadData];
}

-(void)flashIndicators{
    [TextView flashScrollIndicators];
    [TableView flashScrollIndicators];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return DocumentNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *DBQcell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (DBQcell == nil) {
        DBQcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    
    
    DBQcell.textLabel.text = [DBQList objectAtIndex:indexPath.row];
    DBQcell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return DBQcell;
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    NSIndexPath *path = [TableView indexPathForSelectedRow];
    
    FRQViewController *SVC = [[FRQViewController alloc]init];
    
    SVC = [segue destinationViewController];
    SVC.title = [DBQList objectAtIndex:path.row];
    SVC.ImagePath = [NSString stringWithFormat:@"DBQ%i Doc%li", DBQnumber, path.row+1];
    
    // Get the new view controller using [segue destinationViewController].
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(NSString *)GetDataIn:(NSString *)returnData RangeOf:(NSString *)Search andEndOf:(NSString *)endSearch{
    if ([returnData rangeOfString:Search].length == 0 || [returnData rangeOfString:endSearch].length == 0 ){
        return @"PROBLEMwithGETDATAINMETHOD!!!";}
    float start = [returnData rangeOfString:Search].location+Search.length;
    NSString *newString = [returnData substringWithRange:NSMakeRange(start, [returnData length]- start)];
    NSString *answer = [returnData substringWithRange:NSMakeRange(start, [newString rangeOfString:endSearch].location)]; // +start - start)
    
    return answer;
    
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
