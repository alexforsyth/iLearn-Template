//
//  FRQViewController.h
//  iCalculus AP
//
//  Created by Alexander Forsyth on 4/29/14.
//  Copyright (c) 2014 Alexander Forsyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRQViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

@property int FRQNumber;
@property NSString *ImagePath;


@end
