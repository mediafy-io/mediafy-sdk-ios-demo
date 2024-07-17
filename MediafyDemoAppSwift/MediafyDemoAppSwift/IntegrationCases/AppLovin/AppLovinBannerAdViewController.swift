/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import MediafySDK
import AppLovinSDK

fileprivate let adUnitId = "<AD_UNIT_ID>"

final class AppLovinBannerAdViewController: AdBaseViewController {
    
    private var maAdView: MAAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the constraints of the container view
        containerWidthConstraint.constant = 320
        containerHeightConstraint.constant = 50
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MAAdView
        maAdView = MAAdView(adUnitIdentifier: adUnitId, adFormat: .banner)
        
        // 2. Configure the MAAdView
        maAdView.delegate = self
        maAdView.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 250))
        
        // Add AppLovin SDK ad view to the app UI
        containerAdView.addSubview(maAdView)
        
        // 3. Load the ad
        maAdView.loadAd()
    }
}

// MARK: - MAAdViewAdDelegate

extension AppLovinBannerAdViewController: MAAdViewAdDelegate {
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        print("Did fail to load ad with error: \(error.message)")
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        print("Did fail to display ad with error: \(error.message)")
    }
    
    func didLoad(_ ad: MAAd) {}
    func didExpand(_ ad: MAAd) {}
    func didCollapse(_ ad: MAAd) {}
    func didDisplay(_ ad: MAAd) {}
    func didHide(_ ad: MAAd) {}
    func didClick(_ ad: MAAd) {}
}
