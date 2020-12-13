//
//  BXItemAnimationProtocol.swift
//  BXAnimatedTabBar
//
//  Created by Mars on 2019/9/8.
//  Copyright © 2019 Mars. All rights reserved.
//

import Foundation
import UIKit

public protocol BXItemAnimationProtocol {
  func selectAnimation(_ icon: UIImageView, label: UILabel)
  func deselectAnimation(_ icon: UIImageView, label: UILabel, defaultIconColor: UIColor, defaultTextColor: UIColor)
  func selectedState(_ icon: UIImageView, label: UILabel)
}

open class BXItemAnimation: NSObject, BXItemAnimationProtocol {
  
  /// MARK: constants
  
  struct AnimationKeys {
    static let scale = "transform.scale"
    static let rotation = "transform.rotation"
    static let keyFrame = "contents"
    static let positionY = "position.y"
    static let opacity = "opacity"
  }
  
  /// MARK: properties
  
  open var duration: CGFloat = 0.5
  
  open var textSelectedColor = UIColor.systemBlue
  open var iconSelectedColor = UIColor.systemBlue
  
  /// MARK: methods
  
  /// Start animation when the tab item is selected.
  ///
  /// - parameter icon: animating `UITabBarItem` icon
  /// - parameter label: animating `UITabBarItem` label
  open func selectAnimation(_ icon: UIImageView, label: UILabel) {
    fatalError("Override this method in subclass.")
  }
  
  /// Start animation when the tab item is deselected.
  ///
  /// - parameter icon: animating `UITabBarItem` icon
  /// - parameter label: animating `UITabBarItem` label
  /// - parameter defaultIconColor: default icon color
  /// - parameter defaultTextColor: default label color
  open func deselectAnimation(
    _ icon: UIImageView, label: UILabel,
    defaultIconColor: UIColor, defaultTextColor: UIColor) {
    fatalError("Override this method in subclass.")
  }
  
  /// Set selected state without animation
  ///
  /// - parameter icon: the selected `UITabBarItem` icon
  /// - parameter label: the selected `UITabBarItem` label
  open func selectedState(_ icon: UIImageView, label: UILabel) {
    fatalError("Override this method in subclass.")
  }
  
  /// (Optional) Set deselected state without animation
  /// - parameter icon:  animating UITabBarItem icon
  /// - parameter label: animating UITabBarItem textLabel
  open func deselectedState(_ icon: UIImageView, label _: UILabel) {}
}
