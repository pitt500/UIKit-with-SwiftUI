//
//  AmiiboListViewModel.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

class AmiiboListViewModel {
  var amiibos = [AmiiboViewModel]()
  
  func getSmashAmiibos(completion: (() -> Void)?) {
    AmiiboService().getSmashAmiibos(completion: { amiiboList in
      self.amiibos = amiiboList.map(AmiiboViewModel.init)
      completion?()
    }, errorHandler: { error in
      print(error)
    })
  }
  
  var numberOfAmiibos: Int {
    return amiibos.count
  }
}
