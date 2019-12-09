//
//  AppDelegate.swift
//  SlidingTabbarExample
//
//  Created by Yunus Eren Guzel on 18/02/16.
//  Copyright © 2016 yeg. All rights reserved.
//

import UIKit
import SlidingTabbarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    let slidingTabbarController = SlidingTabbarController()
    slidingTabbarController.items = [
      SlidingTabbarItem(image: UIImage(named: "alligator")!,
        highlightedImage: UIImage(named: "alligator_filled")!,
        title: "Alligator",
        controller: ViewController(imageName: "alligator_large")),
      SlidingTabbarItem(image: UIImage(named: "ant")!,
        highlightedImage: UIImage(named: "ant_filled")!,
        title: "Ant",
        controller: ViewController(imageName: "ant_large")),
      SlidingTabbarItem(image: UIImage(named: "bat_face")!,
        highlightedImage: UIImage(named: "bat_face_filled")!,
        title: "Bat",
        controller: ViewController(imageName: "bat_large")),
      SlidingTabbarItem(image: UIImage(named: "bear")!,
        highlightedImage: UIImage(named: "bear_filled")!,
        title: "Bear",
        controller: ViewController(imageName: "bear_large")),
      SlidingTabbarItem(image: UIImage(named: "beaver")!,
        highlightedImage: UIImage(named: "beaver_filled")!,
        title: "Beaver",
        controller: ViewController(imageName: "beaver_large")),
      SlidingTabbarItem(image: UIImage(named: "bee")!,
        highlightedImage: UIImage(named: "bee_filled")!,
        title: "Bee",
        controller: ViewController(imageName: "bee_large")),
      SlidingTabbarItem(image: UIImage(named: "bird")!,
        highlightedImage: UIImage(named: "bird_filled")!,
        title: "Bird",
        controller: ViewController(imageName: "bird_large")),
      ]
    slidingTabbarController.tabbarTitleColor = UIColor.gray
    self.window?.rootViewController = slidingTabbarController
    return true
  }

}

