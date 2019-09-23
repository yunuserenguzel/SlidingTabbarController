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

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

