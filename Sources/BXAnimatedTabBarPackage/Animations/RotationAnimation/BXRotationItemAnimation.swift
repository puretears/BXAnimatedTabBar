import QuartzCore // 2D animation apis
import UIKit

/// The RAMRotationAnimation class provides rotation animation.
open class BXRotationItemAnimation: BXItemAnimation {

  /**
   Animation direction

   - Left:  left direction
   - Right: right direction
   */
  public enum BXRotationDirection {
    case left
    case right
  }

  /// Animation direction (left, right)
  open var direction: BXRotationDirection!

  /**
   Start animation, method call when UITabBarItem is selected

   - parameter icon:      animating UITabBarItem icon
   - parameter textLabel: animating UITabBarItem textLabel
   */
  open override func selectAnimation(_ icon: UIImageView, label: UILabel) {
    playRoatationAnimation(icon)
    selectedState(icon, label: label)
  }

  /**
   Start animation, method call when UITabBarItem is unselected

   - parameter icon:      animating UITabBarItem icon
   - parameter textLabel: animating UITabBarItem textLabel
   - parameter defaultTextColor: default UITabBarItem text color
   - parameter defaultIconColor: default UITabBarItem icon color
   */
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

  /**
   Method call when TabBarController did load

   - parameter icon:      animating UITabBarItem icon
   - parameter textLabel: animating UITabBarItem textLabel
   */
  open override func selectedState(_ icon: UIImageView, label: UILabel) {
    label.textColor = textSelectedColor

    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = iconSelectedColor
    }
  }

  func playRoatationAnimation(_ icon: UIImageView) {
    let rotateAnimation = CABasicAnimation(keyPath: AnimationKeys.rotation)
    rotateAnimation.fromValue = 0.0

    var toValue = CGFloat.pi * 2
    if direction != nil && direction == BXRotationDirection.left {
        toValue = toValue * -1.0
    }

    rotateAnimation.toValue = toValue
    rotateAnimation.duration = TimeInterval(duration)

    icon.layer.add(rotateAnimation, forKey: nil)
  }
}

/// The RAMLeftRotationAnimation class provides letf rotation animation.
open class BXLeftRotationAnimation: BXRotationItemAnimation {
  public override init() {
    super.init()
    direction = BXRotationDirection.left
  }
}

/// The RAMRightRotationAnimation class provides rigth rotation animation.
open class BXRightRotationAnimation: BXRotationItemAnimation {
  public override init() {
    super.init()
    direction = BXRotationDirection.right
  }
}
