//
//  AmiiboCell.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import UIKit

class AmiiboCell: UITableViewCell {
  
  func configure(with amiibo: Amiibo) {
    imageView?.image = UIImage(named: amiibo.imageUrl)
    textLabel?.text = amiibo.name
    detailTextLabel?.text = "\(amiibo.price)"
  }
}

extension UITableViewCell {
  static var reusableIdentifier: String {
    return String(describing: self)
  }
}
