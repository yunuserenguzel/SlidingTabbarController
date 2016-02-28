//
//  SlidingTabbarController.swift
//  SlidingTabbarController
//
//  Created by Yunus Eren Guzel on 13/02/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

internal protocol SlidingTabbarDelegate {
  func itemSelected(index: Int)
  func tabbarItemViewTitleColor() -> UIColor
}



public class SlidingTabbarController: UIViewController, SlidingTabbarDelegate {
  public let tabbar = SlidingTabbar()
  public var items: [SlidingTabbarItem]? {
    didSet {
      configureViews()
    }
  }
  public var selectedIndex: Int = 0 {
    didSet {
      replaceViewController(viewControllerAtIndex(oldValue), newController: viewControllerAtIndex(selectedIndex))
    }
  }
  public var tabbarHeight: CGFloat = 49 {
    didSet {
      guard isViewLoaded() else { return }
      view.constraints.forEach {
        guard let view = $0.firstItem as? UIView
          where view == tabbar && $0.firstAttribute == .Height else { return }
        $0.constant = tabbarHeight
      }
    }
  }
  public var tabbarTitleColor: UIColor = UIColor.blackColor() {
    didSet {
      tabbar.views?.forEach { $0.titleLabel.textColor = tabbarTitleColor }
    }
  }
  private let container = UIView()
  
  private func configureViews() {
    guard let items = items where isViewLoaded() else { return }
    tabbar.items = items
    selectedIndex = 0
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    tabbar.tabbarDelegate = self
    container.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(container)
    tabbar.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tabbar)
    applyConstraints()
    configureViews()
  }
  
  private func applyConstraints() {
    let views = [
      "container": container,
      "tabbar": tabbar
    ]
    let metrics = ["tabbarHeight": tabbarHeight]
    view.addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:|[tabbar]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:|[container]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("V:|[container][tabbar(tabbarHeight)]|", options: [], metrics: metrics, views: views))
  }
  
  private func replaceViewController(currentController: UIViewController?, newController: UIViewController?) {
    guard let newController = newController else { return }
    currentController?.willMoveToParentViewController(nil)
    container.removeConstraints(container.constraints)
    currentController?.view.removeFromSuperview()
    currentController?.removeFromParentViewController()
    addChildViewController(newController)
    newController.view.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(newController.view)
    
    let views = [ "view": newController.view ]
    container.addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:|[view]|", options: [], metrics: nil, views: views))
    container.addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("V:|[view]|", options: [], metrics: nil, views: views))
    newController.didMoveToParentViewController(self)
    
  }
  
  public func viewControllerAtIndex(index: Int) -> UIViewController? {
    guard let items = items where index >= 0 && index < items.count else { return nil }
    return items[index].controller
  }
  
  internal func itemSelected(index: Int) {
    selectedIndex = index
  }
  
  internal func tabbarItemViewTitleColor() -> UIColor {
    return tabbarTitleColor
  }
}

