//
//  AmiiboListViewControllerPreviews.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI

struct AmiiboListViewControllerPreviews: PreviewProvider {
  static var previews: some View {
    AmiiboListViewControllerPreviews()
  }
}

extension AmiiboListViewControllerPreviews: UIViewControllerRepresentable {
  typealias UIViewControllerType = AmiiboListViewController
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<AmiiboListViewControllerPreviews>) -> AmiiboListViewController {
    return AmiiboListViewController()
  }
  
  func updateUIViewController(_ uiViewController: AmiiboListViewController, context: UIViewControllerRepresentableContext<AmiiboListViewControllerPreviews>) {
    //...
  }
}
