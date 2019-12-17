//
//  UIImageView+LoadImage.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import UIKit

extension UIImageView {
  func loadImage(stringUrl: String) {
    self.image = UIImage(named: "placeholder")
    guard let imageURL = URL(string: stringUrl) else {
      fatalError("ImageURL is not correct!")
    }
    
    URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
      guard let data = data, error == nil else {
        print("Error downloading image: \(stringUrl).")
        return
      }
      
      DispatchQueue.main.async {
        self.image = UIImage(data: data)
      }
    }.resume()
  }
  
  func cancelLoadingImage(stringUrl: String) {
    guard let imageURL = URL(string: stringUrl) else {
      fatalError("ImageURL is not correct!")
    }
    
    URLSession.shared.getAllTasks { tasks in
      tasks
        .filter { $0.state == .running }
        .filter { $0.originalRequest?.url == imageURL }.first?
        .cancel()
    }
  }
}
