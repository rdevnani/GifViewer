//
//  CollectionViewCell.h
//  GifViewer
//
//  Created by Rohit Devnani on 4/11/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString *urlString;
@end
