//
//  AmiiboViewModel.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

class AmiiboViewModel {
  var amiibo: Amiibo
  
  init(amiibo: Amiibo) {
    self.amiibo = amiibo
  }
  
  var name: String {
    return self.amiibo.name
  }
  
  var gameSeries: String {
    return self.amiibo.gameSeries
  }
  
  var imageUrl: String {
    return self.amiibo.imageUrl
  }
}
