/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

fileprivate let interstitialBaseViewControllerNibName = "InterstitialBaseViewController"

/// Base controller for interstitial integration cases
class InterstitialBaseViewController: UIViewController {
    
    convenience init() {
        self.init(nibName: interstitialBaseViewControllerNibName, bundle: nil)
    }
}
