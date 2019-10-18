//
//  BXBadge.swift
//  BXAnimatedTabBar
//
//  Created by Mars on 2019/10/18.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit

open class BXBadge: UILabel {
  
  open class func badge() -> BXBadge {
    return BXBadge(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    layer.backgroundColor = UIColor.systemRed.cgColor
    layer.cornerRadius = frame.size.width / 2
    
    configureNumberLabel()
    activateConstraints()
  }
  
  open override func layoutSubviews() {
//    activateConstraints()
  }
  
  open override var intrinsicContentSize: CGSize {
    var contentSize = super.intrinsicContentSize
    contentSize.width += 10
    return contentSize
  }
  
  open func addBadge(onView: UIView) {
    onView.addSubview(self)
    
    let top = self.topAnchor.constraint(equalTo: onView.topAnchor, constant: 3)
    let centerX = self.centerXAnchor.constraint(equalTo: onView.centerXAnchor, constant: 10)

    NSLayoutConstraint.activate([top, centerX])
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }
  
  func configureNumberLabel() {
    textAlignment = .center
    font = .preferredFont(forTextStyle: .caption1)
    textColor = .white
  }
  
  func activateConstraints() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    let width = self.widthAnchor.constraint(greaterThanOrEqualToConstant: frame.size.width)
    let height = self.heightAnchor.constraint(equalToConstant: frame.size.height)

    NSLayoutConstraint.activate([width, height])
  }
}
