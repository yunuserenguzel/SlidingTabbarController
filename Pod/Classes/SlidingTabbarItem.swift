//
//  SlidingTabbarItem.swift
//  SlidingTabbarController
//
//  Created by Yunus Eren Guzel on 13/02/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

public struct SlidingTabbarItem {
  
  public var image: UIImage
  public var highlightedImage: UIImage
  public var title: String?
  public var controller: UIViewController

  public init(image: UIImage, highlightedImage: UIImage, title: String? = nil, controller: UIViewController) {
    self.image = image
    self.controller = controller
    self.title = title
    self.highlightedImage = highlightedImage
  }
  
}