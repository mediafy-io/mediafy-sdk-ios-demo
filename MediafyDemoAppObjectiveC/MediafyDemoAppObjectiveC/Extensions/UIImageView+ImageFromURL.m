/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "UIImageView+ImageFromURL.h"

@implementation UIImageView (ImageFromURL)

- (void)setImageFromURLString:(NSString *)urlString placeholder:(UIImage *)placeholder {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.image = placeholder;
    });

    if (!urlString) {
        return;
    }

    NSURL *url = [NSURL URLWithString:urlString];
    if (!url) {
        return;
    }

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error || !data) {
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *downloadedImage = [UIImage imageWithData:data];
            if (downloadedImage) {
                self.image = downloadedImage;
            }
        });
    }];
    
    [dataTask resume];
}

@end
