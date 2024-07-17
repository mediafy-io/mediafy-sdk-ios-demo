/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */
 
import UIKit

fileprivate let nativeBaseViewControllerNibName = "NativeBaseViewController"

/// Base controller for native integration cases, provides title, body and sponsoredBy label, main and icon image views, callToAction button
/// For more details look at NativeBaseViewController xib
class NativeBaseViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var callToActionButton: UIButton!
    @IBOutlet weak var sponsoredLabel: UILabel!
    
    convenience init() {
        self.init(nibName: nativeBaseViewControllerNibName, bundle: nil)
    }
}
