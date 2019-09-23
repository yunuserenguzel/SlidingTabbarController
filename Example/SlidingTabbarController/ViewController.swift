//
//  ViewController.swift
//  SlidingTabbarExample
//
//  Created by Yunus Eren Guzel on 18/02/16.
//  Copyright © 2016 yeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let imageView = UIImageView()
  
  convenience init(imageName: String) {
    self.init()
    imageView.image = UIImage(named: imageName)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.contentMode = .scaleAspectFill
    view.addSubview(imageView)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    imageView.frame = view.bounds
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

