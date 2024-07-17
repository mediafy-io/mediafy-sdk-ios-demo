/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

extension UIImageView {
    
    func setImage(from urlString: String?, placeholder: UIImage? = nil) {
        DispatchQueue.main.async {
            self.image = placeholder
        }
        
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, _, error in
            guard error == nil, let data = data else { return }
            
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data) {
                    self?.image = downloadedImage
                }
            }
        }).resume()
    }
}
