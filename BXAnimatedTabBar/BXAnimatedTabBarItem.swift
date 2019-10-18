//
//  BxTabBarItem.swift
//  BXAnimatedTabBar
//
//  Created by Mars on 2019/9/8.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

/// `UITabBarItem` with animation
open class BXAnimatedTabBarItem: UITabBarItem {
  open var yOffset: CGFloat = 0
  
  /// Animation for `UITabBarItem`, use animations under *Animations* directory.
  open var animation: BXItemAnimation!
  
  open var textColor: UIColor = .secondaryLabel
  /// The font used to render the UITabBarItem text.
  open var textFont: UIFont = UIFont.systemFont(ofSize: 10.0, weight: .medium)
  
  open var yOffSet: CGFloat = 0
  
  open var iconColor: UIColor = .secondaryLabel
  
  open var bgDefaultColor: UIColor = .clear
  open var bgSelectedColor: UIColor = .clear
  
  open var iconView: (icon: UIImageView, label: UILabel)?
  
  open var badge: BXBadge?
  
  open func selectAnimation() {
    guard let animation = animation, let iconView = iconView else { return }
    
    animation.selectAnimation(iconView.icon, label: iconView.label)
  }
  
  open func deselectAnimation() {
    guard let animation = animation, let iconView = iconView else { return }
    
    animation.deselectAnimation(
      iconView.icon, label: iconView.label,
      defaultIconColor: iconColor, defaultTextColor: textColor)
  }
  
  open func selectedState() {
    guard let animation = animation, let iconView = iconView else { return }
    
    animation.selectedState(iconView.icon, label: iconView.label)
  }
  
  open func deselectedState() {
    guard let animation = animation, let iconView = iconView else { return }
    
    animation.deselectedState(iconView.icon, label: iconView.label)
  }
}

extension BXAnimatedTabBarItem {
  open override var badgeValue: String? {
    get {
      return badge?.text
    }
    set {
      if newValue == nil {
        badge?.removeFromSuperview()
        badge = nil
        
        return
      }
      
      if let iconView = iconView, let containerView = iconView.icon.superview, badge == nil {
        badge = BXBadge.badge()
        badge?.addBadge(onView: containerView)
      }
      
      badge?.text = newValue
    }
  }
}
