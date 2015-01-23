//
//  PhotosViewController.m
//  MyInstagram
//
//  Created by Tejas Lagvankar on 1/22/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotosTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface PhotosViewController ()

@property (strong, nonatomic) NSArray *photosArray;
@property (weak, nonatomic) IBOutlet UITableView *photosTableView;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Photos";


    self.photosTableView.dataSource = self;
    self.photosTableView.rowHeight = 320;

    [self.photosTableView registerNib:[UINib nibWithNibName:@"PhotosTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhotosCell"];


    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=0b9a9c9e042d4289b74ce07c5403a7d1"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"response: %@", responseDictionary);
        self.photosArray = responseDictionary[@"data"];

        [self.photosTableView reloadData];
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photosArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    PhotosTableViewCell *photosTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"PhotosCell"];


    NSString *imageUrl = [self.photosArray[indexPath.row] valueForKeyPath:@"images.standard_resolution.url"];

    [photosTableViewCell.instaPhotoView setImageWithURL:[NSURL URLWithString:imageUrl]];


    return  photosTableViewCell;

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