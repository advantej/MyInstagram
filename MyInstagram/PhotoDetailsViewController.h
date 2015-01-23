//
//  PhotoDetailsViewController.h
//  MyInstagram
//
//  Created by Biren Barodia on 1/22/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailsViewController : UIViewController <UITableViewDataSource>
@property (strong, nonatomic) NSDictionary *photoDetailsDictionary;

@end
