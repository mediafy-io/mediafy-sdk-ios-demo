/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import Foundation

enum IntegrationAdFormat: CustomStringConvertible, CaseIterable {
    
    case banner
    case video
    case bannerInterstitial
    case videoInterstitial
    case multiformat
    case native
    
    var description: String {
        switch self {
        case .banner:
            return "Banner"
        case .video:
            return "Video"
        case .bannerInterstitial:
            return "Banner Interstitial"
        case .videoInterstitial:
            return "Video Interstitial"
        case .multiformat:
            return "Multiformat"
        case .native:
            return "Native"
        }
    }
}
