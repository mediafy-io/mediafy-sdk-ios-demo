/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "InterstitialBaseViewController.h"

@import MediafySDK;
@import MediafyAppLovinMAXAdapter;
@import AppLovinSDK;

NS_ASSUME_NONNULL_BEGIN

@interface AppLovinVideoInterstitialViewController : InterstitialBaseViewController<MAAdDelegate>

@end

NS_ASSUME_NONNULL_END
