//
//  UIView+Autolayout.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//
import UIKit

public enum CenterMode {
  case horizontally
  case vertically
}

public extension UIView {
  
  func fillSuperview(padding: UIEdgeInsets = .zero, shouldUseSafeTopAnchor: Bool = false) {
    let top = shouldUseSafeTopAnchor ? superview?.safeTopAnchor : superview?.topAnchor
    anchor(top: top, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
  }
  
  func center(to view: UIView, mode: CenterMode, size: CGSize = .zero, constant: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if mode == .horizontally {
      centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    } else {
      centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
  }
  
  func setWidthConstraint(to constant: CGFloat) {
    if let constraint = self.constraints.filter({ $0.firstAttribute == .width }).first {
      constraint.constant = constant
    } else {
      widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
  }
  
  func setHeightConstraint(to constant: CGFloat) {
    if let constraint = self.constraints.filter({ $0.firstAttribute == .height }).first {
      constraint.constant = constant
    } else {
      heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
  }
  
  func disableConstraint(attribute: NSLayoutConstraint.Attribute) {
    guard let constraint = self.constraints.filter({ $0.firstAttribute == attribute }).first else {
      print("No Constraint found")
      return
    }
    
    constraint.isActive = false
  }
  
  func updateConstraintConstant(to constant: CGFloat, attribute: NSLayoutConstraint.Attribute) {
    let filteredConstraints = self.constraints.filter({ $0.firstAttribute == attribute })
    for constraint in filteredConstraints {
      constraint.constant = constant
    }
  }
  
  func addLeadingConstraint(from anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> NSLayoutConstraint {
    let leadingConstraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
    leadingConstraint.isActive = true
    return leadingConstraint
  }
  
  func addTrailingConstraint(from anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> NSLayoutConstraint {
    let trailingConstraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
    trailingConstraint.isActive = true
    return trailingConstraint
  }
  
  func addTopAnchor(anchor: NSLayoutYAxisAnchor, value: CGFloat) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    let constraint = topAnchor.constraint(equalTo: anchor, constant: value)
    constraint.isActive = true
    return constraint
  }
  
  func addBottomAnchor(anchor: NSLayoutYAxisAnchor, value: CGFloat) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    let constraint = bottomAnchor.constraint(equalTo: anchor, constant: -value)
    constraint.isActive = true
    return constraint
  }
  
  func anchorSize(to view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
  }
  
  func anchorSize(size: CGSize) {
    translatesAutoresizingMaskIntoConstraints = false
    
    widthAnchor.constraint(equalToConstant: size.width).isActive = true
    heightAnchor.constraint(equalToConstant: size.height).isActive = true
    
  }
  
  /**
   Set the aspect ratio for view. Default is 1:1 (1.0)
   
   @param ratio percentage ratio. For 5:1 use 1.0/5.0
   */
  func aspectRatio(ratio: CGFloat = 1.0) {
    translatesAutoresizingMaskIntoConstraints = false
    
    _ = heightAnchor.constraint(equalTo: widthAnchor, multiplier: ratio)
    _ = widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio)
  }
  
  func anchorGreaterThanOrEqualTo(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(greaterThanOrEqualTo: top, constant: padding.top).isActive = true
    }
    
    if let leading = leading {
      leadingAnchor.constraint(greaterThanOrEqualTo: leading, constant: padding.left).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(greaterThanOrEqualTo: bottom, constant: -padding.bottom).isActive = true
    }
    
    if let trailing = trailing {
      trailingAnchor.constraint(greaterThanOrEqualTo: trailing, constant: -padding.right).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(greaterThanOrEqualToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(greaterThanOrEqualToConstant: size.height).isActive = true
    }
  }
  
  func anchorLessThanOrEqualTo(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(lessThanOrEqualTo: top, constant: padding.top).isActive = true
    }
    
    if let leading = leading {
      leadingAnchor.constraint(lessThanOrEqualTo: leading, constant: padding.left).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -padding.bottom).isActive = true
    }
    
    if let trailing = trailing {
      trailingAnchor.constraint(lessThanOrEqualTo: trailing, constant: -padding.right).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(lessThanOrEqualToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(lessThanOrEqualToConstant: size.height).isActive = true
    }
  }
  
  func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
    }
    
    if let leading = leading {
      leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
    }
    
    if let trailing = trailing {
      trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
  }
  
  func centerInParent(horizontal: NSLayoutXAxisAnchor?, vertical: NSLayoutYAxisAnchor?, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    if let horizontal = horizontal {
      centerXAnchor.constraint(equalTo: horizontal, constant: xOffset).isActive = true
    }
    if let vertical = vertical {
      centerYAnchor.constraint(equalTo: vertical, constant: yOffset).isActive = true
    }
  }
  
  func stackChild(under topView: UIView, child: UIView, padding: UIEdgeInsets, size: CGSize = .zero) {
    addSubview(child)
    child.anchor(top: topView.bottomAnchor,
                 leading: leadingAnchor,
                 bottom: nil,
                 trailing: trailingAnchor,
                 padding: padding,
                 size: size)
  }
  
  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.topAnchor
    }
    return topAnchor
  }
  
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.bottomAnchor
    }
    return bottomAnchor
  }
  
  func clearConstraints() {
    var superview = self.superview
    
    while let view = superview {
      for constraint in view.constraints {
        
        if let first = constraint.firstItem as? UIView, first == self {
          view.removeConstraint(constraint)
        }
        
        if let second = constraint.secondItem as? UIView, second == self {
          view.removeConstraint(constraint)
        }
      }
      
      superview = view.superview
    }
    
    self.removeConstraints(self.constraints)
    self.translatesAutoresizingMaskIntoConstraints = true
  }
  
  /**
   Updates the constraints priority.
   - Note: If set to 0, no constraint is added, used for example if we want to block the automatic constraints aded when the UIImage in a UIImageView is updated
   */
  func setConstraintsPriority(to newPriority: Float) {
    if newPriority < 0 || newPriority > 1000 {
      print("Priorities should be float values between 0 and 1000")
      return
    }
    self.setContentHuggingPriority(UILayoutPriority(rawValue: newPriority), for: .horizontal)
    self.setContentCompressionResistancePriority(UILayoutPriority(rawValue: newPriority), for: .horizontal)
    self.setContentHuggingPriority(UILayoutPriority(rawValue: newPriority), for: .vertical)
    self.setContentCompressionResistancePriority(UILayoutPriority(rawValue: newPriority), for: .vertical)
  }
  
  var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return self.bottomAnchor
    } else {
      return self.safeBottomAnchor
    }
  }
}

