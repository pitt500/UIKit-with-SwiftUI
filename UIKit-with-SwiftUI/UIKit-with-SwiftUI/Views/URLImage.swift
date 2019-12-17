//
//  URLImage.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
  
  @ObservedObject private var imageLoader = ImageLoader()
  var placeholder: Image
  
  init(url: String, placeholder: Image = Image(systemName: "photo")) {
    self.placeholder = placeholder
    self.imageLoader.load(url: url)
  }
  
  var body: some View {
    if let image = self.imageLoader.downloadedImage {
      return Image(uiImage: image)
    } else {
      return placeholder
    }
  }
}
