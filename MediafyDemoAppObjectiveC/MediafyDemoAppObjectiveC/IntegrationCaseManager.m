/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IntegrationCaseManager.h"

#import "MediafyBannerAdViewController.h"
#import "MediafyBannerAdMediumRectangleViewController.h"
#import "MediafyBannerAdMultisizeViewController.h"
#import "MediafyVideoAdViewController.h"
#import "MediafyBannerInterstitialViewController.h"
#import "MediafyVideoInterstitialViewController.h"
#import "MediafyMultiformatInterstitialViewController.h"
#import "MediafyNativeViewController.h"

#import "AdMobBannerAdViewController.h"
#import "AdMobBannerAdMediumRectangleViewController.h"
#import "AdMobVideoAdViewController.h"
#import "AdMobBannerInterstitialViewController.h"
#import "AdMobVideoInterstitialViewController.h"
#import "AdMobMultiformatInterstitialViewController.h"
#import "AdMobNativeViewController.h"

#import "AppLovinBannerAdViewController.h"
#import "AppLovinBannerAdMediumRectangleViewController.h"
#import "AppLovinVideoAdViewController.h"
#import "AppLovinBannerInterstitialViewController.h"
#import "AppLovinVideoInterstitialViewController.h"
#import "AppLovinMultifomatInterstitialViewController.h"
#import "AppLovinNativeViewController.h"

/**
    Integration case title template - [IntegrationKind] [IntegrationAdFormat]
    [IntegrationKind] - Mediafy, AdMob, AppLovin
    [IntegrationAdFormat] - "Banner", "Video", "Banner Interstitial", "Video Interstitial", "Native"
 */

@implementation IntegrationCaseManager

+ (NSArray<IntegrationCase *> *)allCases {
    
    return
    [
        [NSArray alloc]
        initWithObjects:
            [
                [IntegrationCase alloc]
                initWithTitle:@"Mediafy Banner Ad 320x50"
                integrationKind:IntegrationKindMediafy
                adFormat:IntegrationAdFormatBanner
                configurationClosure:^UIViewController *{
                    return [MediafyBannerAdViewController new];
                }
            ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Banner Ad 300x250"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatBanner
            configurationClosure:^UIViewController *{
                return [MediafyBannerAdMediumRectangleViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Banner Multisize Ad 320x50 & 728x90"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatBanner
            configurationClosure:^UIViewController *{
                return [MediafyBannerAdMultisizeViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Video Ad 300x250"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatVideo
            configurationClosure:^UIViewController *{
                return [MediafyVideoAdViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Banner Interstitial 320x480"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatBannerInterstitial
            configurationClosure:^UIViewController *{
                return [MediafyBannerInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Video Interstitial"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatVideoInterstitial
            configurationClosure:^UIViewController *{
                return [MediafyVideoInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Multiformat Interstitial 320x480 & 1024x768"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatMultiformat
            configurationClosure:^UIViewController *{
                return [MediafyMultiformatInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"Mediafy Native"
            integrationKind:IntegrationKindMediafy
            adFormat:IntegrationAdFormatNative
            configurationClosure:^UIViewController *{
                return [MediafyNativeViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Adapter Banner Ad 320x50"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatBanner
            configurationClosure:^UIViewController *{
                return [AdMobBannerAdViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Adapter Banner Ad 300x250"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatBanner
            configurationClosure:^UIViewController *{
                return [AdMobBannerAdMediumRectangleViewController new];
            }
        ],
    
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Adapter Video Ad 300x250"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatVideo
            configurationClosure:^UIViewController *{
                return [AdMobVideoAdViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Adapter Banner Interstitial 320x480"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatBannerInterstitial
            configurationClosure:^UIViewController *{
                return [AdMobBannerInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Adapter Video Interstitial 1024x768"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatVideoInterstitial
            configurationClosure:^UIViewController *{
                return [AdMobVideoInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Multiformat Interstitial 320x480 & 1024x768"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatMultiformat
            configurationClosure:^UIViewController *{
                return [AdMobMultiformatInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AdMob Adapter Native"
            integrationKind:IntegrationKindAdMob
            adFormat:IntegrationAdFormatNative
            configurationClosure:^UIViewController *{
                return [AdMobNativeViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Banner Ad 320x50"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatBanner
            configurationClosure:^UIViewController *{
                return [AppLovinBannerAdViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Banner Ad 300x250"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatBanner
            configurationClosure:^UIViewController *{
                return [AppLovinBannerAdMediumRectangleViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Video Ad 300x250"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatVideo
            configurationClosure:^UIViewController *{
                return [AppLovinVideoAdViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Banner Interstitial 320x480"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatBannerInterstitial
            configurationClosure:^UIViewController *{
                return [AppLovinBannerInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Video Interstitial 1024x768"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatVideoInterstitial
            configurationClosure:^UIViewController *{
                return [AppLovinVideoInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Multiformat Interstitial 320x480 & 1024x768"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatVideoInterstitial
            configurationClosure:^UIViewController *{
                return [AppLovinMultifomatInterstitialViewController new];
            }
        ],
        
        [
            [IntegrationCase alloc]
            initWithTitle:@"AppLovin MAX Adapter Native"
            integrationKind:IntegrationKindAppLovin
            adFormat:IntegrationAdFormatNative
            configurationClosure:^UIViewController *{
                return [AppLovinNativeViewController new];
            }
        ],
        
        nil];
}

@end
