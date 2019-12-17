//
//  AmiiboDetailView.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI

struct AmiiboDetailView: View {
  
  let amiibo: Amiibo
  
  var body: some View {
    VStack {
      URLImage(url: amiibo.imageUrl)
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .padding()
      Text(amiibo.name)
        .font(.largeTitle)
    }
  }
}

struct AmiiboDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AmiiboDetailView(amiibo: Amiibo(name: "Link", gameSeries: "Zelda", imageUrl: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_01000000-037c0002.png") )
  }
}
