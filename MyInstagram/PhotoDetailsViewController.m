//
//  PhotoDetailsViewController.m
//  MyInstagram
//
//  Created by Biren Barodia on 1/22/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "PhotosTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *detailsTable;

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Details";
    self.detailsTable.dataSource = self;
    
    [self.detailsTable registerNib:[UINib nibWithNibName:@"PhotosTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhotosCell"];
    
    self.detailsTable.rowHeight = 320;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotosTableViewCell *photosTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"PhotosCell"];
    
    NSString *imageUrl = [self.photoDetailsDictionary valueForKeyPath:@"images.standard_resolution.url"];
    
    [photosTableViewCell.instaPhotoView setImageWithURL:[NSURL URLWithString:imageUrl]];

    return photosTableViewCell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
