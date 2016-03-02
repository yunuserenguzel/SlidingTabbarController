# SlidingTabbarController
Scrollable SlidingTabbarController for iOS

Are you limited to UITabbar's item count?
Do you want to impress your customers?

Don't restrict your app to use side menu when you have too many menu items.
Use SlidingTabbarController to have smart tab bar on your apps.

![demo](https://github.com/yunuserenguzel/sliding-tabbar-controller/blob/master/sliding_tabbar_demo.gif)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SlidingTabbarController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SlidingTabbarController'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you don't want to use CocoaPods you can manually add SlidingTabbarController to your project. Copy swift classes inside Pod/Classes folder and add to your XCode project.

## How to use

Using SlidingTabbarController is easy. 

* Go to applicationDidFinishLaunchingWithOptions method inside your project's AppDelegate
```Swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  
  ...
  
  return true
}
```

* Create a SlidingTabbarController instance,
```Swift
let slidingTabbarController = SlidingTabbarController()
```

* Set the items
```Swift
slidingTabbarController.items = [
  SlidingTabbarItem(image: UIImage(named: "alligator")!,
    highlightedImage: UIImage(named: "alligator_filled")!,
    title: "Alligator",
    controller: ViewController(imageName: "alligator_large")),
  SlidingTabbarItem(image: UIImage(named: "bird")!,
    highlightedImage: UIImage(named: "bird_filled")!,
    title: "Bird",
    controller: ViewController(imageName: "bird_large"))
  ]
```

* Create a window and make SlidingTabbarController be window's rootViewController
```Swift
window = UIWindow(frame: UIScreen.mainScreen().bounds)
window!.makeKeyAndVisible()
window!.rootViewController = slidingTabbarController
```
That is it!

#### What is SlidingTabbarItem?
SlidingTabbarItem consists of three major elements an image, a title and a controller. Image and title are for showing the corresponding button on the tabbar for the controller. Also, there is highlightedImage to indicate which controller is selected and shown on the screen.

```Swift
var slidingTabbarItem = SlidingTabbarItem()
item.image = UIImage(named: "show_me_when_passive")
item.highlightedImage = UIImage(named: "show_me_when_active")
item.title = "describe_the_controller"
item.controller = UIViewController() //the content you want to show
```
