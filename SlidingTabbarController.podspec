Pod::Spec.new do |s|
  s.name             = "SlidingTabbarController"
  s.version          = "0.2.0"
  s.summary          = "Scrollable SlidingTabbarController for iOS."
  s.homepage         = "https://github.com/yunuserenguzel/SlidingTabbarController"
  s.license          = 'MIT'
  s.author           = { "Yunus Eren Güzel" => "yunuserenguzel@gmail.com" }
  s.source           = { :git => "https://github.com/yunuserenguzel/SlidingTabbarController.git", :tag => s.version.to_s }

  s.platform         = :ios, '8.0'
  s.requires_arc     = true
  s.swift_version    = "4.0"

  s.source_files     = 'Pod/Classes/**/*'

end
