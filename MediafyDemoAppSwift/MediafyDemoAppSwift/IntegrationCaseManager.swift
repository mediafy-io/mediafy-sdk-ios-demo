/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

/**
    Integration case title template - [IntegrationKind] [IntegrationAdFormat]
    [IntegrationKind] - Mediafy, AdMob, AppLovin
    [IntegrationAdFormat] - "Banner", "Video", "Banner Interstitial", "Video Interstitial", "Native"
 */

struct IntegrationCaseManager {
    
    static var allCases: [IntegrationCase] = [
        
        IntegrationCase(
            title: "Mediafy Banner Ad 320x50",
            integrationKind: .sdk,
            adFormat: .banner,
            configurationClosure: {
                MediafyBannerAdViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Banner Ad 300x250",
            integrationKind: .sdk,
            adFormat: .banner,
            configurationClosure: {
                MediafyBannerAdMediumRectangleViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Banner Multisize Ad 320x50 & 728x90",
            integrationKind: .sdk,
            adFormat: .banner,
            configurationClosure: {
                MediafyBannerAdMultisizeViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Video Ad 300x250",
            integrationKind: .sdk,
            adFormat: .video,
            configurationClosure: {
                MediafyVideoAdViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Banner Interstitial",
            integrationKind: .sdk,
            adFormat: .bannerInterstitial,
            configurationClosure: {
                MediafyBannerInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Video Interstitial",
            integrationKind: .sdk,
            adFormat: .videoInterstitial,
            configurationClosure: {
                MediafyVideoInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Multiformat Interstitial 320x480 & 1024x768",
            integrationKind: .sdk,
            adFormat: .videoInterstitial,
            configurationClosure: {
                MediafyVideoInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "Mediafy Native",
            integrationKind: .sdk,
            adFormat: .native,
            configurationClosure: {
                MediafyNativeViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Adapter Banner Ad 320x50",
            integrationKind: .adMob,
            adFormat: .banner,
            configurationClosure: {
                AdMobBannerAdViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Adapter Banner Ad 300x250",
            integrationKind: .adMob,
            adFormat: .banner,
            configurationClosure: {
                AdMobBannerAdMediumRectangleViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Adapter Video Ad 300x250",
            integrationKind: .adMob,
            adFormat: .video,
            configurationClosure: {
                AdMobVideoAdViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Adapter Banner Interstitial 320x480",
            integrationKind: .adMob,
            adFormat: .bannerInterstitial,
            configurationClosure: {
                AdMobBannerInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Adapter Video Interstitial 1024x768",
            integrationKind: .adMob,
            adFormat: .videoInterstitial,
            configurationClosure: {
                AdMobVideoInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Multiformat Interstitial 320x480 & 1024x768",
            integrationKind: .adMob,
            adFormat: .multiformat,
            configurationClosure: {
                AdMobMultiformatInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "AdMob Adapter Native",
            integrationKind: .adMob,
            adFormat: .native,
            configurationClosure: {
                AdMobNativeViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Banner Ad 320x50",
            integrationKind: .appLovin,
            adFormat: .banner,
            configurationClosure: {
                AppLovinBannerAdViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Banner Ad 300x250",
            integrationKind: .appLovin,
            adFormat: .banner,
            configurationClosure: {
                AppLovinBannerAdMediumRectangleViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Video Ad 300x250",
            integrationKind: .appLovin,
            adFormat: .video,
            configurationClosure: {
                AppLovinVideoAdViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Banner Interstitial 320x480",
            integrationKind: .appLovin,
            adFormat: .bannerInterstitial,
            configurationClosure: {
                AppLovinBannerInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Video Interstitial 1024x768",
            integrationKind: .appLovin,
            adFormat: .videoInterstitial,
            configurationClosure: {
                AppLovinVideoInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Multiformat Interstitial 320x480 & 1024x768",
            integrationKind: .appLovin,
            adFormat: .multiformat,
            configurationClosure: {
                AppLovinMultifomatInterstitialViewController()
            }
        ),
        
        IntegrationCase(
            title: "AppLovin MAX Adapter Native",
            integrationKind: .appLovin,
            adFormat: .native,
            configurationClosure: {
                AppLovinNativeViewController()
            }
        ),
    ]
}
