//
//  Amiibo.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

struct Amiibo: Codable {
  let name: String
  let gameSeries: String
  let imageUrl: String
  
  private enum AmiiboKeys: String, CodingKey {
    case name
    case gameSeries
    case imageUrl = "image"
  }
}

extension Amiibo {
  static func all() -> [Amiibo] {
    return [
      Amiibo(name: "Link", gameSeries: "Zelda", imageUrl: "Link"),
      Amiibo(name: "Waluigi", gameSeries: "Super Mario", imageUrl: "Waluigi"),
      Amiibo(name: "Ryu", gameSeries: "Street Fighter", imageUrl: "Ryu"),
      Amiibo(name: "Samus", gameSeries: "Metroid", imageUrl: "Samus"),
      Amiibo(name: "Yoshi", gameSeries: "Super Mario", imageUrl: "Yoshi")
    ]
  }
}
