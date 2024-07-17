/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import MediafySDK
import AppLovinSDK

fileprivate let adUnitId = "<AD_UNIT_ID>"

final class AppLovinVideoInterstitialViewController: InterstitialBaseViewController {
    
    private var interstitialAd: MAInterstitialAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MAInterstitialAd
        interstitialAd = MAInterstitialAd(adUnitIdentifier: adUnitId)
        
        // 2. Configure the MAInterstitialAd
        interstitialAd.delegate = self
        
        // 3. Load the ad
        interstitialAd.load()
    }
}

// MARK: - MAAdDelegate

extension AppLovinVideoInterstitialViewController: MAAdDelegate {
    
    func didLoad(_ ad: MAAd) {
        if interstitialAd != nil && interstitialAd.isReady {
            interstitialAd.show()
        }
    }
   
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        print("Did fail to load ad with error: \(error.message)")
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        print("Did fail to display ad with error: \(error.message)")
    }
    
    func didDisplay(_ ad: MAAd) {}
    func didHide(_ ad: MAAd) { }
    func didClick(_ ad: MAAd) {}
}
