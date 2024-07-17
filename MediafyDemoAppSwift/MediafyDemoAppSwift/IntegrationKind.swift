/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import Foundation

enum IntegrationKind: CustomStringConvertible, CaseIterable {
    
    case sdk
    case adMob
    case appLovin
    
    var description: String {
        switch self {
        case .sdk:
            return "Mediafy"
        case .adMob:
            return "AdMob"
        case .appLovin:
            return "AppLovin MAX"
        }
    }
}
