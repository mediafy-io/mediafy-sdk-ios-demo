/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */
 
import UIKit

fileprivate let adBaseViewControllerNibName = "AdBaseViewController"

/// Base controller, which provides ad controls, i.e. ad view
class AdBaseViewController: UIViewController {
    
    @IBOutlet weak var containerAdView: UIView!
    
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    
    convenience init() {
        self.init(nibName: adBaseViewControllerNibName, bundle: nil)
    }
}
