//
//  BXBounceAnimation.swift
//  BXAnimatedTabBar
//
//  Created by Mars on 2019/9/8.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

open class BXBounceItemAnimation: BXItemAnimation {
  /// Start animation when the tab item is selected.
  ///
  /// - parameter icon: animating `UITabBarItem` icon
  /// - parameter label: animating `UITabBarItem` label
  open override func selectAnimation(_ icon: UIImageView, label: UILabel) {
    playBounceAnimation(icon)
    selectedState(icon, label: label)
  }
  
  /// Start animation when the tab item is deselected.
  ///
  /// - parameter icon: animating `UITabBarItem` icon
  /// - parameter label: animating `UITabBarItem` label
  /// - parameter defaultIconColor: default icon color
  /// - parameter defaultTextColor: default label color
  open override func deselectAnimation(
    _ icon: UIImageView, label: UILabel,
    defaultIconColor: UIColor, defaultTextColor: UIColor) {
    label.textColor = defaultTextColor
    
    if let iconImage = icon.image {
      let renderMode: UIImage.RenderingMode =
        defaultIconColor.cgColor.alpha == 0 ? .alwaysOriginal : .alwaysTemplate
      let renderImage = iconImage.withRenderingMode(renderMode)
      icon.image = renderImage
      icon.tintColor = defaultIconColor
    }
  }
  
  /// Set selected state without animation
  ///
  /// - parameter icon: the selected `UITabBarItem` icon
  /// - parameter label: the selected `UITabBarItem` label
  open override func selectedState(_ icon: UIImageView, label: UILabel) {
    label.textColor = textSelectedColor
    
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = iconSelectedColor
    }
  }
  
  func playBounceAnimation(_ icon: UIImageView) {
    let bounceAnimation = CAKeyframeAnimation(keyPath: AnimationKeys.scale)
    bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
    bounceAnimation.duration = TimeInterval(duration)
    bounceAnimation.calculationMode = .cubic
    
    icon.layer.add(bounceAnimation, forKey: nil)
  }
}
