Pod::Spec.new do |s|
  s.name             = "SlidingTabbarController"
  s.version          = "0.1.0"
  s.summary          = "Scrollable SlidingTabbarController for iOS."
  s.homepage         = "https://github.com/yunuserenguzel/SlidingTabbarController"
  s.license          = 'MIT'
  s.author           = { "Yunus Eren Güzel" => "yunuserenguzel@gmail.com" }
  s.source           = { :git => "https://github.com/yunuserenguzel/SlidingTabbarController.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SlidingTabbarController' => ['Pod/Assets/*.png']
  }

end
