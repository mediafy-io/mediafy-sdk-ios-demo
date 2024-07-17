/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */
 
import UIKit

import MediafySDK
import MediafyGoogleMobileAdsAdapter

import GoogleMobileAds
import AppLovinSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // ===== INIT: Mediafy SDK
        
        Mediafy.initializeSDK(accountSettings: "bid=56maxa")
        
        // ===== INIT: Ad Server SDK
        
        // Initialize GoogleMobileAds SDK
        GADMobileAds.sharedInstance().start()
        
        // ===== INIT: MediafyAdMobAdapter
        
        MediafyGADMediationAdapterInitializer.start()
        
        // Initialize AppLovin MAX SDK
        let config = ALSdkInitializationConfiguration(
            sdkKey: "<SDK_KEY>"
        )
        
        ALSdk.shared().initialize(with: config)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
}
