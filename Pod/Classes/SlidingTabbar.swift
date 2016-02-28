//
//  SlidingTabbar.swift
//  SlidingTabbarController
//
//  Created by Yunus Eren Guzel on 13/02/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

public class SlidingTabbar: UIView, UIScrollViewDelegate {
  
  public let maxNumberOfVisibleItems = 5
  public let interItemSpace: CGFloat = 8
  public override var tintColor: UIColor! {
    didSet {
      backgroundColor = tintColor
    }
  }

  var items = [SlidingTabbarItem]() {
    didSet {
      configureViews()
    }
  }
  
  internal var tabbarDelegate: SlidingTabbarDelegate?
  private let topBorder = UIView()
  private let scrollView = UIScrollView()

  internal var views: [SlidingTabbarItemView]?
  private var itemSize: CGSize {
    return CGSize(width: frame.width / CGFloat(min(items.count, maxNumberOfVisibleItems)), height: frame.height)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initViews()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initViews()
  }
  
  private func initViews() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.delegate = self
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    addSubview(scrollView)
    
    topBorder.translatesAutoresizingMaskIntoConstraints = false
    topBorder.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.10)
    addSubview(topBorder)
    let views = [
      "scroll": scrollView,
      "view": self,
      "topBorder": topBorder
    ]
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:|[scroll(view)]|", options: [], metrics: nil, views: views))
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("V:|[scroll(view)]|", options: [], metrics: nil, views: views))
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:|[topBorder]|", options: [], metrics: nil, views: views))
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("V:|[topBorder(1)]", options: [], metrics: nil, views: views))
    backgroundColor = UIColor.whiteColor()
  }
  
  private func configureViews() {
    views = items.map {
      let view = SlidingTabbarItemView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "selectItem:"))
      view.image = $0.image
      view.highlightImage = $0.highlightedImage
      view.title = $0.title
      view.titleLabel.textColor = self.tabbarDelegate?.tabbarItemViewTitleColor()
      scrollView.addSubview(view)
      return view
    }
    setNeedsLayout()
    layoutIfNeeded()
    views?.first?.selected = true
  }
  
  func selectItem(tapGesture: UITapGestureRecognizer) {
    guard let views = views, itemView = tapGesture.view as? SlidingTabbarItemView, index = views.indexOf(itemView) else { return }
    views.forEach { $0.selected = false }
    itemView.selected = true
    tabbarDelegate?.itemSelected(index)
    UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: {
      var x = itemView.center.x - self.scrollView.frame.width * 0.5
      x = min(self.scrollView.contentSize.width - self.scrollView.frame.width, x)
      self.scrollView.contentOffset = CGPoint(x: max(x, 0), y:0)
      }, completion: nil)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    let size = itemSize
    scrollView.removeConstraints(scrollView.constraints)
    guard self.views != nil && self.views!.count > 0 else { return }
    var views: [String: UIView] = ["scrollView": scrollView]
    var horizontalFormat = "H:|"
    self.views!.forEach {
      let key = "item\(self.views!.indexOf($0)!)"
      views[key] = $0
      horizontalFormat += "[\(key)(\(size.width))]-0-"
      scrollView.addConstraints(NSLayoutConstraint
        .constraintsWithVisualFormat("V:|[\(key)(==scrollView)]|", options: [], metrics: nil, views: views))
    }
    horizontalFormat += "|"
    scrollView.addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat(horizontalFormat, options: [], metrics: nil, views: views))
  }
  
}
