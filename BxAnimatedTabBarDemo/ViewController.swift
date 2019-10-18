//
//  ViewController.swift
//  BxAnimatedTabBarDemo
//
//  Created by Mars on 2019/9/8.
//  Copyright © 2019 Mars. All rights reserved.
//

import UIKit
import BXAnimatedTabBar

class MyVC1: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = .blue
  }
}

class MyVC2: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = .red
  }
}

class MyVC3: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = .blue
  }
}

class MyVC4: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = .red
  }
}

class MyVC5: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = .red
  }
}

class ViewController: UIViewController {
  let animatedTabBarController = BXAnimatedTabBarController()
  let myVC1 = MyVC1()
  let myVC2 = MyVC2()
  let myVC3 = MyVC3()
  let myVC4 = MyVC4()
  let myVC5 = MyVC5()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let ci = UIImage.SymbolConfiguration(textStyle: .caption1)
    let hi = UIImage(systemName: "house.fill", withConfiguration: ci)
    let homeTabBarItem       = BXAnimatedTabBarItem(title: "首页", image: hi, tag: 0)
    homeTabBarItem.animation = BXBounceItemAnimation()
    myVC1.tabBarItem = homeTabBarItem
    
    
    let searchTabBarItem     = BXAnimatedTabBarItem(title: "搜索", image: UIImage(systemName: "magnifyingglass"), tag: 0)
    searchTabBarItem.animation = BXFlipLeftTransitionItemAnimation()
    myVC2.tabBarItem = searchTabBarItem
    
    let seriesTabBarItem     = BXAnimatedTabBarItem(title: "视频系列", image: UIImage(systemName: "map.fill"), tag: 0)
    seriesTabBarItem.animation = BXBounceItemAnimation()
    myVC3.tabBarItem = seriesTabBarItem
    
    let blackboardTabBarItem = BXAnimatedTabBarItem(title: "黑板报", image: UIImage(systemName: "pencil.and.outline"), tag: 0)
    blackboardTabBarItem.animation = BXFlipRightTransitionItemAnimation()
    myVC4.tabBarItem = blackboardTabBarItem
    
    let accountTabBarItem    = BXAnimatedTabBarItem(title: "我的泊学", image: UIImage(systemName: "person.crop.circle.fill"), tag: 0)
    accountTabBarItem.animation = BXRightRotationAnimation()
    myVC5.tabBarItem = accountTabBarItem
    
    animatedTabBarController.viewControllers = [myVC1, myVC2, myVC3, myVC4, myVC5]
    
    homeTabBarItem.badgeValue = "New"
    
    let bg = BXBadge(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
    bg.text = ""
    bg.addBadge(onView: seriesTabBarItem.iconView!.icon)
    
    addChild(animatedTabBarController)
    animatedTabBarController.view.frame = view.frame
    view.addSubview(animatedTabBarController.view)
    animatedTabBarController.didMove(toParent: self)
    
    DispatchQueue.global().async {
      sleep(4)

//      DispatchQueue.main.async {
//        self.animatedTabBarController.tabBarHidden(true, animated: true)
//      }
    }
  }
}
