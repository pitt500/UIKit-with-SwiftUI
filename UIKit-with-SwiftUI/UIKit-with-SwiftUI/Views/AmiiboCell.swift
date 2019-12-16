//
//  AmiiboCell.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import UIKit

class AmiiboCell: UITableViewCell {
  
  private var amiiboImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = ContentMode.scaleAspectFit
    return image
  }()
  
  private var nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    return label
  }()
  
  private var priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.textColor = .green
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupImageView()
    setupNameLabel()
    setupPriceLabel()
    
    separatorInset = .init(top: 0, left: 100, bottom: 0, right: 0)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupImageView() {
    addSubview(amiiboImage)
    amiiboImage.anchor(top: topAnchor, leading: leadingAnchor,
                       bottom: bottomAnchor, trailing: nil,
                       padding: .zero,
                       size: CGSize(width: 100, height: 100))
  }
  
  func setupNameLabel() {
    addSubview(nameLabel)
    nameLabel.anchor(top: amiiboImage.topAnchor,
                     leading: amiiboImage.trailingAnchor,
                      bottom: nil,
                      trailing: trailingAnchor,
                      padding: UIEdgeInsets(top: 25, left: 16, bottom: 0, right: 16),
                      size: CGSize(width: 0, height: 24))
  }

  func setupPriceLabel() {
    addSubview(priceLabel)
    priceLabel.anchor(top: nameLabel.bottomAnchor,
                         leading: nameLabel.leadingAnchor,
                         bottom: nil,
                         trailing: nameLabel.trailingAnchor,
                         size: CGSize(width: 0, height: 24))
  }
  
  func configure(with amiibo: Amiibo) {
    amiiboImage.image = UIImage(named: amiibo.imageUrl)
    nameLabel.text = amiibo.name
    priceLabel.text = "$\(amiibo.price)"
  }
}

extension UITableViewCell {
  static var reusableIdentifier: String {
    return String(describing: self)
  }
}
