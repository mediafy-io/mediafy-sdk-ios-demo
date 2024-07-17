/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

extension UIButton {
    
    func setupPullDown(with actions: [UIAction]) {
        showsMenuAsPrimaryAction = true
        changesSelectionAsPrimaryAction = true
        
        actions.first?.state = .on
        
        menu = UIMenu(children: actions)
    }
}
