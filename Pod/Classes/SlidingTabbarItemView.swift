//
//  SlidingTabbarItemView.swift
//  SlidingTabbarController
//
//  Created by Yunus Eren Guzel on 13/02/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

internal class SlidingTabbarItemView: UIView {
  var image: UIImage? {
    didSet {
      imageView.image = image
    }
  }
  var highlightImage: UIImage? {
    didSet {
      imageView.highlightedImage = highlightImage
    }
  }
  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }
  var selected: Bool = false {
    didSet {
      imageView.highlighted = selected
    }
  }
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.clipsToBounds = true
    imageView.contentMode = .Center
    return imageView
  }()
  let titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.systemFontOfSize(10)
    titleLabel.textColor = UIColor.blackColor()
    titleLabel.textAlignment = .Center
    return titleLabel
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViews()
  }
  
  func setupViews() {
    addSubview(imageView)
    addSubview(titleLabel)
    let views = [
      "imageView": imageView,
      "titleLabel": titleLabel
    ]
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:[imageView]", options: [], metrics: nil, views: views))
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("H:|[titleLabel]|", options: [], metrics: nil, views: views))
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
    addConstraints(NSLayoutConstraint
      .constraintsWithVisualFormat("V:|[imageView][titleLabel]-3-|", options: [], metrics: nil, views: views))
  }
}