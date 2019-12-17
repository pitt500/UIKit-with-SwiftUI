//
//  ImageLoader.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
  var downloadedImage: UIImage?
  let objectWillChange = ObservableObjectPublisher()
  
  func load(url: String) {
    guard let imageURL = URL(string: url) else {
      fatalError("ImageURL is not correct!")
    }
    
    URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
      guard let data = data, error == nil else {
        print("Error loading image: \(url)")
        return
      }
      
      DispatchQueue.main.async {
        self.downloadedImage = UIImage(data: data)
        self.objectWillChange.send()
      }
    }.resume()
    
  }
}
