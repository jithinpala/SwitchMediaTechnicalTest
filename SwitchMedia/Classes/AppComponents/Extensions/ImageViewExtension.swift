/*******************************************************************************************
 * File Name        :  ImageViewExtension.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  ImageViewExtension class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImageFrom(link: String) {
        let url = URL(string: link)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                if let imageData = data {
                    self.image = UIImage(data: imageData)
                }
            }
        }).resume()
        
    }
    
}
