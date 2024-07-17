/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ImageFromURL)

- (void)setImageFromURLString:(NSString *)urlString placeholder:(UIImage *)placeholder;

@end

NS_ASSUME_NONNULL_END
