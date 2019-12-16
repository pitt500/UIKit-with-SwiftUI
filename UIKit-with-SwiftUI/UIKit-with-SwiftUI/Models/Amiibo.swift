//
//  Amiibo.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

struct Amiibo {
  let name: String
  let price: Double
  let imageUrl: String
}

extension Amiibo {
  static func all() -> [Amiibo] {
    return [
      Amiibo(name: "Link", price: 29.0, imageUrl: "Link"),
      Amiibo(name: "Waluigi", price: 55.0, imageUrl: "Waluigi"),
      Amiibo(name: "Ryu", price: 14.0, imageUrl: "Ryu"),
      Amiibo(name: "Samus", price: 35.0, imageUrl: "Samus"),
      Amiibo(name: "Yoshi", price: 29.0, imageUrl: "Yoshi")
    ]
  }
}
