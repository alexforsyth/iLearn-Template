//
//  DBQViewController.h
//  iLearn App Testing Page
//
//  Created by Alexander Forsyth on 6/12/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBQViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property int DBQnumber;
@property int DocumentNumber;

@property (strong, nonatomic) IBOutlet UIView *mainView;

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) IBOutlet UITextView *TextView;

@end
