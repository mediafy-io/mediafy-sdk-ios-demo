/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "UIImageView+ImageFromURL.h"

@import MediafySDK;
@import MediafyGoogleMobileAdsAdapter;
@import GoogleMobileAds;

NS_ASSUME_NONNULL_BEGIN

@interface AdMobNativeViewController : UIViewController<GADNativeAdLoaderDelegate>

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
