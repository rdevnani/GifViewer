//
//  Giphy.m
//  GifViewer
//
//  Created by Rohit Devnani on 26/11/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

#import "Giphy.h"

@implementation Giphy

+ (instancetype) gifhyWithDictionary:(NSDictionary *) dictionary {
    Giphy * giphy = [[Giphy alloc] init];
    
    if ( giphy ) {
        giphy.animatedGifURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.original.url"]];
        
        giphy.stillImageURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.downsized_still.url"]];
    }
    
    return giphy;
    
}
@end
