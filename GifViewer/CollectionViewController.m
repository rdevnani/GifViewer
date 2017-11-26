//
//  CollectionViewController.m
//  GifViewer
//
//  Created by Rohit Devnani on 4/11/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "Giphy.h"
#import "DetailViewController.h"

@interface CollectionViewController ()
@property (strong, nonatomic) NSMutableArray *giphys;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"GifViewerCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
    [self refreshImages];
}

- (void) refreshImages {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&rating=pg"];
    
    self.giphys = [NSMutableArray array];
    
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        // data array > images > downsized_still > url
        
        NSArray *dictionaries = [dictionary valueForKey:@"data"];
        
        for (NSDictionary *dict in dictionaries) {
            Giphy *giphy = [Giphy gifhyWithDictionary:dict];
            [self.giphys addObject:giphy];
        }
        
        NSLog(@"%@",self.giphys);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
        
    }];
    [task resume];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
     // This part is called Dependency Injection
     if ([segue.identifier isEqualToString:@"showDetail"]) {
         NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
         
         Giphy *giphy = self.giphys[selectedIndexPath.row];
         DetailViewController *detailViewController = segue.destinationViewController;
         detailViewController.giphy = giphy;
     }
 }


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.giphys count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Giphy *giphy = [self.giphys objectAtIndex:indexPath.row];
    cell.giphy = giphy;
    
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}











@end
