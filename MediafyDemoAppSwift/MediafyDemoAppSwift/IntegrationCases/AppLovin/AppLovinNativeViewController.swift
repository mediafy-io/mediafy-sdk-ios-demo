/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import MediafySDK
import MediafyAppLovinMAXAdapter

import AppLovinSDK

fileprivate let adUnitId = "<AD_UNIT_ID>"

final class AppLovinNativeViewController: UIViewController {
    
    static var nib: String {
        "AppLovinNativeViewController"
    }
    
    @IBOutlet weak var maNativeAdView: MANativeAdView!
    
    private var nativeAdLoader: MANativeAdLoader!
    
    convenience init() {
        self.init(nibName: Self.nib, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind the subviews using unique tag IDs with an instance of MANativeAdViewBinder
        let binder = MANativeAdViewBinder { builder in
            builder.iconImageViewTag = 1
            builder.titleLabelTag = 2
            builder.bodyLabelTag = 3
            builder.advertiserLabelTag = 4
            builder.callToActionButtonTag = 5
        }
        
        maNativeAdView.bindViews(with: binder)
        
        loadAd()
    }
    
    private func loadAd() {
        // 1. Create a MANativeAdLoader
        nativeAdLoader = MANativeAdLoader(adUnitIdentifier: adUnitId)
        
        // 2. Configure the MANativeAdLoader
        nativeAdLoader.nativeAdDelegate = self
        
        // 3. Configure the native parameters
        let cta = MediafyNativeAssetData(type: .ctatext)
        cta.length = 15
        
        let title = MediafyNativeAssetTitle(length: 90)
        title.required = true
        
        let icon = MediafyNativeAssetImage(minimumWidth: 50, minimumHeight: 50)
        icon.type = .Icon
        
        let image = MediafyNativeAssetImage()
        image.required = true
        image.width = 1200
        image.height = 627
        image.type = .Main
        
        let description = MediafyNativeAssetData(type: .description)
        description.required = true
        description.length = 150
        
        let rating = MediafyNativeAssetData(type: .rating)
        
        let parameters = MediafyNativeParameters()
        parameters.assets = [cta, title, icon, image, rating, description]
        
        let eventTracker = MediafyNativeEventTracker(
            event: .Impression,
            methods: [.Image, .js]
        )
        
        parameters.eventtrackers = [eventTracker]
        parameters.context = .Social
        parameters.placementType = .FeedContent
        parameters.contextSubType = .Social
        
        // 4. Create a MediafyAppLovinExtras
        let extras = MediafyAppLovinExtras(nativeParameters: parameters)
        
        // 5. Set local extra parameter
        nativeAdLoader.setLocalExtraParameterForKey(MediafyAppLovinExtras.key, value: extras)
        
        // 6. Load the ad
        nativeAdLoader.loadAd(into: maNativeAdView)
    }
}

extension AppLovinNativeViewController: MANativeAdDelegate {
    
    func didFailToLoadNativeAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        print("Did fail to load ad with error: \(error.message)")
    }
    
    func didLoadNativeAd(_ nativeAdView: MANativeAdView?, for ad: MAAd) {}
    func didClickNativeAd(_ ad: MAAd) {}
}
