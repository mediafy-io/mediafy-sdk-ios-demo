/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit
import MediafySDK

final class MediafyMultiformatInterstitialViewController: InterstitialBaseViewController {
    
    private var interstitialAdUnit: MediafyInterstitialAdUnit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MediafyInterstitialAdUnit
        interstitialAdUnit = MediafyInterstitialAdUnit()
        
        // 2. Configure the MediafyInterstitialAdUnit
        interstitialAdUnit.delegate = self
        interstitialAdUnit.adSizes = [CGSize(width: 320, height: 480), CGSize(width: 1024, height: 768)]
        
        // 3. Load the interstitial ad
        interstitialAdUnit.loadAd()
    }
}

// MARK: - MediafyInterstitialAdUnitDelegate

extension MediafyMultiformatInterstitialViewController: MediafyInterstitialAdUnitDelegate {
    
    func interstitialDidReceiveAd(_ interstitial: MediafyInterstitialAdUnit) {
        // Called when ad is loaded
        interstitial.show(from: self)
    }
    
    func interstitial(
        _ interstitial: MediafyInterstitialAdUnit,
        didFailToReceiveAdWithError error: (any Error)?
    ) {
        // Called when Mediafy SDK failed to load ad
        print("Did fail to receive ad with error: \(String(describing: error?.localizedDescription))")
    }
    
    func interstitialWillPresentAd(_ interstitial: MediafyInterstitialAdUnit) {
        // Called when interstitial is about to be presented
    }
    
    func interstitialDidDismissAd(_ interstitial: MediafyInterstitialAdUnit) {
        // Called when interstitial is dismissed
    }
    
    func interstitialDidClickAd(_ interstitial: MediafyInterstitialAdUnit) {
        // Called when interstitial was clicked
    }
    
    func interstitialWillLeaveApplication(_ interstitial: MediafyInterstitialAdUnit) {
        // Called when the application is about to enter the background
    }
}
