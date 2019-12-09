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
      replaceViewController(currentController: viewControllerAtIndex(index: oldValue), newController: viewControllerAtIndex(index: selectedIndex))
    }
  }
  public var tabbarHeight: CGFloat = 49 {
    didSet {
      guard isViewLoaded else { return }
      view.constraints.forEach {
        guard let view = $0.firstItem as? UIView, view == tabbar && $0.firstAttribute == .height else { return }
        $0.constant = tabbarHeight
      }
    }
  }
  public var tabbarTitleColor: UIColor = UIColor.black {
    didSet {
      tabbar.views?.forEach { $0.titleLabel.textColor = tabbarTitleColor }
    }
  }
  private let container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  private func configureViews() {
    guard let items = items, isViewLoaded else { return }
    tabbar.items = items
    selectedIndex = 0
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.view.backgroundColor = .white
    tabbar.tabbarDelegate = self
    container.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(container)
    tabbar.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tabbar)
    applyConstraints()
    configureViews()
  }
  
  private func applyConstraints() {
    let views: [String : Any] = [
      "container": container,
      "tabbar": tabbar,
      "bottom": bottomLayoutGuide
      ]
    let metrics = ["tabbarHeight": tabbarHeight]
    view.addConstraints(NSLayoutConstraint
      .constraints(withVisualFormat: "H:|[tabbar]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint
      .constraints(withVisualFormat: "H:|[container]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint
      .constraints(withVisualFormat: "V:|[container][tabbar(tabbarHeight)][bottom]", options: [], metrics: metrics, views: views))
  }
  
  private func replaceViewController(currentController: UIViewController?, newController: UIViewController?) {
    guard let newController = newController else { return }
    currentController?.willMove(toParentViewController: nil)
    container.removeConstraints(container.constraints)
    currentController?.view.removeFromSuperview()
    currentController?.removeFromParentViewController()
    addChildViewController(newController)
    newController.view.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(newController.view)
    
    let views: [String: Any] = [ "view": newController.view ]
    container.addConstraints(NSLayoutConstraint
      .constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: views))
    container.addConstraints(NSLayoutConstraint
      .constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: views))
    newController.didMove(toParentViewController: self)
    
  }
  
  public func viewControllerAtIndex(index: Int) -> UIViewController? {
    guard let items = items, index >= 0 && index < items.count else { return nil }
    return items[index].controller
  }
  
  internal func itemSelected(index: Int) {
    selectedIndex = index
  }
  
  internal func tabbarItemViewTitleColor() -> UIColor {
    return tabbarTitleColor
  }
}

