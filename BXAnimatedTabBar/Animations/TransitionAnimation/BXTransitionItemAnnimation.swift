//
//  BXTransitionAnnimation.swift
//  BXAnimatedTabBar
//
//  Created by Mars on 2019/9/9.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

open class BXTransitionItemAnimation: BXItemAnimation {
  open var transitionOptions = UIView.AnimationOptions()
  
  /// MARK: methods
  
  /// Start animation when the tab item is selected.
  ///
  /// - parameter icon: animating `UITabBarItem` icon
  /// - parameter label: animating `UITabBarItem` label
  open override func selectAnimation(_ icon: UIImageView, label: UILabel) {
    selectedState(icon, label: label)
    
    UIView.transition(with: icon, duration: TimeInterval(duration), options: transitionOptions, animations: {}, completion: { _ in })
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
    if let iconImage = icon.image {
      let renderMode: UIImage.RenderingMode =
        defaultIconColor.cgColor.alpha == 0 ? .alwaysOriginal : .alwaysTemplate
      let renderImage = iconImage.withRenderingMode(renderMode)
      
      icon.image = renderImage
      icon.tintColor = defaultIconColor
    }
    
    label.textColor = defaultTextColor
  }
  
  /// Set selected state without animation
  ///
  /// - parameter icon: the selected `UITabBarItem` icon
  /// - parameter label: the selected `UITabBarItem` label
  open override func selectedState(_ icon: UIImageView, label: UILabel) {
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = iconSelectedColor
    }
    
    label.textColor = textSelectedColor
  }
  
  /// (Optional) Set deselected state without animation
  /// - parameter icon:  animating UITabBarItem icon
  /// - parameter label: animating UITabBarItem textLabel
  open override func deselectedState(_ icon: UIImageView, label _: UILabel) {}
}

open class BXFlipLeftTransitionItemAnimation: BXTransitionItemAnimation {
  public override init() {
    super.init()
    
    transitionOptions = .transitionFlipFromLeft
  }
}

open class BXFlipRightTransitionItemAnimation: BXTransitionItemAnimation {
  public override init() {
    super.init()
    
    transitionOptions = .transitionFlipFromRight
  }
}

open class BXFlipTopTransitionItemAnimation: BXTransitionItemAnimation {
  public override init() {
    super.init()
    
    transitionOptions = .transitionFlipFromTop
  }
}

open class BXFlipBottomTransitionItemAnimation: BXTransitionItemAnimation {
  public override init() {
    super.init()
    
    transitionOptions = .transitionFlipFromBottom
  }
}

