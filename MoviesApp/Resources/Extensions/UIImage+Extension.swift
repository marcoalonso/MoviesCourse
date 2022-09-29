//
//  UIImage+Extension.swift
//  MoviesApp
//
//  Created by marco rodriguez on 28/09/22.
//

import UIKit

extension UIImageView {
    func imagenFromServerURL(urlString: String, placeHolderImage: UIImage) {
        
        if self.image == nil {
            self.image = placeHolderImage
        }
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let safeData = data else { return }
                let image = UIImage(data: safeData)
                self.image = image
            }
        }.resume()
    }
}
