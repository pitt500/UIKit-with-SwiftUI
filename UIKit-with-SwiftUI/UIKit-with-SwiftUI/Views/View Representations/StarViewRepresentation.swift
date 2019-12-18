//
//  StarViewRepresentation.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/17/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI

struct StarViewRepresentation: UIViewRepresentable {
  typealias UIViewType = StarView
  
  @Binding var selected: Bool
  
  func makeUIView(context: UIViewRepresentableContext<StarViewRepresentation>) -> StarView {
    let starView = StarView()
    return starView
  }
  
  func updateUIView(_ uiView: StarView, context: UIViewRepresentableContext<StarViewRepresentation>) {
    uiView.selected = selected
  }
}
