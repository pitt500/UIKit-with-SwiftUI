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
  @State private var selected = false
  
  var body: some View {
    VStack {
      
      HStack {
        Spacer()
        StarViewRepresentation(selected: $selected)
          .frame(width: 35, height: 35)
          .padding()
      }
      Spacer()
      URLImage(url: amiibo.imageUrl)
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .padding()
      Text(amiibo.name)
        .font(.largeTitle)
      Spacer()
    }
  }
}

struct AmiiboDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AmiiboDetailView(amiibo: Amiibo(name: "Link", gameSeries: "Zelda", imageUrl: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_01000000-037c0002.png") )
  }
}
