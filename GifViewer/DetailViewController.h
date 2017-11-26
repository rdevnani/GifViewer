//
//  DetailViewController.h
//  GifViewer
//
//  Created by Rohit Devnani on 26/11/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) Giphy *giphy;

@end
