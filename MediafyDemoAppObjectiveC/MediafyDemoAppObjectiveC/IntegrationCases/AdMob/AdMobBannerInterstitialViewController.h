/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import "InterstitialBaseViewController.h"

@import MediafySDK;
@import MediafyGoogleMobileAdsAdapter;
@import GoogleMobileAds;

NS_ASSUME_NONNULL_BEGIN

@interface AdMobBannerInterstitialViewController : InterstitialBaseViewController <GADFullScreenContentDelegate>

@end

NS_ASSUME_NONNULL_END
