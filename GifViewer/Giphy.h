//
//  Giphy.h
//  GifViewer
//
//  Created by Rohit Devnani on 26/11/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Giphy : NSObject
@property (strong, nonatomic) NSURL *stillImageURL;
@property (strong, nonatomic) NSURL *animatedGifURL;

+ (instancetype) gifhyWithDictionary:(NSDictionary *) dictionary;
@end
